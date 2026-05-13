global class InboundEmailToTaskHandler implements Messaging.InboundEmailHandler {

    @TestVisible
    private static String QUEUE_DEVELOPER_NAME = 'Patient_Orders';

    @TestVisible
    private static Id TEST_OWNER_ID;

    private static Id getTaskOwnerId() {
        if (Test.isRunningTest() && TEST_OWNER_ID != null) {
            return TEST_OWNER_ID;
        }

        Group g = [
            SELECT Id
            FROM Group
            WHERE Type = 'Queue'
            AND DeveloperName = :QUEUE_DEVELOPER_NAME
            LIMIT 1
        ];
        return g.Id;
    }

    global Messaging.InboundEmailResult handleInboundEmail(
        Messaging.InboundEmail email,
        Messaging.InboundEnvelope envelope
    ) {
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();

        try {
            String subjectVal = email.subject;
            if (subjectVal == null || subjectVal.trim() == '') {
                subjectVal = 'No Subject';
            }

            subjectVal = subjectVal.replace('Fwd: ', '').replace('FW: ', '');
            if (subjectVal.length() > 255) {
                subjectVal = subjectVal.substring(0, 255);
            }

            String senderEmail = envelope.fromAddress;
            if (senderEmail == null || senderEmail.trim() == '') {
                senderEmail = 'Unknown Email';
            }

            String senderName = email.fromName;
            if (senderName == null || senderName.trim() == '') {
                senderName = 'Unknown Sender';
            }

            String bodyVal = email.plainTextBody;
            if (bodyVal == null || bodyVal.trim() == '') {
                bodyVal = email.htmlBody;
            }
            if (bodyVal == null || bodyVal.trim() == '') {
                bodyVal = 'No body received.';
            }

            String descriptionVal =
                'From: ' + senderName + ' <' + senderEmail + '>' + '\n\n' +
                bodyVal;

            if (descriptionVal.length() > 32000) {
                descriptionVal = descriptionVal.substring(0, 32000);
            }

            Task t = new Task();
            t.Subject = subjectVal;
            t.Description = descriptionVal;
            t.Status = 'Not Started';
            t.Priority = 'Normal';
            t.OwnerId = getTaskOwnerId();

            insert t;
            result.success = true;

        } catch (Exception e) {
            result.success = false;
        }

        return result;
    }
}