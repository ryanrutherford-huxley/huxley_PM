/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
@RestResource(urlMapping='/v2/mogli/*')
global class MogliWebService {
    global MogliWebService() {

    }
    @HttpPost
    global static String doPost() {
        return null;
    }
global interface IMogliWebServiceHandler {
    String handlePost(Mogli_SMS.MogliWebService.MogliWebServiceContext param0);
}
global class MogliWebServiceContext {
    global Mogli_SMS__Gateway__c gateway {
        get;
        set;
    }
    global String gatewayID {
        get;
        set;
    }
    global System.RestRequest req {
        get;
        set;
    }
    global System.RestResponse res {
        get;
        set;
    }
    global MogliWebServiceContext(System.RestRequest req, System.RestResponse res) {

    }
    global MogliWebServiceContext(System.RestRequest req, System.RestResponse res, Mogli_SMS__Gateway__c gateway) {

    }
    global MogliWebServiceContext(System.RestRequest req, System.RestResponse res, String gatewayID) {

    }
}
global class TelnyxMogliWebServiceHandler implements Mogli_SMS.MogliWebService.IMogliWebServiceHandler {
    global TelnyxMogliWebServiceHandler() {

    }
}
global class TwilioMogliWebServiceHandler implements Mogli_SMS.MogliWebService.IMogliWebServiceHandler {
    global TwilioMogliWebServiceHandler() {

    }
}
}
