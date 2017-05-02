@isTest
public class ExpectObject_Tests {
    private class Equals {
        private final Integer foo;
        public Equals(Integer value) {
            foo = value;
        }
        public Boolean equals(Object obj) {
            return (obj instanceof Equals) && ((Equals) obj).foo == foo;
        }
        public Integer hashCode() {
            return foo;
        }
    }

    private static final Equals EqualsOneInstanceA = new Equals(1);
    private static final Equals EqualsOneInstanceB = new Equals(1);
    private static final Equals EqualsTwo = new Equals(2);

    @isTest
    static void ExpectObjectsWithSameReferenceShouldNotThrowForStrictEquals() {
        Expect.that(EqualsOneInstanceA).shouldEqual(EqualsOneInstanceA);
        Expect.that(EqualsOneInstanceA).shouldEqual(EqualsOneInstanceA, 'ShouldEqual');
    }

    private class StrictlyNonEqualObjects extends ThrowCheck {
        protected override void testCase() {
            Expect.that(EqualsOneInstanceA).shouldEqual(EqualsOneInstanceB);
        }
        protected override void testCase(String message) {
            Expect.that(EqualsOneInstanceA).shouldEqual(EqualsOneInstanceB, message);
        }
    }

    @isTest
    static void ExpectNotEqualReferenceObjectsShouldThrowForStrictEquals() {
        new StrictlyNonEqualObjects().verify();
        new StrictlyNonEqualObjects().verifyCustomMessage('hello');
    }

    @isTest
    static void ExpectEquivalentObjectsShouldNotThrowWhenCheckingEquivalance() {
        Expect.that(EqualsOneInstanceA).shouldBeEquivalentTo(EqualsOneInstanceB);
        Expect.that(EqualsOneInstanceA).shouldBeEquivalentTo(EqualsOneInstanceB, 'Equivalent');
    }

    private class ShouldBeEquivalentToThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(EqualsOneInstanceA).shouldBeEquivalentTo(EqualsTwo);
        }
        protected override void testCase(String message) {
            Expect.that(EqualsOneInstanceA).shouldBeEquivalentTo(EqualsTwo, message);
        }
    }

    @isTest
    static void ExpectShouldBeEquivalentThrows() {
        new ShouldBeEquivalentToThrows().verifyMessage('Expected ' + String.valueOf(EqualsOneInstanceA) + ' should be ' + String.valueOf(EqualsTwo));
        new ShouldBeEquivalentToThrows().verifyCustomMessage('ShouldBeEquivalent');
    }

    @isTest
    static void ExpectNotEqualObjectsShouldNotThrowForNotEquals() {
        Expect.that(EqualsOneInstanceA).shouldNotEqual(EqualsOneInstanceB);
    }

    @isTest
    static void ExpectSObjectsExposesAndIt() {
        Expect.that(EqualsOneInstanceA).shouldEqual(EqualsOneInstanceA).andIt.shouldNotEqual(EqualsOneInstanceB);
    }

    private class NotEqualObject extends ThrowCheck {
        protected override void testCase() {
            Expect.that(EqualsOneInstanceA).shouldNotEqual(EqualsOneInstanceA);
        }

        protected override void testCase(String message) {
            Expect.that(EqualsOneInstanceA).shouldNotEqual(EqualsOneInstanceA, message);
        }
    }

    @isTest
    static void ExpectEqualObjectsShouldThrowForNotEquals() {
        new NotEqualObject().verify();
        new NotEqualObject().verifyCustomMessage('hello');
    }

    @isTest
    static void ExpectShouldNotBeEquivalentDoesNotThrow() {
        Expect.that(EqualsOneInstanceA).shouldNotBeEquivalentTo(EqualsTwo);
        Expect.that(EqualsOneInstanceA).shouldNotBeEquivalentTo(EqualsTwo, 'NotEquivalent');
    }

    private class ShouldNotBeEquivalentThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(EqualsOneInstanceA).shouldNotBeEquivalentTo(EqualsOneInstanceB);
        }
        protected override void testCase(String message) {
            Expect.that(EqualsOneInstanceA).shouldNotBeEquivalentTo(EqualsOneInstanceB, message);
        }
    }

    @isTest
    static void ExpectShouldNotBeEquivalentThrows() {
        new ShouldNotBeEquivalentThrows().verify();
        new ShouldNotBeEquivalentThrows().verifyCustomMessage('hello');
    }
}