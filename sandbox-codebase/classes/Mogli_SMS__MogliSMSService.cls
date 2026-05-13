/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class MogliSMSService {
    global MogliSMSService() {

    }
global interface IMogliSMSServiceHandler {
    Mogli_SMS.MogliSMSService.MogliSendSMSOutput sendSMSMessage(Mogli_SMS.MogliSMSService.MogliSendSMSInput param0);
}
global class MogliSendSMSInput {
    global String originationID {
        get;
        set;
    }
    global String phoneNumber {
        get;
        set;
    }
    global String smsBody {
        get;
        set;
    }
    global MogliSendSMSInput(String phoneNumber, String smsBody) {

    }
}
global class MogliSendSMSOutput {
    global MogliSendSMSOutput() {

    }
}
global class TelerivetSendSMSHandler implements Mogli_SMS.MogliSMSService.IMogliSMSServiceHandler {
    global TelerivetSendSMSHandler() {

    }
}
global class TwilioSendSMSHandler implements Mogli_SMS.MogliSMSService.IMogliSMSServiceHandler {
    global TwilioSendSMSHandler() {

    }
}
}
