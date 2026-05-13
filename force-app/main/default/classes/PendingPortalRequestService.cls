public with sharing class PendingPortalRequestService {
    // Jira: SF-13
    // Creates queue records for outbound communication updates so retry behavior stays consistent.

    private static final String STATUS_PENDING = 'Pending';
    private static final String COMMUNICATION_UPDATE_OPERATION = 'CommunicationUpdate';
    private static final String COMMUNICATIONS_ENDPOINT = 'callout:Portal_NC/incoming';
    private static final Integer DEFAULT_MAX_RETRIES = 5;

    public class CommunicationUpdateRequest {
        public String sourceSystem;

        public String sourceCommunicationId;

        public String communicationType;

        public String communicationBody;

        public Id caseId;

        public Id studyId;

        public Integer maxRetries;

        public Datetime nextAttemptAt;
    }

    public class EnqueueResult {
        public Id queueRecordId;

        public String status;
    }

    public class QueueRequestException extends Exception {}

    public static List<EnqueueResult> enqueueCommunicationUpdates(List<CommunicationUpdateRequest> requests) {
        if (requests == null || requests.isEmpty()) {
            return new List<EnqueueResult>();
        }

        List<Pending_Portal_Requests__c> recordsToInsert = new List<Pending_Portal_Requests__c>();
        for (CommunicationUpdateRequest requestItem : requests) {
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

    public static Id enqueueCommunicationUpdate(CommunicationUpdateRequest requestItem) {
        List<EnqueueResult> results = enqueueCommunicationUpdates(new List<CommunicationUpdateRequest>{ requestItem });
        return results.isEmpty() ? null : results[0].queueRecordId;
    }

    private static Pending_Portal_Requests__c buildQueueRecord(CommunicationUpdateRequest requestItem) {
        if (requestItem == null) {
            throw new QueueRequestException('A communication update request is required.');
        }

        if (String.isBlank(requestItem.sourceSystem)) {
            throw new QueueRequestException('Source system is required.');
        }

        if (String.isBlank(requestItem.sourceCommunicationId)) {
            throw new QueueRequestException('Source communication ID is required.');
        }

        if (String.isBlank(requestItem.communicationType)) {
            throw new QueueRequestException('Communication type is required.');
        }

        if (String.isBlank(requestItem.communicationBody)) {
            throw new QueueRequestException('Communication body is required.');
        }

        if (requestItem.caseId == null && requestItem.studyId == null) {
            throw new QueueRequestException('A case ID or study ID is required.');
        }

        Pending_Portal_Requests__c queueRecord = new Pending_Portal_Requests__c();
        queueRecord.Status__c = STATUS_PENDING;
        queueRecord.Payload__c = buildPayload(requestItem);
        queueRecord.Endpoint__c = COMMUNICATIONS_ENDPOINT;
        queueRecord.Retry_Count__c = 0;
        queueRecord.Max_Retries__c = requestItem.maxRetries == null ? DEFAULT_MAX_RETRIES : requestItem.maxRetries;
        queueRecord.Next_Attempt__c = requestItem.nextAttemptAt == null ? System.now() : requestItem.nextAttemptAt;
        queueRecord.Idempotency_Key__c = buildIdempotencyKey(requestItem);
        return queueRecord;
    }

    private static String buildPayload(CommunicationUpdateRequest requestItem) {
        Map<String, Object> relatedRecords = new Map<String, Object>();
        if (requestItem.caseId != null) {
            relatedRecords.put('caseId', String.valueOf(requestItem.caseId));
        }
        if (requestItem.studyId != null) {
            relatedRecords.put('studyId', String.valueOf(requestItem.studyId));
        }

        Map<String, Object> payload = new Map<String, Object>{
            'operation' => COMMUNICATION_UPDATE_OPERATION,
            'sourceSystem' => requestItem.sourceSystem,
            'sourceCommunicationId' => requestItem.sourceCommunicationId,
            'communicationType' => requestItem.communicationType,
            'communicationBody' => requestItem.communicationBody,
            'relatedRecords' => relatedRecords
        };
        return JSON.serialize(payload);
    }

    private static String buildIdempotencyKey(CommunicationUpdateRequest requestItem) {
        List<String> keyParts = new List<String>{
            COMMUNICATION_UPDATE_OPERATION,
            requestItem.sourceSystem,
            requestItem.sourceCommunicationId,
            requestItem.communicationType
        };

        if (requestItem.caseId != null) {
            keyParts.add(String.valueOf(requestItem.caseId));
        }
        if (requestItem.studyId != null) {
            keyParts.add(String.valueOf(requestItem.studyId));
        }

        return String.join(keyParts, ':');
    }
}
