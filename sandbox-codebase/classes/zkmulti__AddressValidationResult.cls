/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class AddressValidationResult {
    global List<zkmulti.AddressValidationResult.AddressResult> addresses {
        get;
        set;
    }
    global Map<String,Boolean> attributes {
        get;
        set;
    }
    global Boolean isResidential {
        get;
        set;
    }
    global Boolean isValid {
        get;
        set;
    }
    global List<String> messages {
        get;
        set;
    }
    global AddressValidationResult() {

    }
global class AddressResult {
    global String addressClassificationCode {
        get;
        set;
    }
    global String city {
        get;
        set;
    }
    global String country {
        get;
        set;
    }
    global String description {
        get;
        set;
    }
    global String postalCode {
        get;
        set;
    }
    global String postalCodeZip4 {
        get;
        set;
    }
    global Boolean residential {
        get;
        set;
    }
    global String state {
        get;
        set;
    }
    global List<String> streetLines {
        get;
        set;
    }
    global String urbanizationCode {
        get;
        set;
    }
    global AddressResult() {

    }
}
}
