/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class InvocableSendLabels {
    global static Boolean STOP_INVOCABLE;
    global InvocableSendLabels() {

    }
    @InvocableMethod(label='Send Labels to Email (Multi Carrier)' description='Send Labels to Email')
    global static void getRate(List<zkmulti.InvocableSendLabels.SendLabelsParameter> inputList) {

    }
global class SendLabelsParameter {
    @InvocableVariable( required=false)
    global String bccAddresses;
    @InvocableVariable( required=false)
    global String ccAddresses;
    @InvocableVariable( required=false)
    global Id emailTemplateId;
    @InvocableVariable( required=true)
    global Id shipmentId;
    @InvocableVariable( required=false)
    global String toAddresses;
    global SendLabelsParameter() {

    }
}
}
