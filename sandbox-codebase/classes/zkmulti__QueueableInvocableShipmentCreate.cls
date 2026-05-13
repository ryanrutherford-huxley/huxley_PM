/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class QueueableInvocableShipmentCreate {
    global QueueableInvocableShipmentCreate() {

    }
    @InvocableMethod(label='Create Shipment Queueable (Multi Carrier)' description='Create Multi Carrier Shipment. Queueable Job')
    global static void createShipment(List<zkmulti.QueueableInvocableShipmentCreate.CreateShipmentParameter> inputList) {

    }
global class CreateShipmentParameter {
    @InvocableVariable( required=true)
    global Id customAddressId;
    @InvocableVariable( required=false)
    global String encryptedKey;
    @InvocableVariable( required=false)
    global Boolean isAutoPrint;
    @InvocableVariable( required=false)
    global Id preferenceId;
    @InvocableVariable( required=false)
    global String processingType;
    @InvocableVariable( required=true)
    global Id recordId;
    global CreateShipmentParameter() {

    }
}
}
