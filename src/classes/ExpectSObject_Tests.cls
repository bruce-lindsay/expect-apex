@isTest
public class ExpectSObject_Tests {
    static String tooLong = 'Account*Name*Cannot*Be*More*Than*255*Characters=================================================================================================================================================================================================================';
    static Account account = new Account(Name = tooLong);

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
    static void ExpectShouldProperlyFailForExceptionOnUpdate() {
        Expect.that(account).whenTryingToUpsert().shouldFailWithMessage('');
    }

    private class ShouldNotBeOK extends ThrowCheck {
        protected override void testCase() {
            Expect.that(account).whenTryingToUpsert().shouldBeOK();
        }

        protected override void testCase(String message) {
            Expect.that(account).whenTryingToUpsert().shouldBeOK();
        }
    }

    @isTest
    static void ExpectShouldNotBeOKForThrownExceptionOnUpdate() {
        new ShouldNotBeOK().verify();
    }
}