public with sharing class StudyNoteChangeLogHandler {

    public static void trackNotesChanges(
        List<Study__c> newRecords,
        Map<Id, Study__c> oldMap
    ) {
        List<Study_Notes_Change_Log__c> logsToInsert = new List<Study_Notes_Change_Log__c>();

        for (Study__c newRec : newRecords) {
            Study__c oldRec = oldMap.get(newRec.Id);

            String oldValue = oldRec.Notes__c;
            String newValue = newRec.Notes__c;

            if (valuesAreDifferent(oldValue, newValue)) {
                logsToInsert.add(new Study_Notes_Change_Log__c(
                    Study__c = newRec.Id,
                    Field_Name__c = 'Notes__c',
                    Old_Value__c = oldValue,
                    New_Value__c = newValue
                ));
            }
        }

        if (!logsToInsert.isEmpty()) {
            insert logsToInsert;
        }
    }

    private static Boolean valuesAreDifferent(String oldValue, String newValue) {
        if (oldValue == null && newValue == null) {
            return false;
        }
        if (oldValue == null || newValue == null) {
            return true;
        }
        return oldValue != newValue;
    }
}