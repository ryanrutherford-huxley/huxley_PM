/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class GetObjectName {
    global GetObjectName() {

    }
    @InvocableMethod(label='Get sObject API Name' description='Get sObject API Name')
    global static List<heymarket.GetObjectName.FlowOutput> getObjectAPIName(List<heymarket.GetObjectName.FlowInput> recordsIds) {
        return null;
    }
global class FlowInput {
    @InvocableVariable(label='Record Id' description='Saleforce Record Id' required=true)
    global String recordId;
    global FlowInput() {

    }
    global FlowInput(String recordId) {

    }
}
global class FlowOutput {
    @InvocableVariable(label='Object API Name' description='Object API Name' required=false)
    global String objectName;
    global FlowOutput() {

    }
    global FlowOutput(String objectName) {

    }
}
}
