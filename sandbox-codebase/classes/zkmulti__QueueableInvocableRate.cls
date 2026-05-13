/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class QueueableInvocableRate {
    global QueueableInvocableRate() {

    }
    @InvocableMethod(label='Get Rate Queueable (Multi Carrier)' description='Get Rate. Queueable Jobs')
    global static void getRate(List<zkmulti.QueueableInvocableRate.RateParameter> inputList) {

    }
global class RateParameter {
    @InvocableVariable( required=true)
    global Id customAddressId;
    @InvocableVariable( required=false)
    global String encryptedKey;
    @InvocableVariable( required=true)
    global Id recordId;
    global RateParameter() {

    }
}
}
