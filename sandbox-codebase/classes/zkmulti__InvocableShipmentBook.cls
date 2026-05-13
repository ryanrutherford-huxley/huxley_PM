/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class InvocableShipmentBook {
    global static Boolean STOP_INVOCABLE;
    global InvocableShipmentBook() {

    }
    @InvocableMethod(label='Book Shipment (Multi Carrier)' description='Book Multi Carrier Shipment.')
    global static void bookShipment(List<zkmulti.InvocableShipmentBook.BookShipmentParameter> inputList) {

    }
global class BookShipmentParameter {
    @InvocableVariable( required=true)
    global Id shipmentId;
    global BookShipmentParameter() {

    }
}
}
