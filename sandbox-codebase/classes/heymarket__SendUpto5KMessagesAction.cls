/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class SendUpto5KMessagesAction {
    global SendUpto5KMessagesAction() {

    }
    @InvocableMethod(label='Send upto 5K messages' description='Send upto 5K messages')
    global static void sendMessage(List<heymarket.SendUpto5KMessagesAction.MessageRequest> msgRequests) {

    }
global class MessageRequest {
    @InvocableVariable(label='Inbox' description='enter inbox id/Number' required=false)
    global String inbox;
    @InvocableVariable(label='Message' description='enter message to send' required=false)
    global String message;
    @InvocableVariable(label='Phone' description='target phone number' required=true)
    global String phone;
    @InvocableVariable(label='Salesforce Record ID' description='Salesforce Record Id' required=false)
    global String salesforceID;
    @InvocableVariable(label='Salesforce Template ID or Name' description='Salesforce Template Id or Name' required=false)
    global String templateID;
    @InvocableVariable(label='User Id' description='enter user Id' required=false)
    global String userId;
    global MessageRequest() {

    }
}
}
