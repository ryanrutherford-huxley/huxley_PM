/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BulkMessageInvocable {
    global BulkMessageInvocable() {

    }
    @InvocableMethod(label='Send Bulk Message' description='Send a bulk message to a batch of recipients.')
    global static List<Mogli_SMS.BulkMessageInvocable.BatchResult> sendBulkMessage(List<Mogli_SMS.BulkMessageInvocable.BatchParams> paramList) {
        return null;
    }
global class BatchParams {
    @InvocableVariable(label='Campaign Id' description='Define the Campaign to use to determine the recipients at runtime.' required=false)
    global Id campaignId;
    @InvocableVariable(label='Content Document Ids' description='Include a collection of Content Document Ids to attach document(s) to the message.' required=false)
    global List<Id> contentDocumentIds;
    @InvocableVariable(label='Gateway Id' description='Define the Gateway to use to send the messages. If not defined, the default Gateway will be used.' required=false)
    global Id gatewayId;
    @InvocableVariable(label='Message Text' description='Define the message text to be sent.' required=false)
    global String messageText;
    @InvocableVariable(label='Mogli Template Id' description='Define the Mogli Template to use to determine the message text and any Question Template Id, Content Document Ids or Twilio Template Id.' required=false)
    global Id mogliTemplateId;
    @InvocableVariable(label='Question Template Id' description='Include the Question Template of the first question to trigger a new Form.' required=false)
    global Id questionTemplateId;
    @InvocableVariable(label='Recipients' description='Include a collection of Bulk Message Recipients.' required=false)
    global List<Mogli_SMS.BulkMessageRecipient> recipients;
    @InvocableVariable(label='Report Id' description='Define the Report to use to determine the recipients at runtime.' required=false)
    global Id reportId;
    @InvocableVariable(label='Scheduled Delivery' description='Include a future date and time to schedule the messages.' required=false)
    global Datetime scheduledDelivery;
    @InvocableVariable(label='Twilio Template Id' description='Include the Twilio Template Id to send a WhatsApp Content Template.' required=false)
    global String twilioTemplateId;
    global BatchParams() {

    }
}
global class BatchResult {
    @InvocableVariable(label='Batch Group Id' description='Returns the Batch Group Id generated for the bulk message.' required=false)
    global String batchGroupId;
    @InvocableVariable(label='Error Message' description='Returns information about the error that occurred.' required=false)
    global String errorMessage;
    @InvocableVariable(label='Has Error' description='Indicates whether an error occurred sending the bulk message.' required=false)
    global Boolean hasError;
}
}
