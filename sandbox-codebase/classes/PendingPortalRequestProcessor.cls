public with sharing class PendingPortalRequestProcessor implements Queueable, Database.AllowsCallouts {
    // Jira: SF-11
    // Executes outbound requests and applies retry or terminal status updates based on the response.

    @TestVisible
    private static final Integer BASE_RETRY_DELAY_MINUTES = 5;

    private final List<Id> queueRecordIds;

    public PendingPortalRequestProcessor(List<Id> queueRecordIds) {
        this.queueRecordIds = queueRecordIds == null ? new List<Id>() : new List<Id>(queueRecordIds);
    }

    public void execute(QueueableContext context) {
        if (queueRecordIds.isEmpty()) {
            return;
        }

        List<Pending_Portal_Requests__c> queueRecords = [
            SELECT Id, Status__c, Payload__c, Endpoint__c, Retry_Count__c, Max_Retries__c,
                Next_Attempt__c, Last_Error__c, Last_Status_Code__c, Idempotency_Key__c
            FROM Pending_Portal_Requests__c
            WHERE Id IN :queueRecordIds
        ];

        if (queueRecords.isEmpty()) {
            return;
        }

        Http http = new Http();
        List<Pending_Portal_Requests__c> recordsToUpdate = new List<Pending_Portal_Requests__c>();
        for (Pending_Portal_Requests__c queueRecord : queueRecords) {
            recordsToUpdate.add(processRequest(http, queueRecord));
        }

        if (!recordsToUpdate.isEmpty()) {
            update recordsToUpdate;
        }
    }

    @TestVisible
    private static Pending_Portal_Requests__c processRequest(Http http, Pending_Portal_Requests__c queueRecord) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(queueRecord.Endpoint__c);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');

        if (!String.isBlank(queueRecord.Idempotency_Key__c)) {
            request.setHeader('Idempotency-Key', queueRecord.Idempotency_Key__c);
        }

        request.setBody(queueRecord.Payload__c);

        try {
            HttpResponse response = http.send(request);
            return applyResponse(queueRecord, response);
        } catch (Exception ex) {
            return applyFailure(queueRecord, null, ex.getMessage(), true);
        }
    }

    @TestVisible
    private static Pending_Portal_Requests__c applyResponse(
        Pending_Portal_Requests__c queueRecord,
        HttpResponse response
    ) {
        Integer statusCode = response.getStatusCode();
        queueRecord.Last_Status_Code__c = statusCode;

        if (statusCode >= 200 && statusCode < 300) {
            queueRecord.Status__c = 'Completed';
            queueRecord.Last_Error__c = null;
            return queueRecord;
        }

        Boolean retryable = isRetryableStatusCode(statusCode);
        return applyFailure(queueRecord, statusCode, response.getBody(), retryable);
    }

    @TestVisible
    private static Pending_Portal_Requests__c applyFailure(
        Pending_Portal_Requests__c queueRecord,
        Integer statusCode,
        String errorMessage,
        Boolean retryable
    ) {
        if (statusCode != null) {
            queueRecord.Last_Status_Code__c = statusCode;
        }

        queueRecord.Last_Error__c = errorMessage;

        Integer currentRetryCount = queueRecord.Retry_Count__c == null
            ? 0
            : Integer.valueOf(queueRecord.Retry_Count__c);
        Integer maxRetries = queueRecord.Max_Retries__c == null
            ? 0
            : Integer.valueOf(queueRecord.Max_Retries__c);

        if (retryable && currentRetryCount < maxRetries) {
            Integer nextRetryCount = currentRetryCount + 1;
            queueRecord.Retry_Count__c = nextRetryCount;
            queueRecord.Status__c = 'Retrying';
            queueRecord.Next_Attempt__c = System.now().addMinutes(calculateRetryDelayMinutes(nextRetryCount));
            return queueRecord;
        }

        queueRecord.Status__c = 'Dead';
        return queueRecord;
    }

    @TestVisible
    private static Boolean isRetryableStatusCode(Integer statusCode) {
        return statusCode == 408 || statusCode == 429 || (statusCode != null && statusCode >= 500);
    }

    @TestVisible
    private static Integer calculateRetryDelayMinutes(Integer retryCount) {
        return Math.max(1, retryCount) * BASE_RETRY_DELAY_MINUTES;
    }
}