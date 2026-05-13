/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class SendBulkMessageAction {
    global SendBulkMessageAction() {

    }
    @InvocableMethod(label='Send Bulk Messages' description='Send bulk messages from flow')
    global static void sendMessage(List<heymarket.SendBulkMessageAction.MessageRequest> msgRequests) {

    }
global class MessageRequest {
    @InvocableVariable(label='Record list' description='List of records to send messages' required=true)
    global List<heymarket.MessageRequestWrapper> recordList;
    global MessageRequest() {

    }
}
}
