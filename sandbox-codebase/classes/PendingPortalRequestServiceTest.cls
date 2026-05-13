@IsTest
private class PendingPortalRequestServiceTest {
    // Jira: SF-13
    // Covers queue record creation defaults so Flow and Apex callers get consistent initial state.

    @IsTest
    static void enqueueRequests_setsExpectedDefaults() {
        PendingPortalRequestService.EnqueueRequest requestItem = new PendingPortalRequestService.EnqueueRequest();
        requestItem.payload = '{"address":"123 Main St"}';
        requestItem.endpoint = 'callout:Portal_NC/address';
        requestItem.idempotencyKey = 'REQ-100-UpdateAddress';

        Test.startTest();
        List<PendingPortalRequestService.EnqueueResult> results =
            PendingPortalRequestService.enqueueRequests(new List<PendingPortalRequestService.EnqueueRequest>{ requestItem });
        Test.stopTest();

        System.assertEquals(1, results.size(), 'One queue record should be created.');

        Pending_Portal_Requests__c insertedRecord = [
            SELECT Status__c, Payload__c, Endpoint__c, Retry_Count__c, Max_Retries__c,
                Next_Attempt__c, Idempotency_Key__c
            FROM Pending_Portal_Requests__c
            WHERE Id = :results[0].queueRecordId
        ];

        System.assertEquals('Pending', insertedRecord.Status__c);
        System.assertEquals('{"address":"123 Main St"}', insertedRecord.Payload__c);
        System.assertEquals('callout:Portal_NC/address', insertedRecord.Endpoint__c);
        System.assertEquals(0, Integer.valueOf(insertedRecord.Retry_Count__c));
        System.assertEquals(5, Integer.valueOf(insertedRecord.Max_Retries__c));
        System.assertEquals('REQ-100-UpdateAddress', insertedRecord.Idempotency_Key__c);
        System.assertNotEquals(null, insertedRecord.Next_Attempt__c);
    }

    @IsTest
    static void enqueueRequests_requiresIdempotencyKey() {
        PendingPortalRequestService.EnqueueRequest requestItem = new PendingPortalRequestService.EnqueueRequest();
        requestItem.payload = '{"address":"123 Main St"}';
        requestItem.endpoint = 'callout:Portal_NC/address';
        Boolean exceptionThrown = false;

        try {
            PendingPortalRequestService.enqueueRequests(
                new List<PendingPortalRequestService.EnqueueRequest>{ requestItem }
            );
        } catch (Exception ex) {
            exceptionThrown = true;
        }

        System.assert(exceptionThrown, 'An exception should be thrown when the idempotency key is missing.');
    }
}