/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class InvocableSFCCCreateShipmentOnOrder {
    global static Boolean STOP_INVOCABLE;
    global InvocableSFCCCreateShipmentOnOrder() {

    }
    @InvocableMethod(label='SFCC Create Shipment On Order (Multi Carrier)' description='SFCC Create Shipment On Order.')
    global static void createSFCCShipment(List<zkmulti.InvocableSFCCCreateShipmentOnOrder.CreateSFCCShipmentParameter> inputList) {

    }
global class CreateSFCCShipmentParameter {
    @InvocableVariable( required=false)
    global String apiVersion;
    @InvocableVariable( required=true)
    global String baseUrlSettingName;
    @InvocableVariable( required=true)
    global String clientIdSettingName;
    @InvocableVariable( required=true)
    global String clientPasswordSettingName;
    @InvocableVariable( required=false)
    global String itemIdFieldName;
    @InvocableVariable( required=true)
    global String orderId;
    @InvocableVariable( required=false)
    global String serviceUrl;
    @InvocableVariable( required=true)
    global Id shipmentId;
    @InvocableVariable( required=false)
    global String shipmentNo;
    @InvocableVariable( required=true)
    global String userLoginSettingName;
    @InvocableVariable( required=true)
    global String userPasswordSettingName;
    @InvocableVariable( required=true)
    global String zenkraftCarrier;
    global CreateSFCCShipmentParameter() {

    }
}
}
