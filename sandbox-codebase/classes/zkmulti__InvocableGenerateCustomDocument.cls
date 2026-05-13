/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class InvocableGenerateCustomDocument {
    global static Boolean STOP_INVOCABLE;
    global InvocableGenerateCustomDocument() {

    }
    @InvocableMethod(label='Generate Custom Document (Multi Carrier)' description='Generate Custom Document.')
    global static void generateDocument(List<zkmulti.InvocableGenerateCustomDocument.DocumentParameter> inputList) {

    }
global class DocumentParameter {
    @InvocableVariable(label='Document Type' required=true)
    global String documentType;
    @InvocableVariable(label='Reserved for future use #3' required=false)
    global String extraParams;
    @InvocableVariable(label='Extra input params' required=false)
    global String inputParams;
    @InvocableVariable(label='Name of Genenerated Document' required=false)
    global String nameOfGeneratedDocument;
    @InvocableVariable(label='Print Documents' required=false)
    global Boolean printDocuments;
    @InvocableVariable(label='Reserved for future use #1' required=false)
    global String printerId;
    @InvocableVariable(label='Printer Preference Id' required=false)
    global String printerPreferenceId;
    @InvocableVariable(label='Reserved for future use #2' required=false)
    global String printerTray;
    @InvocableVariable(label='Printer User Id' required=false)
    global Id printerUserId;
    @InvocableVariable(label='Print Generated Documents Only' required=false)
    global Boolean printGeneratedOnly;
    @InvocableVariable(label='Record Id' required=true)
    global Id recordId;
    @InvocableVariable(label='Record Ids (Bulkify)' required=false)
    global List<Id> recordIds;
    @InvocableVariable(label='Tempalate Extension' required=false)
    global String templateExtension;
    @InvocableVariable(label='Template Name' required=false)
    global String templateName;
    global DocumentParameter() {

    }
}
}
