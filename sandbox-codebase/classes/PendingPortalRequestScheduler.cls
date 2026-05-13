global with sharing class PendingPortalRequestScheduler implements Schedulable {
    // Jira: SF-12
    // Polls the queue for work that is due and hands that work to the async callout processor.

    @TestVisible
    private static final Integer MAX_RECORDS_PER_RUN = 50;

    @TestVisible
    private static final List<String> ELIGIBLE_STATUSES = new List<String>{ 'Pending', 'Retrying' };

    global void execute(SchedulableContext context) {
        enqueueDueRequests();
    }

    public static void enqueueDueRequests() {
        List<Pending_Portal_Requests__c> dueRequests = [
            SELECT Id
            FROM Pending_Portal_Requests__c
            WHERE Status__c IN :ELIGIBLE_STATUSES
            AND Next_Attempt__c <= :System.now()
            ORDER BY Next_Attempt__c ASC
            LIMIT :MAX_RECORDS_PER_RUN
        ];

        if (!dueRequests.isEmpty()) {
            List<Id> dueRequestIds = new List<Id>();
            for (Pending_Portal_Requests__c dueRequest : dueRequests) {
                dueRequestIds.add(dueRequest.Id);
            }

            System.enqueueJob(new PendingPortalRequestProcessor(dueRequestIds));
        }
    }
}