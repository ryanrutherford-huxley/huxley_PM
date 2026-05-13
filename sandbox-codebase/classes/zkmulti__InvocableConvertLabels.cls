/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class InvocableConvertLabels {
    global static Boolean STOP_INVOCABLE;
    global InvocableConvertLabels() {

    }
    @InvocableMethod(label='Convert Labels (Multi Carrier)' description='Convert Labels.')
    global static void convertLabels(List<zkmulti.InvocableConvertLabels.ConvertLabelsParameter> inputList) {

    }
global class ConvertLabelsParameter {
    @InvocableVariable(label='Auto Print' description='Zenkraft Printer Settings will be used to choose the Printer.' required=false)
    global Boolean autoPrint;
    @InvocableVariable(label='Filter Type' description='Allowed values: Extension, FullName, Prefix, PostFix, Contains' required=true)
    global String filterType;
    @InvocableVariable(label='Filter Value' required=true)
    global String filterValue;
    @InvocableVariable(label='Output Height Size' description='Example: 4' required=false)
    global String outputHeight;
    @InvocableVariable(label='Output File Prefix Name' description='Example: Converted_' required=false)
    global String outputPrefixName;
    @InvocableVariable(label='Output File Type' required=true)
    global String outputType;
    @InvocableVariable(label='Output Width Size' description='Example: 6' required=false)
    global String outputWidth;
    @InvocableVariable(label='Salesforce Object Id' required=true)
    global Id parentId;
    @InvocableVariable(label='Processing Type' description='Allowed values: New, Replace' required=false)
    global String processingType;
    @InvocableVariable(label='Attachment or File' required=true)
    global String storageType;
    global ConvertLabelsParameter() {

    }
}
}
