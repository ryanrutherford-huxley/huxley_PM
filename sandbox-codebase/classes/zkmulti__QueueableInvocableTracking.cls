/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class QueueableInvocableTracking {
    global static Boolean STOP_INVOCABLE;
    global QueueableInvocableTracking() {

    }
    @InvocableMethod(label='Track Shipment Queueable (Multi Carrier)' description='Track Shipment. Queueable Jobs')
    global static void trackShipment(List<zkmulti.QueueableInvocableTracking.TrackParameter> inputList) {

    }
global class TrackParameter {
    @InvocableVariable( required=false)
    global String countryCode;
    @InvocableVariable( required=false)
    global Boolean createShipmentIfNotFound;
    @InvocableVariable( required=false)
    global Id customAddressId;
    @InvocableVariable( required=false)
    global Date dateRangeEnd;
    @InvocableVariable( required=false)
    global Date dateRangeStart;
    @InvocableVariable( required=false)
    global Boolean doNotSearchShipment;
    @InvocableVariable( required=false)
    global String encryptedKey;
    @InvocableVariable( required=false)
    global Boolean forceShipmentCreation;
    @InvocableVariable( required=false)
    global Boolean isReturn;
    @InvocableVariable( required=false)
    global String postalCode;
    @InvocableVariable( required=false)
    global Id preferenceId;
    @InvocableVariable( required=false)
    global Id recordId;
    @InvocableVariable( required=false)
    global Date shipDate;
    @InvocableVariable( description='FedEx only' required=false)
    global String shipmentAccountNumber;
    @InvocableVariable( required=true)
    global String trackingNumber;
    @InvocableVariable( required=false)
    global String typeOfTrack;
    global TrackParameter() {

    }
}
}
