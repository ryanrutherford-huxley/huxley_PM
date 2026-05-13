/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class McInvocableMembers implements Database.AllowsCallouts, System.Queueable {
    @InvocableMethod(label='Manage Mailchimp Members' description='Subscribe or unsubscribe Salesforce Leads, Contacts, or Person Accounts to/from Mailchimp audiences (email lists). Use this to add or remove people from Mailchimp marketing audiences.')
    global static List<mone.McInvocableMembers.MemberActionResult> manageMembers(List<mone.McInvocableMembers.MemberActionRequest> requests) {
        return null;
    }
global class MemberActionRequest {
    @InvocableVariable(label='Dynamic Tags' description='Additional tags that can be passed dynamically, comma or semicolon separated' required=false)
    global String dynamicTags;
    @InvocableVariable(label='Email Field' description='The API name of the email field to use (e.g., Email). Defaults to Email if not specified.' required=false)
    global String emailField;
    @InvocableVariable(label='Process Synchronously' description='If true, processes immediately without queuing. Defaults to false (queued processing).' required=false)
    global Boolean isAsync;
    @InvocableVariable(label='Mailchimp Tags' description='Semicolon-separated list of tag names to apply to the member (e.g., "Newsletter;VIP")' required=false)
    global String mailchimpTags;
    @InvocableVariable(label='Subscribe Action' description='Set to true to subscribe (add) the member to the audience, or false to unsubscribe (remove) them. Defaults to true for adding members.' required=false)
    global Boolean memberAction;
    @InvocableVariable(label='Record ID' description='The Salesforce ID of the Lead, Contact, or Person Account to add or remove from the Mailchimp audience' required=true)
    global String recordId;
    @InvocableVariable(label='Resubscribe' description='If true, allows resubscribing a previously unsubscribed member.' required=false)
    global Boolean resubscribe;
    @InvocableVariable(label='Mailchimp Audience ID' description='The Salesforce ID of the Mailchimp_List__c record representing the Mailchimp audience/list' required=true)
    global String sfListId;
    @InvocableVariable(label='Replace Tags' description='If true, replaces all existing tags with the new tags. If false, adds tags to existing ones.' required=false)
    global Boolean tagReplace;
    global MemberActionRequest() {

    }
}
global class MemberActionResult {
    @InvocableVariable(label='Message' description='Status message or error description if the operation failed' required=false)
    global String errorMessage;
    @InvocableVariable(label='Success' description='True if the member was successfully added or removed from the Mailchimp audience' required=false)
    global Boolean isSuccess;
    global MemberActionResult() {

    }
}
}
