@isTest
public class ExpectSObject_Tests {
    @isTest
    static void ExpectShouldProperlyFailForDMLException() {
        Contact one = TestDataGenerator.createContact();
        insert one;

        Contact two = TestDataGenerator.createContact();
        two.Email = 'somethingInTheWaySheMoves@gmail.com';
        two.EmailUnique__c = two.Email;
        insert two;

        two.Email = one.Email;

        Expect.that(two).whenTryingToUpdate().shouldFailWithMessage('DUPLICATE_VALUE');
    }
}