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
        private final SObject sobjectx;
        ShouldHaveInsertErrorThrows(SObject sobjectx) {
            this.sobjectx = sobjectx;
        }
        protected override void testCase() {
            Expect.that(sobjectx).shouldHaveInsertError();
        }

        protected override void testCase(String message) {
            System.assert(false, 'not implemented');
        }
    }

    @isTest
    static void ExpectShouldHaveInsertErrorThrows() {
        Account validAccount = new Account(Name='Name');
        ThrowCheck throwCheckInstance = new ShouldHaveInsertErrorThrows(validAccount);

        Expect.that(throwCheckInstance.verify())
            .shouldEqual('Expected ' + String.valueOf(validAccount) +
                         ' should error on insert');
    }

    class ShouldHaveInsertErrorWithExpectStringThrows extends ThrowCheck {
        protected override void testCase() {
            Account account = new Account();
            Expect.that(account)
                .shouldHaveInsertError()
                .andErrorMessage
                .shouldContain('ExpectSObject_Tests.cls');
        }

        protected override void testCase(String message) {
            System.assert(false, 'not implemented');
        }
    }

    @isTest
    static void ExpectShouldHaveInsertErrorWithExpectStringThrows() {
        String message = new ShouldHaveInsertErrorWithExpectStringThrows().verify();
        Expect.that(message.startsWith('Expected')).shouldBeTrue();
        Expect.that(message.endsWith('should contain ExpectSObject_Tests.cls')).shouldBeTrue();
    }

    @isTest
    static void ExpectShouldHaveUpsertErrorDoesNotThrow() {
        Expect.that(new Account()).shouldHaveUpsertError();
    }

    class ShouldHaveUpsertErrorThrows extends ThrowCheck {
        private final SObject sobjectx;
        ShouldHaveUpsertErrorThrows(SObject sobjectx) {
            this.sobjectx = sobjectx;
        }
        protected override void testCase() {
            Expect.that(sobjectx).shouldHaveUpsertError();
        }

        protected override void testCase(String message) {
            System.assert(false, 'not implemented');
        }
    }

    @isTest
    static void ExpectShouldHaveUpsertErrorThrows() {
        Account validAccount = new Account(Name='Name');
        ThrowCheck throwCheckInstance = new ShouldHaveUpsertErrorThrows(validAccount);

        Expect.that(throwCheckInstance.verify())
            .shouldEqual('Expected ' + String.valueOf(validAccount) +
                         ' should error on upsert');
    }


    @isTest
    static void ExpectShouldHaveUpdateErrorDoesNotThrow() {
        Expect.that(new Account()).shouldHaveUpdateError();
    }

    class ShouldHaveUpdateErrorThrows extends ThrowCheck {
        private final SObject sobjectx;
        ShouldHaveUpdateErrorThrows(SObject sobjectx) {
            this.sobjectx = sobjectx;
        }
        protected override void testCase() {
            Expect.that(sobjectx).shouldHaveUpdateError();
        }

        protected override void testCase(String message) {
            System.assert(false, 'not implemented');
        }
    }

    @isTest
    static void ExpectShouldHaveUpdateErrorThrows() {
        Account validAccount = new Account(Name='Name');
        insert validAccount;

        ThrowCheck throwCheckInstance = new ShouldHaveUpdateErrorThrows(validAccount);

        Expect.that(throwCheckInstance.verify())
            .shouldEqual('Expected ' + String.valueOf(validAccount) +
                         ' should error on update');
    }

    @isTest
    static void ExpectShouldHaveDeleteErrorDoesNotThrow() {
        Expect.that(new Account()).shouldHaveDeleteError();
    }

    class ShouldHaveDeleteErrorThrows extends ThrowCheck {
        private final SObject sobjectx;
        ShouldHaveDeleteErrorThrows(SObject sobjectx) {
            this.sobjectx = sobjectx;
        }
        protected override void testCase() {
            Expect.that(sobjectx).shouldHaveDeleteError();
        }

        protected override void testCase(String message) {
            System.assert(false, 'not implemented');
        }
    }

    @isTest
    static void ExpectShouldHaveDeleteErrorThrows() {
        Account validAccount = new Account(Name='Name');
        insert validAccount;

        ThrowCheck throwCheckInstance = new ShouldHaveDeleteErrorThrows(validAccount);

        Expect.that(throwCheckInstance.verify())
            .shouldEqual('Expected ' + String.valueOf(validAccount) +
                         ' should error on delete');
    }
}