/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class MessageList {
    @AuraEnabled
    global List<zkmulti.Message> confirmMessages;
    @AuraEnabled
    global List<zkmulti.Message> errorMessages;
    @AuraEnabled
    global List<zkmulti.Message> infoMessages;
    @AuraEnabled
    global List<zkmulti.Message> warningMessages;
    global MessageList() {

    }
    global void add(zkmulti.Message msg) {

    }
    global void addAll(zkmulti.MessageList msgList) {

    }
    global void addConfirm(String msg) {

    }
    global void addError(String msg) {

    }
    global void addError(String title, String msg) {

    }
    global void addInfo(String msg) {

    }
    global void addMessageList(List<zkmulti.Message> messages) {

    }
    global void addWarning(String msg) {

    }
    global void addWarning(String title, String msg) {

    }
    global void clear() {

    }
    global List<zkmulti.Message> getMessages() {
        return null;
    }
    global Boolean hasErrorMessage() {
        return null;
    }
    global Boolean hasMessage() {
        return null;
    }
    global Integer size() {
        return null;
    }
    global override String toString() {
        return null;
    }
}
