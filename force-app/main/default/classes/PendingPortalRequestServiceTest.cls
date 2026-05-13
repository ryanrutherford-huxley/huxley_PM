@IsTest
private class PendingPortalRequestServiceTest {
    // Jira: SF-13
    // Covers queue record creation defaults so Apex callers get consistent initial state.

    @IsTest
    static void enqueueCommunicationUpdates_setsExpectedDefaults() {
        Id caseId = '500000000000001';
        Id studyId = 'a00000000000001';
        PendingPortalRequestService.CommunicationUpdateRequest requestItem =
            new PendingPortalRequestService.CommunicationUpdateRequest();
        requestItem.sourceSystem = 'Mogli';
        requestItem.sourceCommunicationId = 'MOGLI-100';
        requestItem.communicationType = 'Text';
        requestItem.communicationBody = 'Participant confirmed the visit window.';
        requestItem.caseId = caseId;
        requestItem.studyId = studyId;

        Test.startTest();
        List<PendingPortalRequestService.EnqueueResult> results =
            PendingPortalRequestService.enqueueCommunicationUpdates(
                new List<PendingPortalRequestService.CommunicationUpdateRequest>{ requestItem }
            );
        Test.stopTest();

        System.assertEquals(1, results.size(), 'One queue record should be created.');

        Pending_Portal_Requests__c insertedRecord = [
            SELECT Status__c, Payload__c, Endpoint__c, Retry_Count__c, Max_Retries__c,
                Next_Attempt__c, Idempotency_Key__c
            FROM Pending_Portal_Requests__c
            WHERE Id = :results[0].queueRecordId
        ];

        System.assertEquals('Pending', insertedRecord.Status__c);
        System.assertEquals('callout:Portal_NC/incoming', insertedRecord.Endpoint__c);
        System.assertEquals(0, Integer.valueOf(insertedRecord.Retry_Count__c));
        System.assertEquals(5, Integer.valueOf(insertedRecord.Max_Retries__c));
        System.assertEquals(
            'CommunicationUpdate:Mogli:MOGLI-100:Text:' + String.valueOf(caseId) + ':' + String.valueOf(studyId),
            insertedRecord.Idempotency_Key__c
        );
        System.assertNotEquals(null, insertedRecord.Next_Attempt__c);

        Map<String, Object> payload = (Map<String, Object>) JSON.deserializeUntyped(insertedRecord.Payload__c);
        Map<String, Object> relatedRecords = (Map<String, Object>) payload.get('relatedRecords');
        System.assertEquals('CommunicationUpdate', payload.get('operation'));
        System.assertEquals('Mogli', payload.get('sourceSystem'));
        System.assertEquals('MOGLI-100', payload.get('sourceCommunicationId'));
        System.assertEquals('Text', payload.get('communicationType'));
        System.assertEquals('Participant confirmed the visit window.', payload.get('communicationBody'));
        System.assertEquals(String.valueOf(caseId), relatedRecords.get('caseId'));
        System.assertEquals(String.valueOf(studyId), relatedRecords.get('studyId'));
    }

    @IsTest
    static void enqueueCommunicationUpdates_requiresRelatedCaseOrStudy() {
        PendingPortalRequestService.CommunicationUpdateRequest requestItem =
            new PendingPortalRequestService.CommunicationUpdateRequest();
        requestItem.sourceSystem = 'Aircall';
        requestItem.sourceCommunicationId = 'CALL-100';
        requestItem.communicationType = 'AISummary';
        requestItem.communicationBody = 'Caller asked for study next steps.';
        Boolean exceptionThrown = false;

        try {
            PendingPortalRequestService.enqueueCommunicationUpdates(
                new List<PendingPortalRequestService.CommunicationUpdateRequest>{ requestItem }
            );
        } catch (Exception ex) {
            exceptionThrown = true;
        }

        System.assert(exceptionThrown, 'An exception should be thrown when no case or study is supplied.');
    }
}
