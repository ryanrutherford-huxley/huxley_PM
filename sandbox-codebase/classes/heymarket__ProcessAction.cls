/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class ProcessAction {
    global ProcessAction() {

    }
    @InvocableMethod(label='Create Cases' description='Create cases when new message arrives from Heymarket')
    global static void createCases(List<heymarket.ProcessAction.CaseCreationRequest> requests) {

    }
global class CaseCreationRequest {
    @InvocableVariable(label='Message' description='Select Message for creating case' required=true)
    global heymarket__Message__c message;
    @InvocableVariable(label='Status of new case' description='Default status when new case will be created' required=true)
    global String statusOfNewCase;
    @InvocableVariable(label='Subject of Cases when received from Heymarket' description='Set a default subject to case when the are created from heymarket message' required=true)
    global String subjectOfCase;
    @InvocableVariable(label='Case status to consider for update' description='Enter multiple status (saparated by comma) to consider for updating the case' required=true)
    global String updateCaseWithStatus;
    global CaseCreationRequest() {

    }
}
global class SObjectWithCase {
    global SObject record;
    global Case recordCase;
    global SObjectWithCase(SObject sobj, Case c) {

    }
}
}
