@IsTest
private class PendingPortalRequestSchedulerTest {
    // Jira: SF-12
    // Confirms the scheduler only hands off records that are ready to be processed.

    private class SuccessMock implements HttpCalloutMock {
        public HttpResponse respond(HttpRequest request) {
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setBody('{"result":"ok"}');
            return response;
        }
    }

    @IsTest
    static void enqueueDueRequests_processesOnlyEligibleQueueRecords() {
        Pending_Portal_Requests__c dueRecord = new Pending_Portal_Requests__c(
            Status__c = 'Pending',
            Payload__c = '{"address":"123 Main St"}',
            Endpoint__c = 'callout:Portal_NC/address',
            Retry_Count__c = 0,
            Max_Retries__c = 5,
            Next_Attempt__c = System.now().addMinutes(-10),
            Idempotency_Key__c = 'REQ-200-UpdateAddress'
        );

        Pending_Portal_Requests__c futureRecord = new Pending_Portal_Requests__c(
            Status__c = 'Pending',
            Payload__c = '{"address":"500 Elm St"}',
            Endpoint__c = 'callout:Portal_NC/address',
            Retry_Count__c = 0,
            Max_Retries__c = 5,
            Next_Attempt__c = System.now().addMinutes(10),
            Idempotency_Key__c = 'REQ-201-UpdateAddress'
        );

        insert new List<Pending_Portal_Requests__c>{ dueRecord, futureRecord };

        Test.setMock(HttpCalloutMock.class, new SuccessMock());

        Test.startTest();
        PendingPortalRequestScheduler.enqueueDueRequests();
        Test.stopTest();

        Map<Id, Pending_Portal_Requests__c> refreshedRecords = new Map<Id, Pending_Portal_Requests__c>([
            SELECT Status__c
            FROM Pending_Portal_Requests__c
            WHERE Id IN :new List<Id>{ dueRecord.Id, futureRecord.Id }
        ]);

        System.assertEquals('Completed', refreshedRecords.get(dueRecord.Id).Status__c);
        System.assertEquals('Pending', refreshedRecords.get(futureRecord.Id).Status__c);
    }
}