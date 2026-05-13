/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class ChatAssignmentAction {
    global ChatAssignmentAction() {

    }
    @InvocableMethod(label='Chat Assignment' description='Chat Assignment from flow')
    global static void ChatAssignmentAction(List<heymarket.ChatAssignmentAction.ChatDataRequest> ChatDataRequest) {

    }
global class ChatDataRequest {
    @InvocableVariable(label='Owner Id' description='target owner id' required=true)
    global String ownerId;
    @InvocableVariable(label='Phone' description='target phone number' required=true)
    global String phone;
    global ChatDataRequest() {

    }
}
}
