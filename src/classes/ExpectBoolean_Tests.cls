@isTest
public class ExpectBoolean_Tests {
    private class ShouldBeFalseThrowsForTrue extends ThrowCheck {
        protected override void testCase() {
            Expect.that(true).shouldBeFalse();
        }
    }

    @isTest
    public static void ExpectShouldBeFalseForTrueThrowsDefaultMessage() {
        Expect.UseSystemAssert = false;
        new ShouldBeFalseThrowsForTrue().verifyMessage(Expect.BOOLEAN_SHOULD_BE_FALSE_MESSAGE);
    }

    private class ShouldBeFalseForTrueThrowsSpecificMessage extends ThrowCheck {
        private final string message;
        private ShouldBeFalseForTrueThrowsSpecificMessage(String m) {
            this.message = m;
        }
        protected override void testCase() {
            Expect.that(true).shouldBeFalse(message);
        }
    }

    @isTest
    public static void ExpectShouldBeFalseForTrueThrowsSpecificMessage() {
        Expect.UseSystemAssert = false;
        new ShouldBeFalseForTrueThrowsSpecificMessage('False').verifyMessage('False');
    }

    @isTest
    public static void ExpectShouldBeFalseForFalseDoesNotThrow() {
        Expect.that(false).shouldBeFalse();
    }

    @isTest
    public static void ExpectShouldBeTrueForTrueDoesNotThrow() {
        Expect.that(true).shouldBeTrue();
    }

    private class ShouldBeTrueThrowsForFalse extends ThrowCheck {
        protected override void testCase() {
            Expect.that(false).shouldBeTrue();
        }
    }

    @isTest
    public static void ExpectShouldBeTrueForFalseThrowsDefaultMessage() {
        Expect.UseSystemAssert = false;
        new ShouldBeTrueThrowsForFalse().verifyMessage(Expect.BOOLEAN_SHOULD_BE_TRUE_MESSAGE);
    }

    private class ShouldBeTrueForFalseThrowsSpecificMessage extends ThrowCheck {
        private final string message;
        private ShouldBeTrueForFalseThrowsSpecificMessage(String m) {
            this.message = m;
        }
        protected override void testCase() {
            Expect.that(false).shouldBeTrue(this.message);
        }
    }

    @isTest
    public static void ExpectShouldBeTrueForFalseThrowsSpecificMessage() {
        Expect.UseSystemAssert = false;
        new ShouldBeTrueForFalseThrowsSpecificMessage('Truth')
            .verifyMessage('Truth');
    }

    @isTest
    public static void ExpectShouldEqualMatchingValueDoesNotThrow() {
        Expect.that(true).shouldEqual(true);
        Expect.that(false).shouldEqual(false);
    }

    private class ShouldEqualThrowsForMismatchDefaultMessage extends ThrowCheck {
        final Boolean ths;
        final Boolean that;
        private ShouldEqualThrowsForMismatchDefaultMessage(Boolean ths, Boolean that) {
            this.ths = ths;
            this.that = that;
        }
        protected override void testCase() {
            Expect.that(ths).shouldEqual(that);
        }
    }

    @isTest
    public static void ExpectShouldEqualThrowsForMismatchDefaultMessage() {
        Expect.UseSystemAssert = false;
        new ShouldEqualThrowsForMismatchDefaultMessage(true, false).verifyMessage('Expected true should be false');
        new ShouldEqualThrowsForMismatchDefaultMessage(false, true).verifyMessage('Expected false should be true');
    }

    private class ShouldEqualThrowsForMismatchSpecificMessage extends ThrowCheck {
        private final string message;
        private ShouldEqualThrowsForMismatchSpecificMessage(String m) {
            this.message = m;
        }
        protected override void testCase() {
            Expect.that(false).shouldEqual(true, this.message);
        }
    }

    @isTest
    public static void ExpectShouldEqualThrowsForMismatchSpecificMessage() {
        Expect.UseSystemAssert = false;
        new ShouldEqualThrowsForMismatchSpecificMessage('Mismatched')
            .verifyMessage('Mismatched');
    }
}