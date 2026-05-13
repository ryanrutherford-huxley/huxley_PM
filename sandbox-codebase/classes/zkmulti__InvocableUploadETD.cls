/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class InvocableUploadETD {
    global static Boolean STOP_INVOCABLE;
    global InvocableUploadETD() {

    }
    @InvocableMethod(label='Upload ETD (Multi Carrier)' description='Upload Electronic Trade Documents.')
    global static void trackShipment(List<zkmulti.InvocableUploadETD.ETDParameter> inputList) {

    }
global class ETDParameter {
    @InvocableVariable(label='Custom Address Source Object Id' required=false)
    global Id customAddressId;
    @InvocableVariable( required=false)
    global String destinationCountryCode;
    @InvocableVariable( required=false)
    global String encryptedKey;
    @InvocableVariable(label='Save documents to shipment record' description='Allowed values: MOVE, COPY' required=false)
    global String fileTransferType;
    @InvocableVariable(label='SoQL condition' description='Example: ContentType = 'application/pdf'' required=true)
    global String filter;
    @InvocableVariable( required=false)
    global String originCountryCode;
    @InvocableVariable(label='Salesforce Object Id' required=true)
    global Id parentId;
    @InvocableVariable( required=false)
    global Id preferenceId;
    @InvocableVariable(label='Attachment or File' required=true)
    global String storageType;
    @InvocableVariable( required=false)
    global String trackingNumber;
    @InvocableVariable(label='Save success or error status to the original object (Api Field Name)' required=false)
    global String uploadStatus;
    global ETDParameter() {

    }
}
}
