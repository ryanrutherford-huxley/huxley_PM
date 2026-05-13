/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class McInvocableTags implements Database.AllowsCallouts, System.Queueable {
    @InvocableMethod(label='Manage Mailchimp Tags' description='Add or remove tags from Mailchimp audience members. Use this to apply or remove tags from Leads, Contacts, or Person Accounts that are already subscribed to a Mailchimp audience.')
    global static List<mone.McInvocableTags.TagActionResult> manageTags(List<mone.McInvocableTags.TagActionRequest> requests) {
        return null;
    }
global class TagActionRequest {
    @InvocableVariable(label='Dynamic Tags' description='Additional tags that can be passed dynamically, comma or semicolon separated' required=false)
    global String dynamicTags;
    @InvocableVariable(label='Email Field' description='The API name of the email field to use (e.g., Email). Defaults to Email if not specified.' required=false)
    global String emailField;
    @InvocableVariable(label='Process Synchronously' description='If true, processes immediately without queuing. Defaults to false (queued processing).' required=false)
    global Boolean isAsync;
    @InvocableVariable(label='Mailchimp Tags' description='Semicolon-separated list of tag names to add or remove (e.g., "VIP;Newsletter;Prospect")' required=false)
    global String mailchimpTags;
    @InvocableVariable(label='Record ID' description='The Salesforce ID of the Lead, Contact, or Person Account to add or remove tags from' required=true)
    global String recordId;
    @InvocableVariable(label='Mailchimp Audience ID' description='The Salesforce ID of the Mailchimp_List__c record representing the Mailchimp audience where the member is subscribed' required=true)
    global String sfListId;
    @InvocableVariable(label='Add Tags' description='Set to true to add tags to the member, or false to remove tags from the member. Defaults to false (remove tags).' required=false)
    global Boolean tagAction;
    @InvocableVariable(label='Replace All Tags' description='If true, replaces all existing tags with the new tags. If false, adds or removes tags without affecting other existing tags.' required=false)
    global Boolean tagReplace;
    global TagActionRequest() {

    }
}
global class TagActionResult {
    @InvocableVariable(label='Message' description='Status message or error description if the operation failed' required=false)
    global String errorMessage;
    @InvocableVariable(label='Success' description='True if the tags were successfully added or removed from the Mailchimp member' required=false)
    global Boolean isSuccess;
    global TagActionResult() {

    }
}
}
