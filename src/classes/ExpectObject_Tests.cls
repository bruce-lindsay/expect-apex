@isTest
public class ExpectObject_Tests {
    private class StrictlyNonEqualObjects extends ThrowCheck {
        protected override void testCase() {
            Object one = new List<Account>{new Account(Name = 'Hello', Phone = '1')};
            Object two = new List<Account>{new Account(Phone = '1', Name = 'Hello')};

            Expect.that(one).shouldEqual(two);
        }

        protected override void testCase(String message) {
            Object one = new List<Account>{new Account(Name = 'Hello', Phone = '1')};
            Object two = new List<Account>{new Account(Phone = '1', Name = 'Hello')};

            Expect.that(one).shouldEqual(two, message);
        }
    }

    @isTest
    static void ExpectNotEqualReferenceObjectsShouldThrowForStrictEquals() {
        Expect.UseSystemAssert = false;
        new StrictlyNonEqualObjects().verify();
        new StrictlyNonEqualObjects().verifyCustomMessage('hello');
    }

    @isTest
    static void ExpectObjectsWithSameReferenceShouldNotThrowForStrictEquals() {
        Object one = new List<Account>{new Account(Name = 'Hello', Phone = '1')};
        Object two = one;

        Expect.that(one).shouldEqual(two);
    }

    @isTest
    static void ExpectEquivalentObjectsShouldNotThrowWhenCheckingEquivalance() {
        Account oneAccount = new Account(Name = 'Hello');
        insert oneAccount;
        Object one = new Map<Id,SObject>{oneAccount.Id => oneAccount};
        Object two = new Map<Id,SObject>{oneAccount.Id => oneAccount};

        Expect.that(one).isEquivalentTo(two);
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

        protected override void testCase(String message) {
            Account oneAccount = new Account(Name = 'Hello');
            insert oneAccount;
            Object one = new Map<Id,SObject>{oneAccount.Id => oneAccount};

            Account twoAccount = new Account(Name = 'Hello');
            insert twoAccount;
            Object two = new Map<Id,SObject>{twoAccount.Id => twoAccount};

            Expect.that(one).shouldEqual(two, message);
        }
    }

    @isTest
    static void ExpectNotEqualObjectsShouldNotThrowForNotEquals() {
        Account one = new Account();
        Contact two = new Contact();

        Expect.that(one).shouldNotEqual(two);
    }

    private class NotEqualObject extends ThrowCheck {
        protected override void testCase() {
            Account one = new Account(Name = 'EF');
            Account two = one;

            Expect.that(one).shouldNotEqual(two);
        }

        protected override void testCase(String message) {
            Account one = new Account(Name = 'EF');
            Account two = one;

            Expect.that(one).shouldNotEqual(two, message);
        }
    }

    @isTest
    static void ExpectEqualObjectsShouldThrowForNotEquals() {
        Expect.UseSystemAssert = false;
        new NotEqualObject().verify();
        new NotEqualObject().verifyCustomMessage('hello');
    }
}