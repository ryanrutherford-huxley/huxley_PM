@IsTest
private class InboundEmailToTaskHandlerTest {

    @IsTest
    static void testBasicInsertWithSenderAndBody() {
        InboundEmailToTaskHandler.TEST_OWNER_ID = UserInfo.getUserId();

        Messaging.InboundEmail email = new Messaging.InboundEmail();
        email.subject = 'Test Subject';
        email.fromName = 'Test Sender';
        email.plainTextBody = 'This is a test body.';

        Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();
        env.fromAddress = 'test@example.com';

        Test.startTest();
        Messaging.InboundEmailResult result =
            new InboundEmailToTaskHandler().handleInboundEmail(email, env);
        Test.stopTest();

        System.assertEquals(true, result.success);

        Task t = [
            SELECT Subject, Description, Status, Priority, OwnerId
            FROM Task
            WHERE OwnerId = :UserInfo.getUserId()
            AND Subject = 'Test Subject'
            LIMIT 1
        ];

        System.assertEquals('Test Subject', t.Subject);
        System.assert(t.Description.contains('Test Sender <test@example.com>'));
        System.assert(t.Description.contains('This is a test body.'));
        System.assertEquals('Not Started', t.Status);
        System.assertEquals('Normal', t.Priority);
    }

    @IsTest
    static void testBlankSubjectDefaultsToNoSubject() {
        InboundEmailToTaskHandler.TEST_OWNER_ID = UserInfo.getUserId();

        Messaging.InboundEmail email = new Messaging.InboundEmail();
        email.subject = '   ';
        email.fromName = 'Test Sender';
        email.plainTextBody = 'Body text';

        Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();
        env.fromAddress = 'test@example.com';

        Test.startTest();
        Messaging.InboundEmailResult result =
            new InboundEmailToTaskHandler().handleInboundEmail(email, env);
        Test.stopTest();

        System.assertEquals(true, result.success);

        Task t = [
            SELECT Subject
            FROM Task
            WHERE OwnerId = :UserInfo.getUserId()
            AND Subject = 'No Subject'
            LIMIT 1
        ];

        System.assertEquals('No Subject', t.Subject);
    }

    @IsTest
    static void testForwardPrefixRemoval() {
        InboundEmailToTaskHandler.TEST_OWNER_ID = UserInfo.getUserId();

        Messaging.InboundEmail email = new Messaging.InboundEmail();
        email.subject = 'Fwd: FW: Hello';
        email.fromName = 'Test Sender';
        email.plainTextBody = 'Body text';

        Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();
        env.fromAddress = 'test@example.com';

        Test.startTest();
        Messaging.InboundEmailResult result =
            new InboundEmailToTaskHandler().handleInboundEmail(email, env);
        Test.stopTest();

        System.assertEquals(true, result.success);

        Task t = [
            SELECT Subject
            FROM Task
            WHERE OwnerId = :UserInfo.getUserId()
            AND Subject = 'Hello'
            LIMIT 1
        ];

        System.assertEquals('Hello', t.Subject);
    }

    @IsTest
    static void testHtmlBodyFallback() {
        InboundEmailToTaskHandler.TEST_OWNER_ID = UserInfo.getUserId();

        Messaging.InboundEmail email = new Messaging.InboundEmail();
        email.subject = 'HTML Test';
        email.fromName = 'HTML Sender';
        email.plainTextBody = null;
        email.htmlBody = '<p>Hello from HTML</p>';

        Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();
        env.fromAddress = 'html@example.com';

        Test.startTest();
        Messaging.InboundEmailResult result =
            new InboundEmailToTaskHandler().handleInboundEmail(email, env);
        Test.stopTest();

        System.assertEquals(true, result.success);

        Task t = [
            SELECT Subject, Description
            FROM Task
            WHERE OwnerId = :UserInfo.getUserId()
            AND Subject = 'HTML Test'
            LIMIT 1
        ];

        System.assert(t.Description.contains('HTML Sender <html@example.com>'));
        System.assert(t.Description.contains('<p>Hello from HTML</p>'));
    }
}