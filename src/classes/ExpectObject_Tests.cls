@isTest
public class ExpectObject_Tests {
    @isTest
    static void ExpectEqualObjectsShouldNotThrow() {
        Object one = new List<Account>{new Account(Name = 'Hello', Phone = '1')};
        Object two = new List<Account>{new Account(Phone = '1', Name = 'Hello')};

        Expect.that(one).shouldEqual(two);
    }

    @isTest
    static void ExpectComplexEqualObjectsShouldNotThrow() {
        Account account = new Account(Name = 'Hello');
        insert account;

        Object one = new Map<Id,SObject>{account.Id => account};
        Object two = new Map<Id,SObject>{account.Id => account};

        Expect.that(one).shouldEqual(two);
    }

    private class UnequalSimpleObject extends ThrowCheck {
        protected override void testCase() {
            Object one = new Account();
            Object two = new Contact();
            Expect.that(one).shouldEqual(two);
        }
    }

    @isTest
    static void ExpectSimpleObjectsThatAreNotEqualShouldThrow() {
        Expect.UseSystemAssert = false;
        new UnequalSimpleObject().verify();
    }

    private class UnequalComplexObject extends ThrowCheck {
        protected override void testCase() {
            Account oneAccount = new Account(Name = 'Hello');
            insert oneAccount;
            Object one = new Map<Id,SObject>{oneAccount.Id => oneAccount};

            Account twoAccount = new Account(Name = 'Hello');
            insert twoAccount;
            Object two = new Map<Id,SObject>{twoAccount.Id => twoAccount};

            Expect.that(one).shouldEqual(two);
        }
    }

    @isTest
    static void ExpectComplexObjectsThatAreNotEqualShouldThrow() {
        Expect.UseSystemAssert = false;
        new UnequalComplexObject().verify();
    }

    @isTest
    static void ExpectNotEqualObjectsShouldNotThrowForNotEquals() {
        Object one = new Account();
        Object two = new Contact();

        Expect.that(one).shouldNotEqual(two);
    }

    private class EqualSimpleObject extends ThrowCheck {
        protected override void testCase() {
            Object one = new Account(Name = 'EF');
            Object two = new Account(Name = 'EF');

            Expect.that(one).shouldNotEqual(two);
        }
    }

    @isTest
    static void ExpectEqualObjectsShouldThrowForNotEquals() {
        Expect.UseSystemAssert = false;
        new EqualSimpleObject().verify();
    }
}