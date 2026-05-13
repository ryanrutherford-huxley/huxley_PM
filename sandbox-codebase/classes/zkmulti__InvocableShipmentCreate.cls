/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class InvocableShipmentCreate {
    global static Boolean STOP_INVOCABLE;
    global InvocableShipmentCreate() {

    }
    @InvocableMethod(label='Create Shipment (Multi Carrier)' description='Create Multi Carrier Shipment.')
    global static void createShipment(List<zkmulti.InvocableShipmentCreate.CreateShipmentParameter> inputList) {

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
