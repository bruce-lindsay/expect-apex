@isTest
public class ExpectSObjectType_Tests {
    private static final ExpectSObjectType sObjectTypeExpectation = Expect.That(Schema.Account.SObjectType);

    @isTest
    static void ExpectShouldNotHaveRecordsDoesNotThrow() {
        sObjectTypeExpectation.shouldNotHaveRecords();
    }

    private class ShouldNotHaveRecordsThrows extends ThrowCheck {
        ShouldNotHaveRecordsThrows() {
            insert new Account(Name='NewAccount');
        }
        protected override void testCase() {
            sObjectTypeExpectation.shouldNotHaveRecords();
        }

        protected override void testCase(String message) {
            sObjectTypeExpectation.shouldNotHaveRecords(message);
        }
    }

    @isTest
    static void ExpectShouldNotHaveRecordsThrows() {
        new ShouldNotHaveRecordsThrows().verifyMessage('Expected Account should not have records');
        new ShouldNotHaveRecordsThrows().verifyCustomMessage('No records should be found!');
    }

    @isTest
    static void ExpectShouldHaveRecordsDoesNotThrow() {
        new ExpectSObjectType(Schema.Account.SObjectType).shouldNotHaveRecords();
    }

    private class ShouldHaveRecordsThrows extends ThrowCheck {
        protected override void testCase() {
            sObjectTypeExpectation.shouldHaveRecords();
        }

        protected override void testCase(String message) {
            sObjectTypeExpectation.shouldHaveRecords(message);
        }
    }

    @isTest
    static void ExpectShouldHaveRecordsThrows() {
        new ShouldHaveRecordsThrows().verifyMessage('Expected Account should have records');
        new ShouldHaveRecordsThrows().verifyCustomMessage('Records should be found!');
    }
}