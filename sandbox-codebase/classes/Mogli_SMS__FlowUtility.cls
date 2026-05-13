/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class FlowUtility {
    global FlowUtility() {

    }
    @InvocableMethod(label='Create Mogli SMS' description='Creates a new Mogli SMS record')
    global static List<Mogli_SMS.FlowUtility.FlowOutput> createSMS(List<Mogli_SMS.FlowUtility.FlowInput> inputs) {
        return null;
    }
global class FlowInput {
    @InvocableVariable(label='Gateway ID' description='Mogli SMS Gateway ID' required=true)
    global Id gatewayId;
    @InvocableVariable(label='Message' description='SMS message content' required=true)
    global String message;
    @InvocableVariable(label='Phone Number' description='Recipient phone number' required=false)
    global String phoneNumber;
    @InvocableVariable(label='Record ID' description='ID of the related record' required=false)
    global String recordId;
    @InvocableVariable(label='Scheduled Delivery' description='Future scheduled delivery time' required=false)
    global Datetime scheduledDelivery;
    global FlowInput() {

    }
}
global class FlowOutput {
    @InvocableVariable(label='Error Message' description='Error message if creation failed' required=false)
    global String errorMessage;
    @InvocableVariable(label='Is Success' description='Indicates if SMS creation was successful' required=false)
    global Boolean isSuccess;
    @InvocableVariable(label='SMS ID' description='ID of the created SMS record' required=false)
    global Id smsId;
    global FlowOutput() {

    }
}
}
