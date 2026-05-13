/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class ShipmentInterface {
    global ShipmentInterface() {

    }
    global static zkmulti__MCPickup__c cancelPickup(zkmulti__MCPickup__c pickup, List<zkmulti.PickupShipment> pickupShipmentList, Boolean withDMLOperation) {
        return null;
    }
    global static zkmulti__MCShipment__c cancelShipment(Id shipmentId) {
        return null;
    }
    @Future(callout=true)
    global static void convertLabelsFuture(List<Id> labelIds, String typeOfConvert, String carrier) {

    }
    global static List<Attachment> convertLabels(List<Id> labelIds, String typeOfConvert, String carrier) {
        return null;
    }
    @Future(callout=true)
    global static void createPickup(String jsonString) {

    }
    global static Map<String,Object> createPickupSync(String jsonString) {
        return null;
    }
    global static zkmulti__MCPickup__c createPickup(zkmulti__MCPickup__c pickup, List<zkmulti.PickupShipment> pickupShipmentList, Boolean withDMLOperation) {
        return null;
    }
    @Future(callout=true)
    global static void createShipment(String jsonString) {

    }
    global static Map<String,Object> createShipmentSync(String jsonString) {
        return null;
    }
    global String getBarcodeUrl(String code, String codeType, Boolean includeText) {
        return null;
    }
    global static Map<String,String> getCarriers() {
        return null;
    }
    global static List<zkmulti.ShipmentInterface.DropOffLocation> getDropOffLocations(Map<String,Object> params) {
        return null;
    }
    global static List<String> getServices(String carrierCode) {
        return null;
    }
    global static zkmulti.TrackingResult getTrackInformation(zkmulti__MCShipment__c shipment) {
        return null;
    }
    global static zkmulti.PickupWebServiceResponse pickupRequest(String requestName, Map<String,Object> params) {
        return null;
    }
    global static String printLabel(Id labelId, Id userId) {
        return null;
    }
    global static String printLabels(Id userId, Id recordId) {
        return null;
    }
    global static String printLabels(Id recordId, Id prefId, Id userId) {
        return null;
    }
    global static List<String> printLabels(List<Attachment> attachments, Id prefId, Id userId) {
        return null;
    }
    global static List<String> printLabels(List<zkmulti.FilesUtils.FileWrapper> files, Id prefId, Id userId) {
        return null;
    }
    @Future(callout=true)
    global static void saveSelectedRateToCAS(String jsonString) {

    }
    global static void saveSelectedRateToCASSync(String jsonString) {

    }
    @Future(callout=true)
    global static void trackShipmentFuture(String jsonString) {

    }
    global static Map<String,Object> trackShipmentSync(String jsonString) {
        return null;
    }
    global static zkmulti.ShipmentInterface.ResponseWrapper updateApplicationSettings(String protectedKey, String settingName, Map<String,Object> params) {
        return null;
    }
    @Future(callout=true)
    global static void uploadETD(String jsonString) {

    }
    global static Map<String,Object> uploadETDSync(String jsonString) {
        return null;
    }
    global static zkmulti.AddressValidationResult validateAddress(zkmulti__MCShipment__c shipment, Id preferenceId) {
        return null;
    }
global class DropOffLocation {
    global String city;
    global String country;
    global String country_code;
    global String distance;
    global String distance_units;
    global String edi_code;
    global String email;
    global Boolean is_available_delivery;
    global Boolean is_available_dropoff;
    global Decimal lat;
    global Decimal lng;
    global String location_code;
    global String location_name;
    global String location_type;
    global String notes;
    global String operational_hours;
    global String phone;
    global String postal_code;
    global String region;
    global String sort_code;
    global String state;
    global String street1;
    global String street2;
    global String street3;
}
global class ResponseWrapper {
    global String errorMessage;
    global Boolean isSuccess;
    global Map<String,Object> response;
    global ResponseWrapper() {

    }
}
}
