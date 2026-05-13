/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class Message {
    @AuraEnabled
    global String severity;
    @AuraEnabled
    global String text;
    @AuraEnabled
    global String title;
    global Message(zkmulti.Message.MessageSeverity severity, String text) {

    }
    global Message(String title, String severity, String text) {

    }
    global Message(String title, zkmulti.Message.MessageSeverity severity, String text) {

    }
    global String getSeverity() {
        return null;
    }
    global String getText() {
        return null;
    }
    global String getTitle() {
        return null;
    }
    global static zkmulti.Message newConfirmMessage(String msg) {
        return null;
    }
    global static zkmulti.Message newErrorMessage(String msg) {
        return null;
    }
    global static zkmulti.Message newInfoMessage(String msg) {
        return null;
    }
    global static zkmulti.Message newWarningMessage(String msg) {
        return null;
    }
global enum MessageSeverity {CONFIRM, ERROR, INFO, WARNING}
}
