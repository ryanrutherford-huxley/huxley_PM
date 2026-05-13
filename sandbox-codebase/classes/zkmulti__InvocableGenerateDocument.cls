/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class InvocableGenerateDocument {
    global static Boolean STOP_INVOCABLE;
    global InvocableGenerateDocument() {

    }
    @InvocableMethod(label='Generate Document (Multi Carrier)' description='Generate Document.')
    global static void generateDocument(List<zkmulti.InvocableGenerateDocument.DocumentParameter> inputList) {

    }
global class DocumentParameter {
    @InvocableVariable( required=true)
    global String documentType;
    @InvocableVariable( required=false)
    global Boolean isAutoPrint;
    @InvocableVariable( required=false)
    global Boolean printAll;
    @InvocableVariable( required=false)
    global Boolean removeOriginalLabels;
    @InvocableVariable( required=true)
    global Id shipmentId;
    @InvocableVariable( required=false)
    global String templateExtension;
    @InvocableVariable( required=false)
    global String templateName;
    global DocumentParameter() {

    }
}
}
