/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BillOfLadingController {
    global zkmulti.BillOfLadingController.ShipmentInformation info {
        get;
        set;
    }
    global Id shipmentId {
        get;
        set;
    }
    global BillOfLadingController() {

    }
    global void doInit() {

    }
    global String getBarCodeUrl() {
        return null;
    }
    global String getBarCodeUrl(String num) {
        return null;
    }
    global String getQrCodeUrl() {
        return null;
    }
    global String getQrCodeUrl(String num) {
        return null;
    }
global class GroupedContainter {
    global zkmulti__MCPackage__c handlingUnit {
        get;
        set;
    }
    global zkmulti__MCCustoms_Item__c item {
        get;
        set;
    }
    global GroupedContainter() {

    }
}
global class PackageContainer {
    global List<zkmulti__MCCustoms_Item__c> items {
        get;
        set;
    }
    global zkmulti__MCPackage__c pkg {
        get;
        set;
    }
    global PackageContainer() {

    }
}
global class ShipmentInformation {
    global zkmulti__MultiPackageShipment__c consolidation {
        get;
        set;
    }
    global List<zkmulti__MCCustoms_Item__c> customsItems {
        get;
        set;
    }
    global Map<Integer,Integer> customsItemsPackageMap {
        get;
        set;
    }
    global Map<String,Object> dynamicCarrierData {
        get;
        set;
    }
    global List<zkmulti.BillOfLadingController.GroupedContainter> emptyRows {
        get;
        set;
    }
    global zkmulti__ExportDetails__c exportDetails {
        get;
        set;
    }
    global List<zkmulti.BillOfLadingController.GroupedContainter> groupedContainters {
        get;
        set;
    }
    global Map<String,Object> originalObjectMap {
        get;
        set;
    }
    global List<zkmulti.BillOfLadingController.PackageContainer> packageContainers {
        get;
        set;
    }
    global List<zkmulti__MCPackage__c> packages {
        get;
        set;
    }
    global zkmulti__MCShipmate_Preference__c preference {
        get;
        set;
    }
    global zkmulti__RequestedShipmentDocuments__c reqShipDocs {
        get;
        set;
    }
    global zkmulti__CommercialInvoice__c selectedCI {
        get;
        set;
    }
    global zkmulti__EEIForm__c selectedEEIForm {
        get;
        set;
    }
    global zkmulti__NaftaCo__c selectedNafta {
        get;
        set;
    }
    global zkmulti__ProFormaInvoice__c selectedProForma {
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
    global zkmulti__FedExSmartPostDetails__c smartPostDetails {
        get;
        set;
    }
    global zkmulti.BillOfLadingController.TotalGroupedContainter totalGroupedContainter {
        get;
        set;
    }
    global Map<String,Object> variables {
        get;
        set;
    }
    global ShipmentInformation() {

    }
}
global class TotalGroupedContainter {
    global zkmulti__MCPackage__c handlingUnit {
        get;
        set;
    }
    global zkmulti__MCCustoms_Item__c item {
        get;
        set;
    }
    global TotalGroupedContainter() {

    }
}
}
