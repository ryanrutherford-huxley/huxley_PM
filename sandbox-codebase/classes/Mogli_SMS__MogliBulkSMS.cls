/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class MogliBulkSMS {
    global MogliBulkSMS() {

    }
    @InvocableMethod(label='Mogli Bulk SMS' description='Sends an SMS to the specified phone numbers.')
    global static void sendSms(List<Mogli_SMS.MogliBulkSMS.FlowInput> flowInputs) {

    }
global class FlowInput {
    @InvocableVariable(label='Campaign ID' required=false)
    global Id CampaignId;
    @InvocableVariable(label='Record Collection' required=false)
    global List<Contact> contactlist;
    @InvocableVariable(label='Content Document IDs' required=false)
    global String contentDocumentIds;
    @InvocableVariable(label='Gateway ID' required=false)
    global Id gatewayId;
    @InvocableVariable(label='Mogli Number Collection' required=false)
    global List<String> phoneNumbers;
    @InvocableVariable(label='Schedule Delivery Date' required=false)
    global Datetime scheduleDelivery;
    @InvocableVariable(label='SMS Message' required=false)
    global String smsMessage;
    @InvocableVariable(label='SMS Template ID' required=false)
    global Id smstemplateId;
    global FlowInput() {

    }
}
}
