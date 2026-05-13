/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class QueueableCampaignMemberStatusUpdate {
    global QueueableCampaignMemberStatusUpdate() {

    }
    @InvocableMethod(label='Campaign Member Status Update (Multi Carrier)' description='Campaign Member Status Update. Queueable Jobs')
    global static void campaignMemberStatusUpdate(List<zkmulti.QueueableCampaignMemberStatusUpdate.CampaignMemberStatusParameter> inputList) {

    }
global class CampaignMemberStatusParameter {
    @InvocableVariable( required=true)
    global String campaignMemberId;
    @InvocableVariable( required=true)
    global String memberStatus;
    global CampaignMemberStatusParameter() {

    }
}
}
