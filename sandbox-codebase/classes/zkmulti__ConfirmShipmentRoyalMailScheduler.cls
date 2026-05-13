/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class ConfirmShipmentRoyalMailScheduler implements Database.AllowsCallouts, Database.Batchable<SObject>, Database.Stateful, System.Schedulable {
    global Integer batchSize;
    global Integer chunkCount;
    global zkmulti.ObjectMetaService.FilterDataWrap filterData;
    global Map<String,Object> params;
    global zkmulti__MCShipmate_Preference__c preference;
    global Id preferenceId;
    global zkmulti__Shipmate_Preference_Info__c preferenceInfo;
    global ConfirmShipmentRoyalMailScheduler(Id preferenceId) {

    }
    global ConfirmShipmentRoyalMailScheduler(Integer batchSize, Id preferenceId) {

    }
    global ConfirmShipmentRoyalMailScheduler(Integer batchSize, Map<String,Object> params) {

    }
    global void execute(System.SchedulableContext sc) {

    }
    global void execute(Database.BatchableContext BC, List<zkmulti__MCShipment__c> scope) {

    }
    global void finish(Database.BatchableContext BC) {

    }
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return null;
    }
}
