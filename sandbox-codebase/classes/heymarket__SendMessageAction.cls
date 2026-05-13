/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class SendMessageAction {
    global SendMessageAction() {

    }
    @InvocableMethod(label='Send Message' description='Send message from process builder')
    global static void sendMessage(List<heymarket.SendMessageAction.MessageRequest> msgRequests) {

    }
global class MessageRequest {
    @InvocableVariable(label='First Name' description='enter message record's first name' required=false)
    global String firstName;
    @InvocableVariable(label='Inbox Id' description='enter inbox id' required=false)
    global String inboxId;
    @InvocableVariable(label='Inbox Number' description='enter inbox number' required=false)
    global String inboxNumber;
    @InvocableVariable(label='isScheduler' description='Is true if flow is triggered from scheduler' required=false)
    global Boolean isScheduler;
    @InvocableVariable(label='Last Name' description='enter message record's last name' required=false)
    global String lastName;
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
