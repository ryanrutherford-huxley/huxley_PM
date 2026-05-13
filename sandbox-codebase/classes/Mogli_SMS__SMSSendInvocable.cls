/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class SMSSendInvocable {
    global SMSSendInvocable() {

    }
    global static List<String> getPhoneNumbers(List<Mogli_SMS.SMSSendInvocable.FlowInput> flowInputs) {
        return null;
    }
    @InvocableMethod(label='SMS Send' description='Sends an SMS to the specified phone numbers.')
    global static void sendSms(List<Mogli_SMS.SMSSendInvocable.FlowInput> flowInputs) {

    }
global class FlowInput {
    @InvocableVariable(label='Content Document IDs' required=false)
    global List<Id> contentDocumentIds;
    @InvocableVariable(label='Gateway ID' required=false)
    global Id gatewayId;
    @InvocableVariable(label='Phone Number' required=false)
    global String phoneNumber;
    @InvocableVariable(label='Schedule Delivery Date' required=false)
    global Datetime scheduleDelivery;
    @InvocableVariable(label='SMS Message' required=false)
    global String smsMessage;
    global FlowInput() {

    }
}
}
