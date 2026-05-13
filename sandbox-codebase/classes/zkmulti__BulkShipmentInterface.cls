/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BulkShipmentInterface {
    global BulkShipmentInterface() {

    }
    global static String asynchronousProcessBulkShipment(String bulkShipmentId) {
        return null;
    }
    global static Boolean bulkShipmentEnabled() {
        return null;
    }
    global static List<zkmulti.ShipmentRate> calculateRates(Id preferenceId, zkmulti__MCShipment__c shipment, List<zkmulti__MCPackage__c> packages, zkmulti__MCShipment_Special_Services__c shipmentSS, List<zkmulti__MCCustoms_Item__c> customsItems, Map<String,Object> additionalParameters) {
        return null;
    }
    global static List<zkmulti.ShipmentRate> calculateRates(zkmulti__MCBulk_Shipment__c bulkShipment, Id recordId) {
        return null;
    }
    global static List<zkmulti.ShipmentRate> calculateRates(zkmulti__MCQueued_Shipment__c queuedShipment, zkmulti__MCQueued_Package__c queuedPackage, zkmulti__MCQueued_Shipment_Special_Services__c queuedShipmentSS, List<zkmulti__MCQueued_Customs_Item__c> queuedCustomeItems, zkmulti__MCShipmate_Preference__c shipmatePreference) {
        return null;
    }
    global static zkmulti.ScaleInfo getScaleInfo(zkmulti__MCShipmate_Preference__c preference) {
        return null;
    }
    global static String processBulkShipment(String bulkShipmentId) {
        return null;
    }
    global static String processBulkShipmentSynchronous(String bulkShipmentId) {
        return null;
    }
    global static String synchronousProcessBulkShipment(String bulkShipmentId) {
        return null;
    }
    global static Map<String,Object> synchronousProcessBulkShipment(Map<String,Object> params) {
        return null;
    }
    global static String validateBulkShipment(String bulkShipmentId, Boolean performAddressValidation) {
        return null;
    }
    global static String validateBulkShipmentSynchronous(String bulkShipmentId, Boolean performAddressValidation) {
        return null;
    }
}
