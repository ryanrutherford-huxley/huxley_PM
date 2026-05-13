/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class MogliService {
    global MogliService() {

    }
global interface IMogliServiceBatchHandler {
    Mogli_SMS.MogliService.MogliSendSMSOutput sendBatchSMS(Mogli_SMS.MogliService.MogliSendSMSInput param0);
    Mogli_SMS.MogliService.MogliSendSMSOutput sendSMSMessage(Mogli_SMS.MogliService.MogliSendSMSInput param0);
}
global interface IMogliServiceHandler {
    Mogli_SMS.MogliService.MogliSendSMSOutput sendSMSMessage(Mogli_SMS.MogliService.MogliSendSMSInput param0);
}
global class MessagingApiSendSMSHandler implements Mogli_SMS.MogliService.IMogliServiceBatchHandler {
    global MessagingApiSendSMSHandler() {

    }
}
global class MogliSendSMSInput {
    global String gatewayId {
        get;
        set;
    }
    global List<String> mediaUrls {
        get;
        set;
    }
    global String phoneNumber {
        get;
        set;
    }
    global String recordId {
        get;
        set;
    }
    global String smsBody {
        get;
        set;
    }
    global String twilioTemplateId {
        get;
        set;
    }
    global MogliSendSMSInput(String phoneNumber, String smsBody) {

    }
    global MogliSendSMSInput(String phoneNumber, String smsBody, Id gatewayId) {

    }
    global MogliSendSMSInput(String phoneNumber, String smsBody, Id gatewayId, Id recordId) {

    }
}
global class MogliSendSMSOutput {
    global Boolean error {
        get;
        set;
    }
    global String errorMessage {
        get;
        set;
    }
    global String recordId {
        get;
        set;
    }
    global Double segments {
        get;
        set;
    }
    global String smsSid {
        get;
        set;
    }
    global String status {
        get;
        set;
    }
    global MogliSendSMSOutput() {

    }
}
global class TelnyxSendBatchSMSHandler implements Mogli_SMS.MogliService.IMogliServiceBatchHandler {
    global TelnyxSendBatchSMSHandler() {

    }
}
global class TwilioSendBatchSMSHandler implements Mogli_SMS.MogliService.IMogliServiceBatchHandler {
    global TwilioSendBatchSMSHandler() {

    }
}
global class TwilioSendSMSHandler implements Mogli_SMS.MogliService.IMogliServiceHandler {
    global TwilioSendSMSHandler() {

    }
}
}
