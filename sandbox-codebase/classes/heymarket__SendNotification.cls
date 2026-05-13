/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class SendNotification {
    global SendNotification() {

    }
    @InvocableMethod(label='Send Notification To User' description='Send Salesforce Notification on Incoming message')
    global static void prepareAndSendNotification(List<heymarket.SendNotification.FlowInput> inputs) {

    }
global class FlowInput {
    @InvocableVariable(label='Message Id' description='Enter message id' required=true)
    global String messageId;
    @InvocableVariable(label='Name' description='Select Name field' required=false)
    global String name;
    @InvocableVariable(label='Salesforce Record ID' description='If there is a number associated with multiple object  then you can add Salesforce record Id of a particular object to receive the notification' required=false)
    global String sfRecordId;
    global FlowInput() {

    }
    global FlowInput(String messageId) {

    }
    global FlowInput(String messageId, String name) {

    }
    global FlowInput(String messageId, String name, String sfRecordId) {

    }
}
}
