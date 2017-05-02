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
        new StrictlyNonEqualObjects().verify();
        new StrictlyNonEqualObjects().verifyCustomMessage('hello');
    }

    @isTest
    static void ExpectObjectsWithSameReferenceShouldNotThrowForStrictEquals() {
        Object listSObject = new List<Account>{new Account(Name = 'Hello', Phone = '1')};

        Expect.that(listSObject).shouldEqual(listSObject);
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

    @isTest
    static void ExpectSObjectsExposesAndIt() {
        Object one = new Account();
        Contact two = new Contact();

        Expect.that(one).shouldEqual(one).andIt.shouldNotEqual(two);
    }

    private class NotEqualObject extends ThrowCheck {
        private final Object o = new Account();
        protected override void testCase() {
            Expect.that(o).shouldNotEqual(o);
        }

        protected override void testCase(String message) {
            Expect.that(o).shouldNotEqual(o, message);
        }
    }

    @isTest
    static void ExpectEqualObjectsShouldThrowForNotEquals() {
        new NotEqualObject().verify();
        new NotEqualObject().verifyCustomMessage('hello');
    }
}