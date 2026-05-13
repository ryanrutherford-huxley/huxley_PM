/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class PickupWebServiceResponse {
    global List<zkmulti.PickupWebServiceResponse.ChargeDetail> chargeDetails;
    global String closeTime;
    global String closeTimeType;
    global String currencyCode;
    global String grandTotalOfAllCharge;
    global String localTime;
    global List<zkmulti.PickupWebServiceResponse.PickupScheduleOption> pickupScheduleOptions;
    global List<zkmulti.PickupWebServiceResponse.PickupStatus> pickupStatuses;
    global Datetime requestTimestamp {
        get;
        set;
    }
    global String responseName;
    global PickupWebServiceResponse() {

    }
global class ChargeDetail {
    global String chargeAmount;
    global String chargeCode;
    global String chargeDescription;
    global String taxAmount;
    global ChargeDetail() {

    }
}
global class PickupScheduleOption {
    global String accessTime;
    global Boolean available;
    global String carrier;
    global String countryRelationship;
    global String cutOffTime;
    global String description;
    global Date pickupDate;
    global Boolean residentialAvailable;
    global String scheduleDay;
    global PickupScheduleOption() {

    }
}
global class PickupStatus {
    global String contactName;
    global String pickupNumber;
    global String pickupStatusMessage;
    global String serviceDate;
    global PickupStatus() {

    }
}
}
