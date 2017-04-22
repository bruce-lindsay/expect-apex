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
        new UnequalSimpleObject().verifyMessage('Expected Account:{} should be Contact:{}');
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
        //Can't use verifyMessage here because the Ids will vary
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
        new EqualSimpleObject().verifyMessage('Expected Account:{Name=EF} should not be Account:{Name=EF}');
    }

    @isTest
    static void ExpectGreaterThanShouldNotThrow() {
        Expect.that(2).shouldBeGreaterThan(1);
    }

    private class GreaterThan extends ThrowCheck {
        protected override void testCase() {
            Expect.that(1).shouldBeGreaterThan(2);
        }
    }

    @isTest
    static void ExpectGreaterThanShouldThrowIfNotGreater() {
        Expect.UseSystemAssert = false;
        new GreaterThan().verifyMessage(String.format(Expect.SHOULD_BE_COMPARISON, new String[]{'1','>','2'}));
    }

    @isTest
    static void ExpectGreaterThanOrEqualShouldNotThrow() {
        Expect.that(1).shouldBeGreaterThanOrEqual(1);
    }

    private class GreaterThanOrEqual extends ThrowCheck {
        protected override void testCase() {
            Expect.that(1).shouldBeGreaterThanOrEqual(2);
        }
    }

    @isTest
    static void ExpectGreaterThanOrEqualShouldThrowIfNotGreaterThanOrEqual() {
        Expect.UseSystemAssert = false;
        new GreaterThanOrEqual().verifyMessage(String.format(Expect.SHOULD_BE_COMPARISON, new String[]{'1','>=','2'}));
    }

    @isTest
    static void ExpectLessThanShouldNotThrow() {
        Expect.that(1).shouldBeLessThan(2);
    }

    private class LessThan extends ThrowCheck {
        protected override void testCase() {
            Expect.that(2).shouldBeLessThan(1);
        }
    }

    @isTest
    static void ExpectLessThanShouldThrowIfNotLessThan() {
        Expect.UseSystemAssert = false;
        new LessThan().verifyMessage(String.format(Expect.SHOULD_BE_COMPARISON, new String[]{'2','<','1'}));
    }

    @isTest
    static void ExpectLessThanOrEqualShouldNotThrow() {
        Expect.that(1).shouldBeLessThanOrEqual(1);
    }

    private class LessThanOrEqual extends ThrowCheck {
        protected override void testCase() {
            Expect.that(2).shouldBeLessThanOrEqual(1);
        }
    }

    @isTest
    static void ExpectLessOrEqualThanShouldThrowIfNotLessThanOrEqual() {
        Expect.UseSystemAssert = false;
        new LessThanOrEqual().verifyMessage(String.format(Expect.SHOULD_BE_COMPARISON, new String[]{'2','<=','1'}));
    }

    @isTest
    static void ExpectContainsDoesNotThrowIfObjectContains() {
        Expect.that(12).shouldContain(1);
    }

    private class ShouldNotContain extends ThrowCheck {
        protected override void testCase() {
            Expect.that(12).shouldContain(3);
        }
    }

    @isTest
    static void ExpectContainsThrowsIfObjectDoesNotContain() {
        Expect.UseSystemAssert = false;
        new ShouldNotContain().verifyMessage(String.format(Expect.SHOULD_CONTAIN, new String[]{'12','','3'}));
    }

    @isTest
    static void ExpectShouldNotContainDoesNotThrowIfObjectDoesNotContain() {
        Expect.that(12).shouldNotContain(3);
    }

    private class ShouldContain extends ThrowCheck {
        protected override void testCase() {
            Expect.that(13).shouldNotContain(3);
        }
    }

    @isTest
    static void ExpectShouldNotContainThrowsIfObjectDoesContain() {
        Expect.UseSystemAssert = false;
        new ShouldContain().verifyMessage(String.format(Expect.SHOULD_CONTAIN, new String[]{'13',' not','3'}));
    }

    @isTest
    static void ExpectShouldContainWorksForComplexObjects() {
        Account account = new Account(Name = 'Something');
        insert account;

        Map<Id,SObject> mapp = new Map<Id,SObject>{account.Id => account};

        Expect.that(mapp).shouldContain(account.Id);
    }
}