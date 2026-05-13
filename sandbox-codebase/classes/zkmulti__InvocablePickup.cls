/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class InvocablePickup {
    global static Boolean STOP_INVOCABLE;
    global InvocablePickup() {

    }
    @InvocableMethod(label='Create Pickup (Multi Carrier)' description='Create Pickup.')
    global static void createPickup(List<zkmulti.InvocablePickup.PickupParameter> inputList) {

    }
global class PickupParameter {
    @InvocableVariable( required=true)
    global Id customAddressId;
    @InvocableVariable( required=false)
    global String encryptedKey;
    @InvocableVariable( required=true)
    global Id recordId;
    @InvocableVariable( required=false)
    global Id shipmentId;
    @InvocableVariable( required=false)
    global Id userId;
    global PickupParameter() {

    }
}
}
