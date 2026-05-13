/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BulkProcessShipment implements Database.AllowsCallouts, Database.Batchable<SObject>, Database.Stateful {
    global zkmulti.BulkProcessInterface outboundBulkInterface;
    global Map<String,Object> params;
    global zkmulti.BulkProcessInterface returnBulkInterface;
    global BulkProcessShipment() {

    }
    global BulkProcessShipment(Id shipId) {

    }
    global void execute(Database.BatchableContext BC, List<SObject> scope) {

    }
    global void finish(Database.BatchableContext BC) {

    }
    global void setOutboundBulkInterface(zkmulti.BulkProcessInterface outboundBulkInterface) {

    }
    global void setParams(Map<String,Object> batchParams) {

    }
    global void setReturnBulkInterface(zkmulti.BulkProcessInterface returnBulkInterface) {

    }
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return null;
    }
}
