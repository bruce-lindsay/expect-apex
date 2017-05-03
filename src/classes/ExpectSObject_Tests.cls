@isTest
public class ExpectSObject_Tests {
    private static Account getAccount() { return new Account(); }

    @isTest
    static void ExpectShouldEqualShouldNotThrowForSameSObject() {
        Account one = getAccount();
        Account two = one;
        Account three = one;

        Expect.that(one).shouldEqual(two).andIt.shouldEqual(three);
    }

    private class NonEqualObjectShouldThrowForEqual extends ThrowCheck {
        protected override void testCase() {
            Account one = getAccount();
            Account two = getAccount();
            Expect.that(one).shouldEqual(two);
        }

        protected override void testCase(String message) {
            Account one = getAccount();
            Account two = getAccount();
            Expect.that(one).shouldEqual(two, message);
        }
    }

    @isTest
    static void ExpectShouldThrowWhenShouldEqualIsCalledForNonEqualSObjects() {
        new NonEqualObjectShouldThrowForEqual().verifyMessage('Expected Account:{} should be Account:{}');
        new NonEqualObjectShouldThrowForEqual().verifyCustomMessage('Hello');
    }

    @isTest
    static void ExpectShouldNotThrowForShouldNotEqualIfCalledForNonEqualSObjects() {
        Account one = getAccount();
        Account two = getAccount();

        Expect.that(one).shouldNotEqual(two);
    }

    private class EqualObjectShouldThrowForNotEqual extends ThrowCheck {
        protected override void testCase() {
            Account one = getAccount();
            Account two = one;
            Expect.that(one).shouldNotEqual(two);
        }

        protected override void testCase(String message) {
            Account one = getAccount();
            Account two = one;
            Expect.that(one).shouldNotEqual(two, message);
        }
    }

    @isTest
    static void ExpectShouldThrowForNotEqualForTwoEqualSObjects() {
        new EqualObjectShouldThrowForNotEqual().verifyMessage('Expected Account:{} should not be Account:{}');
        new EqualObjectShouldThrowForNotEqual().verifyCustomMessage('yes,hello');
    }

    @isTest
    static void ExpectShouldHandleComparingSObjectTypes() {
        Expect.that(getAccount()).sObjectTypeEquals(getAccount());
        Expect.that(getAccount()).sObjectTypeEquals(Schema.Account.SObjectType);
    }

    private class DifferentSObjectTypes extends ThrowCheck {
        protected override void testCase() {
            Expect.that(new Contact()).sObjectTypeEquals(getAccount());
        }

        protected override void testCase(String message) {
            Expect.that(new Contact()).sObjectTypeEquals(account.getSObjectType(), message);
        }
    }

    @isTest
    static void ExpectShouldThrowExceptionForDifferentSObjectTypesForEquals() {
        new DifferentSObjectTypes().verifyMessage('Expected Contact:{} should be Account');
        new DifferentSObjectTypes().verifyCustomMessage('Should throw for different SObjectTypes!');
    }

    @isTest
    static void ExpectShouldHandleNulls() {
        SObject sObjectInstance;
        Expect.that(sObjectInstance).shouldEqual(null);

        sObjectInstance = new Account();

        Expect.that(sObjectInstance).shouldNotEqual(null);
    }

    @isTest
    static void ExpectEquivalenceShouldNotEqualEqualityForSObjects() {
        Account oneAccount = getAccount();
        Account twoAccount = getAccount();

        Expect.that(oneAccount).shouldNotEqual(twoAccount);
    }

    @isTest
    static void ExpectErrorMessageDoesNotThrow() {
        Account account = new Account(Name='TooLong'.center(500, '-'));
        Expect.that(account).hasError().onInsert();
    }

    class ShouldHaveErrorOnInsertThrows extends ThrowCheck {
        protected override void testCase() {
            Account account = new Account(Name='NotTooLong');
            Expect.that(account).hasError().onInsert();
        }

        protected override void testCase(String message) {}
    }

    @isTest
    static void ExpectShouldHaveErrorOnInsertThrows() {
        new ShouldHaveErrorOnInsertThrows().verify();
    }

    @isTest
    static void ExpectShouldHaveInsertErrorDoesNotThrow() {
        Account account = new Account();
        Expect.that(account).shouldHaveInsertError();
    }

    @isTest
    static void ExpectShouldHaveInsertErrorWithExpectStringAndErrorMessageDoesNotThrow() {
        Account account = new Account();
        Expect.that(account)
            .shouldHaveInsertError()
            .andErrorMessage
            .shouldContain('REQUIRED_FIELD_MISSING');
    }

    class ShouldHaveInsertErrorThrows extends ThrowCheck {
        protected override void testCase() {
            Account account = new Account(Name='Name');
            Expect.that(account).shouldHaveInsertError();
        }

        protected override void testCase(String message) {}
    }

    @isTest
    static void ExpectShouldHaveInsertErrorThrows() {
        new ShouldHaveInsertErrorThrows().verify();
    }

    class ShouldHaveInsertErrorWithExpectStringThrows extends ThrowCheck {
        protected override void testCase() {
            Account account = new Account();
            Expect.that(account)
                .shouldHaveInsertError()
                .andErrorMessage
                .shouldContain('ExpectSObject_Tests.cls');
        }

        protected override void testCase(String message) {}
    }

    @isTest
    static void ExpectShouldHaveInsertErrorWithExpectStringThrows() {
        new ShouldHaveInsertErrorWithExpectStringThrows().verify();
    }
}