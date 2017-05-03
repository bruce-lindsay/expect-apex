@isTest
public class ExpectBoolean_Tests {
    @isTest
    public static void ExpectShouldBeFalseForFalseDoesNotThrow() {
        Expect.that(false).shouldBeFalse();
    }

    private class ShouldBeFalseThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(true).shouldBeFalse();
        }
        protected override void testCase(string message) {
            Expect.that(true).shouldBeFalse(message);
        }
    }

    @isTest
    public static void ExpectShouldBeFalseForTrueThrowsDefaultMessage() {
        new ShouldBeFalseThrows()
            .verifyMessage('Expected true should be false');
    }

    @isTest
    public static void ExpectShouldBeFalseForTrueThrowsSpecificMessage() {
        new ShouldBeFalseThrows()
            .verifyCustomMessage('False');
    }

    @isTest
    public static void ExpectShouldBeTrueForTrueDoesNotThrow() {
        Expect.that(true).shouldBeTrue();
    }

    private class ShouldBeTrueThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(false).shouldBeTrue();
        }
        protected override void testCase(string message) {
            Expect.that(false).shouldBeTrue(message);
        }
    }

    @isTest
    public static void ExpectShouldBeTrueForFalseThrowsDefaultMessage() {
        new ShouldBeTrueThrows()
            .verifyMessage('Expected false should be true');
    }

    @isTest
    public static void ExpectShouldBeTrueForFalseThrowsSpecificMessage() {
        new ShouldBeTrueThrows()
            .verifyCustomMessage('Truth');
    }

    @isTest
    public static void ExpectShouldEqualMatchingValueDoesNotThrow() {
        Expect.that(true).shouldEqual(true);
        Expect.that(false).shouldEqual(false);
    }

    private class ShouldEqualThrows extends ThrowCheck {
        final Boolean that;
        private ShouldEqualThrows(Boolean that) {
            this.that = that;
        }
        protected override void testCase() {
            Expect.that(that).shouldEqual(!that);
        }
        protected override void testCase(string message) {
            Expect.that(that).shouldEqual(!that, message);
        }
    }

    @isTest
    public static void ExpectShouldEqualThrowsForMismatchDefaultMessage() {
        new ShouldEqualThrows(true)
            .verifyMessage('Expected true should be false');
        new ShouldEqualThrows(false)
            .verifyMessage('Expected false should be true');
    }

    @isTest
    public static void ExpectShouldEqualThrowsForMismatchSpecificMessage() {
        new ShouldEqualThrows(true)
            .verifyCustomMessage('Mismatched');
    }

    @isTest
    public static void ExpectBooleanExposesAndIt() {
        final Boolean TRUE_VALUE = true;
        Expect.that(TRUE_VALUE).shouldBeTrue().andIt.shouldEqual(TRUE_VALUE);
    }
}