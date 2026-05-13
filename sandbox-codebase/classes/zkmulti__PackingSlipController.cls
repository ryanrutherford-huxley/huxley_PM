/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class PackingSlipController {
    global zkmulti.PackingSlipController.BoxInformation box {
        get;
        set;
    }
    global Id fileId {
        get;
        set;
    }
    global Integer packageCount {
        get;
        set;
    }
    global Id packageId {
        get;
        set;
    }
    global PackingSlipController() {

    }
    global virtual void doInit() {

    }
    global virtual String getLabelURL() {
        return null;
    }
    global virtual String getQrcodeUrl() {
        return null;
    }
    global virtual void setQrcodeValue(String qrcodeValueOrShipmentField, Boolean isShipmentField) {

    }
global class BoxInformation {
    global zkmulti__MCPackage__c box {
        get;
        set;
    }
    global List<zkmulti.PackingSlipController.Item> items {
        get;
        set;
    }
    global Integer packageCount;
    global zkmulti__MCShipmate_Preference__c preference {
        get;
        set;
    }
    global String shipDate {
        get;
        set;
    }
    global zkmulti__MCShipment__c shipment {
        get;
        set;
    }
    global zkmulti__MCShipmentInfo__c shipmentInfo {
        get;
        set;
    }
    global zkmulti__MCShipment_Special_Services__c shipmentSS {
        get;
        set;
    }
    global BoxInformation(Integer packageCount) {

    }
    global String getBoxNumberString() {
        return null;
    }
}
global class Item {
    global zkmulti__MCCustoms_Item__c item {
        get;
        set;
    }
    global Integer seqNumber {
        get;
        set;
    }
    global Item() {

    }
}
}
