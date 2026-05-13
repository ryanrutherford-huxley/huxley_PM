@IsTest
private class PendingPortalRequestProcessorTest {
    // Jira: SF-11
    // Verifies the main queue outcomes so retry behavior stays predictable as the implementation evolves.

    private class SuccessMock implements HttpCalloutMock {
        public HttpResponse respond(HttpRequest request) {
            assertExpectedRequest(request);

            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setBody('{"result":"ok"}');
            return response;
        }
    }

    private class RetryableFailureMock implements HttpCalloutMock {
        public HttpResponse respond(HttpRequest request) {
            assertExpectedRequest(request);

            HttpResponse response = new HttpResponse();
            response.setStatusCode(503);
            response.setBody('Service unavailable');
            return response;
        }
    }

    private class PermanentFailureMock implements HttpCalloutMock {
        public HttpResponse respond(HttpRequest request) {
            assertExpectedRequest(request);

            HttpResponse response = new HttpResponse();
            response.setStatusCode(400);
            response.setBody('Bad request');
            return response;
        }
    }

    private class ExceptionThrowingMock implements HttpCalloutMock {
        public HttpResponse respond(HttpRequest request) {
            assertExpectedRequest(request);
            throw new CalloutException('Read timed out');
        }
    }

    @IsTest
    static void processor_marksSuccessfulRequestsCompleted() {
        Pending_Portal_Requests__c queueRecord = createQueueRecord(0, 5, 'Pending');
        queueRecord.Last_Error__c = 'Old error';
        insert queueRecord;

        Test.setMock(HttpCalloutMock.class, new SuccessMock());

        Test.startTest();
        System.enqueueJob(new PendingPortalRequestProcessor(new List<Id>{ queueRecord.Id }));
        Test.stopTest();

        Pending_Portal_Requests__c updatedRecord = [
            SELECT Status__c, Last_Error__c, Last_Status_Code__c
            FROM Pending_Portal_Requests__c
            WHERE Id = :queueRecord.Id
        ];

        System.assertEquals('Completed', updatedRecord.Status__c);
        System.assertEquals(null, updatedRecord.Last_Error__c);
        System.assertEquals(200, Integer.valueOf(updatedRecord.Last_Status_Code__c));
    }

    @IsTest
    static void processor_retriesRetryableFailuresUntilMaxRetries() {
        Pending_Portal_Requests__c queueRecord = createQueueRecord(1, 5, 'Retrying');
        insert queueRecord;

        Test.setMock(HttpCalloutMock.class, new RetryableFailureMock());

        Datetime beforeRun = System.now();
        Test.startTest();
        System.enqueueJob(new PendingPortalRequestProcessor(new List<Id>{ queueRecord.Id }));
        Test.stopTest();

        Pending_Portal_Requests__c updatedRecord = [
            SELECT Status__c, Retry_Count__c, Next_Attempt__c, Last_Error__c, Last_Status_Code__c
            FROM Pending_Portal_Requests__c
            WHERE Id = :queueRecord.Id
        ];

        System.assertEquals('Retrying', updatedRecord.Status__c);
        System.assertEquals(2, Integer.valueOf(updatedRecord.Retry_Count__c));
        System.assert(updatedRecord.Next_Attempt__c > beforeRun, 'The next attempt should be pushed into the future.');
        System.assertEquals('Service unavailable', updatedRecord.Last_Error__c);
        System.assertEquals(503, Integer.valueOf(updatedRecord.Last_Status_Code__c));
    }

    @IsTest
    static void processor_marksPermanentFailuresDead() {
        Pending_Portal_Requests__c queueRecord = createQueueRecord(0, 5, 'Pending');
        insert queueRecord;

        Test.setMock(HttpCalloutMock.class, new PermanentFailureMock());

        Test.startTest();
        System.enqueueJob(new PendingPortalRequestProcessor(new List<Id>{ queueRecord.Id }));
        Test.stopTest();

        Pending_Portal_Requests__c updatedRecord = [
            SELECT Status__c, Retry_Count__c, Last_Error__c, Last_Status_Code__c
            FROM Pending_Portal_Requests__c
            WHERE Id = :queueRecord.Id
        ];

        System.assertEquals('Dead', updatedRecord.Status__c);
        System.assertEquals(0, Integer.valueOf(updatedRecord.Retry_Count__c));
        System.assertEquals('Bad request', updatedRecord.Last_Error__c);
        System.assertEquals(400, Integer.valueOf(updatedRecord.Last_Status_Code__c));
    }

    @IsTest
    static void processor_marksRetryableFailuresDeadAtRetryLimit() {
        Pending_Portal_Requests__c queueRecord = createQueueRecord(5, 5, 'Retrying');
        insert queueRecord;

        Test.setMock(HttpCalloutMock.class, new RetryableFailureMock());

        Test.startTest();
        System.enqueueJob(new PendingPortalRequestProcessor(new List<Id>{ queueRecord.Id }));
        Test.stopTest();

        Pending_Portal_Requests__c updatedRecord = [
            SELECT Status__c, Retry_Count__c, Last_Status_Code__c
            FROM Pending_Portal_Requests__c
            WHERE Id = :queueRecord.Id
        ];

        System.assertEquals('Dead', updatedRecord.Status__c);
        System.assertEquals(5, Integer.valueOf(updatedRecord.Retry_Count__c));
        System.assertEquals(503, Integer.valueOf(updatedRecord.Last_Status_Code__c));
    }

    @IsTest
    static void processor_retriesCalloutExceptions() {
        Pending_Portal_Requests__c queueRecord = createQueueRecord(0, 5, 'Pending');
        insert queueRecord;

        Test.setMock(HttpCalloutMock.class, new ExceptionThrowingMock());

        Datetime beforeRun = System.now();
        Test.startTest();
        System.enqueueJob(new PendingPortalRequestProcessor(new List<Id>{ queueRecord.Id }));
        Test.stopTest();

        Pending_Portal_Requests__c updatedRecord = [
            SELECT Status__c, Retry_Count__c, Next_Attempt__c, Last_Error__c
            FROM Pending_Portal_Requests__c
            WHERE Id = :queueRecord.Id
        ];

        System.assertEquals('Retrying', updatedRecord.Status__c);
        System.assertEquals(1, Integer.valueOf(updatedRecord.Retry_Count__c));
        System.assert(
            updatedRecord.Next_Attempt__c > beforeRun,
            'A retryable exception should schedule the next attempt in the future.'
        );
        System.assert(updatedRecord.Last_Error__c.contains('Read timed out'));
    }

    @IsTest
    static void processor_ignoresUnknownQueueRecordIds() {
        Pending_Portal_Requests__c queueRecord = createQueueRecord(0, 5, 'Pending');
        insert queueRecord;
        Id deletedRecordId = queueRecord.Id;
        delete queueRecord;

        Test.setMock(HttpCalloutMock.class, new SuccessMock());

        Test.startTest();
        System.enqueueJob(new PendingPortalRequestProcessor(new List<Id>{ deletedRecordId }));
        Test.stopTest();

        System.assert(true, 'The processor should safely ignore queue record IDs that do not exist.');
    }

    private static Pending_Portal_Requests__c createQueueRecord(Integer retryCount, Integer maxRetries, String status) {
        Pending_Portal_Requests__c queueRecord = new Pending_Portal_Requests__c();
        queueRecord.Status__c = status;
        queueRecord.Payload__c = '{"address":"123 Main St"}';
        queueRecord.Endpoint__c = 'callout:Portal_NC/address';
        queueRecord.Retry_Count__c = retryCount;
        queueRecord.Max_Retries__c = maxRetries;
        queueRecord.Next_Attempt__c = System.now().addMinutes(-5);
        queueRecord.Idempotency_Key__c = 'REQ-100-UpdateAddress';
        return queueRecord;
    }

    private static void assertExpectedRequest(HttpRequest request) {
        System.assertEquals('POST', request.getMethod());
        System.assertEquals('callout:Portal_NC/address', request.getEndpoint());
        System.assertEquals('application/json', request.getHeader('Content-Type'));
        System.assertEquals('REQ-100-UpdateAddress', request.getHeader('Idempotency-Key'));
        System.assertEquals('{"address":"123 Main St"}', request.getBody());
    }
}