/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class InvocableCancelShipment {
    global static Boolean STOP_INVOCABLE;
    global InvocableCancelShipment() {

    }
    @InvocableMethod(label='Cancel Shipment (Multi Carrier)' description='Cancel Shipment.')
    global static void cancelShipment(List<zkmulti.InvocableCancelShipment.CancelParameter> inputList) {

    }
global class CancelParameter {
    @InvocableVariable( required=false)
    global Boolean deleteShipmentRecord;
    @InvocableVariable( required=true)
    global Id shipmentId;
    global CancelParameter() {

    }
}
}
