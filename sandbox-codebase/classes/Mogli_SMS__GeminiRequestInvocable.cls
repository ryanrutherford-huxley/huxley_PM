/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class GeminiRequestInvocable {
    @InvocableVariable( required=true)
    global String credentialFullName;
    @InvocableVariable( required=true)
    global String credentialType;
    @InvocableVariable( required=false)
    global String DangerousContent_threshold;
    @InvocableVariable( required=false)
    global String Harassment_threshold;
    @InvocableVariable( required=false)
    global String HateSpeech_threshold;
    @InvocableVariable( required=false)
    global Integer maxOutputTokens;
    @InvocableVariable( required=true)
    global List<Mogli_SMS.AIMessage> messages;
    @InvocableVariable( required=true)
    global String model;
    @InvocableVariable( required=false)
    global String response_schema;
    @InvocableVariable( required=false)
    global String SexuallyExplicit_threshold;
    @InvocableVariable( required=false)
    global String SystemPrompt;
    @InvocableVariable( required=false)
    global Decimal temperature;
    @InvocableVariable( required=false)
    global Integer top_k;
    @InvocableVariable( required=false)
    global Decimal top_p;
    global GeminiRequestInvocable() {

    }
}
