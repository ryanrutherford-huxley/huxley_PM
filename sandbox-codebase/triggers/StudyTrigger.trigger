trigger StudyTrigger on Study__c (after update) {
    if (Trigger.isAfter && Trigger.isUpdate) {
        StudyNoteChangeLogHandler.trackNotesChanges(Trigger.new, Trigger.oldMap);
    }
}