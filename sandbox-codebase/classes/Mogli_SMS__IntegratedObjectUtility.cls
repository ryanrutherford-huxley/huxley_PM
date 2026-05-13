/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class IntegratedObjectUtility {
    global IntegratedObjectUtility() {

    }
    @InvocableMethod(label='Query Mogli Integrated Object' description='Find key information from Mogli Integration Object from ID of the parent record')
    global static List<Mogli_SMS.IntegratedObjectUtility.IntegratedObjectQueryOutput> QueryMIO(List<Mogli_SMS.IntegratedObjectUtility.IntegratedObjectQueryInput> inputs) {
        return null;
    }
global class IntegratedObjectQueryInput {
    @InvocableVariable( required=true)
    global String recordId;
    global IntegratedObjectQueryInput() {

    }
}
global class IntegratedObjectQueryOutput {
    @InvocableVariable( required=true)
    global String DebugField;
    @InvocableVariable( required=true)
    global String DefaultGateway_APIName;
    @InvocableVariable( required=true)
    global String LookupFieldAPIName;
    @InvocableVariable( required=true)
    global String MIOrecordId;
    @InvocableVariable( required=true)
    global String MogliNumber_APIName;
    @InvocableVariable( required=true)
    global String MogliOptOpt_APIName;
    @InvocableVariable( required=true)
    global String ObjectName;
    @InvocableVariable( required=true)
    global String QualifiedApiName;
    @InvocableVariable( required=false)
    global String RecordMogliFieldQuery;
    @InvocableVariable( required=true)
    global String SOQL_filter;
    @InvocableVariable( required=true)
    global Boolean SuccessFlag;
    global IntegratedObjectQueryOutput() {

    }
}
}
