@IsTest
private class StudyNoteChangeLogHandlerTest {

    @IsTest
    static void createsLogWhenNotesChange() {
        Study__c rec = new Study__c(
            Name = 'Test Study',
            Notes__c = 'Original note'
        );
        insert rec;

        rec.Notes__c = 'Updated note with more detail';
        Test.startTest();
        update rec;
        Test.stopTest();

        List<Study_Notes_Change_Log__c> logs = [
            SELECT Study__c, Field_Name__c, Old_Value__c, New_Value__c,
                   CreatedById, CreatedDate
            FROM Study_Notes_Change_Log__c
            WHERE Study__c = :rec.Id
        ];

        System.assertEquals(1, logs.size());
        System.assertEquals(rec.Id, logs[0].Study__c);
        System.assertEquals('Notes__c', logs[0].Field_Name__c);
        System.assertEquals('Original note', logs[0].Old_Value__c);
        System.assertEquals('Updated note with more detail', logs[0].New_Value__c);
        System.assertEquals(UserInfo.getUserId(), logs[0].CreatedById);
        System.assertNotEquals(null, logs[0].CreatedDate);
    }

    @IsTest
    static void doesNotCreateLogWhenNotesDoNotChange() {
        Study__c rec = new Study__c(
            Name = 'No Change Study',
            Notes__c = 'No change'
        );
        insert rec;

        rec.Name = 'Renamed Study';
        Test.startTest();
        update rec;
        Test.stopTest();

        Integer logCount = [
            SELECT COUNT()
            FROM Study_Notes_Change_Log__c
            WHERE Study__c = :rec.Id
        ];

        System.assertEquals(0, logCount);
    }

    @IsTest
    static void createsLogWhenNotesChangeFromNull() {
        Study__c rec = new Study__c(
            Name = 'Null Notes Study'
        );
        insert rec;

        rec.Notes__c = 'Now populated';
        Test.startTest();
        update rec;
        Test.stopTest();

        Study_Notes_Change_Log__c logRec = [
            SELECT Study__c, Old_Value__c, New_Value__c
            FROM Study_Notes_Change_Log__c
            WHERE Study__c = :rec.Id
            LIMIT 1
        ];

        System.assertEquals(rec.Id, logRec.Study__c);
        System.assertEquals(null, logRec.Old_Value__c);
        System.assertEquals('Now populated', logRec.New_Value__c);
    }
}