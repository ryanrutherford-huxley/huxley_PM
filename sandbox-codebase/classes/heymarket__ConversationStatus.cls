/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class ConversationStatus {
    global ConversationStatus() {

    }
    @InvocableMethod(label='Set Conversation Status' description='Set Conversation Status active/ blocked/ unblocked/ unsubscribed/ subscribed')
    global static void setConversationStatus(List<heymarket.ConversationStatus.FlowInput> inputs) {

    }
global class FlowInput {
    @InvocableVariable(label='Phone' description='Target phone number' required=true)
    global String phone;
    @InvocableVariable(label='Status' description='Enter conversation status active/ blocked/ unblocked/ unsubscribed/ subscribed' required=true)
    global String status;
    global FlowInput() {

    }
    global FlowInput(String phone, String status) {

    }
}
}
