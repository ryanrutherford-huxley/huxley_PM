/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class QueueableInvocableShipmentBook {
    global QueueableInvocableShipmentBook() {

    }
    @InvocableMethod(label='Book Shipment Queueable (Multi Carrier)' description='Book Multi Carrier Shipment. Queueable Job')
    global static void bookShipment(List<zkmulti.QueueableInvocableShipmentBook.BookShipmentParameter> inputList) {

    }
global class BookShipmentParameter {
    @InvocableVariable( required=true)
    global Id shipmentId;
    global BookShipmentParameter() {

    }
}
}
