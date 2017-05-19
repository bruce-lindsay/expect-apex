@isTest
public class ExpectSObjectType_Tests {
    private static final ExpectSObjectType sObjectTypeExpectation = Expect.That(Schema.Account.SObjectType);

    @isTest
    static void ExpectShouldNotHaveRecordsDoesNotThrow() {
        sObjectTypeExpectation.negated.shouldHaveRecords();
    }

    private class ShouldNotHaveRecordsThrows extends ThrowCheck {
        ShouldNotHaveRecordsThrows() {
            insert new Account(Name='NewAccount');
        }
        protected override void testCase() {
            sObjectTypeExpectation.negated.shouldHaveRecords();
        }

        protected override void testCase(String message) {
            sObjectTypeExpectation.negated.shouldHaveRecords(message);
        }
    }

    @isTest
    static void ExpectShouldNotHaveRecordsThrows() {
        new ShouldNotHaveRecordsThrows().verifyMessage('Expected Account should not have records');
        new ShouldNotHaveRecordsThrows().verifyCustomMessage('No records should be found!');
    }

    @isTest
    static void ExpectShouldHaveRecordsDoesNotThrow() {
        new ExpectSObjectType(Schema.Account.SObjectType).negated.shouldHaveRecords();
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