@isTest
public class ExpectSObject_Tests {
    static String tooLong = 'Account*Name*Cannot*Be*More*Than*255*Characters=================================================================================================================================================================================================================';
    static Account account = new Account(Name = tooLong);

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