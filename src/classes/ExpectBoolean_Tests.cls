@isTest
public class ExpectBoolean_Tests {
    private class ShouldBeFalseThrowsForTrue extends ThrowCheck {
        protected override void testCase() {
            Expect.that(true).shouldBeFalse();
        }
        protected override void testCase(string message) {
            Expect.that(true).shouldBeFalse(message);
        }
    }

    @isTest
    public static void ExpectShouldBeFalseForTrueThrowsDefaultMessage() {
        new ShouldBeFalseThrowsForTrue()
            .verifyMessage(Expect.BOOLEAN_SHOULD_BE_FALSE_MESSAGE);
    }

    @isTest
    public static void ExpectShouldBeFalseForTrueThrowsSpecificMessage() {
        new ShouldBeFalseThrowsForTrue()
            .verifyCustomMessage('False');
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
        protected override void testCase(string message) {
            Expect.that(false).shouldBeTrue(message);
        }
    }

    @isTest
    public static void ExpectShouldBeTrueForFalseThrowsDefaultMessage() {
        new ShouldBeTrueThrowsForFalse()
            .verifyMessage(Expect.BOOLEAN_SHOULD_BE_TRUE_MESSAGE);
    }

    @isTest
    public static void ExpectShouldBeTrueForFalseThrowsSpecificMessage() {
        new ShouldBeTrueThrowsForFalse()
            .verifyCustomMessage('Truth');
    }

    @isTest
    public static void ExpectShouldEqualMatchingValueDoesNotThrow() {
        Expect.that(true).shouldEqual(true);
        Expect.that(false).shouldEqual(false);
    }

    private class ShouldEqualThrowsForMismatch extends ThrowCheck {
        final Boolean ths;
        final Boolean that;
        private ShouldEqualThrowsForMismatch(Boolean ths, Boolean that) {
            this.ths = ths;
            this.that = that;
        }
        protected override void testCase() {
            Expect.that(ths).shouldEqual(that);
        }
        protected override void testCase(string message) {
            Expect.that(ths).shouldEqual(that, message);
        }
    }

    @isTest
    public static void ExpectShouldEqualThrowsForMismatchDefaultMessage() {
        new ShouldEqualThrowsForMismatch(true, false)
            .verifyMessage('Expected true should equal false');
        new ShouldEqualThrowsForMismatch(false, true)
            .verifyMessage('Expected false should equal true');
    }

    @isTest
    public static void ExpectShouldEqualThrowsForMismatchSpecificMessage() {
        new ShouldEqualThrowsForMismatch(true, false)
            .verifyCustomMessage('Mismatched');
    }
}