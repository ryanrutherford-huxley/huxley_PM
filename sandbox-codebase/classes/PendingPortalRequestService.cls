public with sharing class PendingPortalRequestService {
    // Jira: SF-13
    // Creates queue records from Flow or Apex so outbound work enters the retry pipeline consistently.

    private static final String STATUS_PENDING = 'Pending';
    private static final Integer DEFAULT_MAX_RETRIES = 5;

    public class EnqueueRequest {
        @InvocableVariable(required=true)
        public String payload;

        @InvocableVariable(required=true)
        public String endpoint;

        @InvocableVariable(required=true)
        public String idempotencyKey;

        @InvocableVariable
        public Integer maxRetries;

        @InvocableVariable
        public Datetime nextAttemptAt;
    }

    public class EnqueueResult {
        @InvocableVariable
        public Id queueRecordId;

        @InvocableVariable
        public String status;
    }

    @InvocableMethod(
        label='Create Pending Portal Requests'
        description='Creates Pending_Portal_Requests__c records for outbound processing.'
    )
    public static List<EnqueueResult> enqueueRequests(List<EnqueueRequest> requests) {
        if (requests == null || requests.isEmpty()) {
            return new List<EnqueueResult>();
        }

        List<Pending_Portal_Requests__c> recordsToInsert = new List<Pending_Portal_Requests__c>();
        for (EnqueueRequest requestItem : requests) {
            recordsToInsert.add(buildQueueRecord(requestItem));
        }

        insert recordsToInsert;

        List<EnqueueResult> results = new List<EnqueueResult>();
        for (Pending_Portal_Requests__c insertedRecord : recordsToInsert) {
            EnqueueResult result = new EnqueueResult();
            result.queueRecordId = insertedRecord.Id;
            result.status = insertedRecord.Status__c;
            results.add(result);
        }

        return results;
    }

    public static Id enqueueRequest(String payload, String endpoint, String idempotencyKey) {
        EnqueueRequest requestItem = new EnqueueRequest();
        requestItem.payload = payload;
        requestItem.endpoint = endpoint;
        requestItem.idempotencyKey = idempotencyKey;

        List<EnqueueResult> results = enqueueRequests(new List<EnqueueRequest>{ requestItem });
        return results.isEmpty() ? null : results[0].queueRecordId;
    }

    private static Pending_Portal_Requests__c buildQueueRecord(EnqueueRequest requestItem) {
        if (requestItem == null) {
            throw new AuraHandledException('A queue request is required.');
        }

        if (String.isBlank(requestItem.payload)) {
            throw new AuraHandledException('Payload is required.');
        }

        if (String.isBlank(requestItem.endpoint)) {
            throw new AuraHandledException('Endpoint is required.');
        }

        if (String.isBlank(requestItem.idempotencyKey)) {
            throw new AuraHandledException('Idempotency key is required.');
        }

        Pending_Portal_Requests__c queueRecord = new Pending_Portal_Requests__c();
        queueRecord.Status__c = STATUS_PENDING;
        queueRecord.Payload__c = requestItem.payload;
        queueRecord.Endpoint__c = requestItem.endpoint;
        queueRecord.Retry_Count__c = 0;
        queueRecord.Max_Retries__c = requestItem.maxRetries == null ? DEFAULT_MAX_RETRIES : requestItem.maxRetries;
        queueRecord.Next_Attempt__c = requestItem.nextAttemptAt == null ? System.now() : requestItem.nextAttemptAt;
        queueRecord.Idempotency_Key__c = requestItem.idempotencyKey;
        return queueRecord;
    }
}