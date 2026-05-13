/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class SpeeDeeFtpUploadBatch implements Database.AllowsCallouts, Database.Batchable<SObject>, Database.Stateful {
    global Map<String,String> inputParams;
    global Boolean isNeedSendToFtp;
    global Id preferenceId;
    global Date shipDate;
    global Id shipmentId;
    global SpeeDeeFtpUploadBatch() {

    }
    global SpeeDeeFtpUploadBatch(Id prefId) {

    }
    global SpeeDeeFtpUploadBatch(Id prefId, Id shipId) {

    }
    global SpeeDeeFtpUploadBatch(Id prefId, Date sDate, Boolean sendToFtp, Map<String,String> inputParams) {

    }
    global void execute(Database.BatchableContext BC, List<zkmulti__MCShipment__c> scope) {

    }
    global void finish(Database.BatchableContext BC) {

    }
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return null;
    }
}
