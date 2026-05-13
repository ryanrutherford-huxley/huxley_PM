/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class SMSRetriever {
    global SMSRetriever() {

    }
    @InvocableMethod(label='Retrieve Mogli SMS Messages' description='Flexible Mogli SMS message retrieval')
    global static List<Mogli_SMS.SMSRetriever.SMSSearchResult> retrieveSMSMessages(List<Mogli_SMS.SMSRetriever.SMSSearchRequest> searchRequests) {
        return null;
    }
global class SMSSearchRequest {
    @InvocableVariable(label='End Date/Time' description='End of date range' required=false)
    global Datetime endDateTime;
    @InvocableVariable(label='Last N Records' description='Number of most recent records to retrieve' required=false)
    global Integer lastNRecords;
    @InvocableVariable(label='Phone Number' description='Phone number to search' required=false)
    global String phoneNumber;
    @InvocableVariable(label='Related Record ID' description='Record to find SMS messages for' required=false)
    global String relatedRecordId;
    @InvocableVariable(label='Start Date/Time' description='Beginning of date range' required=false)
    global Datetime startDateTime;
    global SMSSearchRequest() {

    }
}
global class SMSSearchResult {
    @InvocableVariable(label='Mogli SMS Messages' description='List of Mogli SMS messages found' required=false)
    global List<Mogli_SMS__SMS__c> smsMessages;
    global SMSSearchResult() {

    }
}
}
