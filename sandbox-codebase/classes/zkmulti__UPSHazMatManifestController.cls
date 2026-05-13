/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class UPSHazMatManifestController {
    global zkmulti.UPSHazMatManifestController.ADRTransportCategoryTable adrTransportCategoryTable {
        get;
        set;
    }
    global Boolean isEuManifest {
        get;
        set;
    }
    global Boolean isRenderSummaryGrid {
        get;
        set;
    }
    global String manifestName {
        get;
        set;
    }
    global zkmulti.UPSHazMatManifestController.PreferenceDetail preferenceDetail {
        get;
        set;
    }
    global List<zkmulti.UPSHazMatManifestController.RegulationSet> regulationSets {
        get;
        set;
    }
    global UPSHazMatManifestController() {

    }
    global void doInit() {

    }
global class ADRTransportCategory {
    global String category {
        get;
        set;
    }
    global Integer points {
        get;
        set;
    }
    global Decimal units {
        get;
        set;
    }
    global ADRTransportCategory(String categoryParam) {

    }
}
global class ADRTransportCategoryTable {
    global List<zkmulti.UPSHazMatManifestController.ADRTransportCategory> categories {
        get;
        set;
    }
    global ADRTransportCategoryTable() {

    }
}
global class HazMatDetail {
    global Integer adrPoints;
    global Decimal adrUnits;
    global String description {
        get;
        set;
    }
    global zkmulti__HazMatDetails__c hazMatRecord {
        get;
        set;
    }
    global Decimal qty;
    global HazMatDetail() {

    }
}
global class PreferenceDetail {
    global String accountNumber {
        get;
        set;
    }
    global String billingCity {
        get;
        set;
    }
    global String billingCountry {
        get;
        set;
    }
    global String billingCountryCode {
        get;
        set;
    }
    global String billingState {
        get;
        set;
    }
    global String billingStreet {
        get;
        set;
    }
    global String billingZip {
        get;
        set;
    }
    global String companyName {
        get;
        set;
    }
    global PreferenceDetail() {

    }
}
global class RegulationSet {
    global String emergencyContactName {
        get;
        set;
    }
    global String emergencyPhone {
        get;
        set;
    }
    global List<zkmulti.UPSHazMatManifestController.HazMatDetail> hazMatDetails {
        get;
        set;
    }
    global String packedString {
        get;
        set;
    }
    global String regulationSet {
        get;
        set;
    }
    global String serviceType {
        get;
        set;
    }
    global String trackingNumber {
        get;
        set;
    }
    global RegulationSet() {

    }
}
}
