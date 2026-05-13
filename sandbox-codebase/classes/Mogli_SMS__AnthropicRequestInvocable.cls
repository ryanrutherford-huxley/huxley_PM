/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class AnthropicRequestInvocable {
    @InvocableVariable( required=true)
    global String anthropicVersion;
    @InvocableVariable( required=true)
    global String credentialFullName;
    @InvocableVariable( required=true)
    global String credentialType;
    @InvocableVariable( required=true)
    global Integer maxTokens;
    @InvocableVariable( required=true)
    global List<Mogli_SMS.AIMessage> messages;
    @InvocableVariable( required=true)
    global String model;
    @InvocableVariable( required=false)
    global String system_prompt;
    @InvocableVariable( required=true)
    global Decimal temperature;
    @InvocableVariable( required=false)
    global String tool_choice;
    @InvocableVariable( required=false)
    global String tool_result_key;
    @InvocableVariable( required=false)
    global String tools_schema;
    global AnthropicRequestInvocable() {

    }
}
