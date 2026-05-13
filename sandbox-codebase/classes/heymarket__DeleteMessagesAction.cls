/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class DeleteMessagesAction {
    global DeleteMessagesAction() {

    }
    @InvocableMethod(label='Delete Messages' description='Delete messages from Flow')
    global static void deleteMessage(List<heymarket.DeleteMessagesAction.DeleteMessageRequest> deleteMsgRequests) {

    }
global class DeleteMessageRequest {
    @InvocableVariable(label='Delete Messages Before Date' description='Messages older than this date will be deleted' required=true)
    global Date beforeDate;
    global DeleteMessageRequest() {

    }
}
}
