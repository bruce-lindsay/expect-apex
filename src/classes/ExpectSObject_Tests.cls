@isTest
public class ExpectSObject_Tests {
    static Contact one;
    static Contact two;

    static void testSetup() {
        one = TestDataGenerator.createContact();
        insert one;

        two = TestDataGenerator.createContact();
        two.Email = 'somethingInTheWaySheMoves@gmail.com';
        two.EmailUnique__c = two.Email;
        insert two;

        two.Email = one.Email;
    }

    @isTest
    static void ExpectShouldProperlyFailForExceptionOnUpdate() {
        testSetup();
        Expect.that(two).whenTryingToUpdate().shouldFailWithMessage('DUPLICATE_VALUE');
    }

    private class ShouldNotBeOK extends ThrowCheck {
        protected override void testCase() {
            Expect.that(two).whenTryingToUpdate().shouldBeOK();
        }

        protected override void testCase(String message) {
            Expect.that(two).whenTryingToUpdate().shouldBeOK();
        }
    }

    @isTest
    static void ExpectShouldNotBeOKForThrownExceptionOnUpdate() {
        testSetup();
        new ShouldNotBeOK().verify();
    }
}