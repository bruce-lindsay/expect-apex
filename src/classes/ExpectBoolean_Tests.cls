@isTest
public class ExpectBoolean_Tests {
    private abstract class ThrowCheck {
        final String ASSERTION_MESSAGE = 'Expect.AssertException expected';
        abstract void testCase();
        public void verify() {
            try {
                testCase();
                System.assert(false, ASSERTION_MESSAGE);
            } catch(Expect.AssertException unused) { }
        }
        public void verifyMessage(string expectedMessage) {
            try {
                testCase();
                System.assert(false, ASSERTION_MESSAGE);
            } catch(Expect.AssertException exceptionValue) {
                System.assertEquals(expectedMessage, exceptionValue.getMessage());
            }
        }
    }

    private class ShouldBeFalseThrowsForTrue extends ThrowCheck {
        override void testCase() {
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
        override void testCase() {
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
        override void testCase() {
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
        override void testCase() {
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
        final Boolean that;
        final Boolean equals;
        private ShouldEqualThrowsForMismatchDefaultMessage(Boolean that, Boolean equals) {
            this.that = that;
            this.equals = equals;
        }
        override void testCase() {
            Expect.that(this.that).shouldEqual(this.equals);
        }
    }
    @isTest
    public static void ExpectShouldEqualThrowsForMismatchDefaultMessage() {
        Expect.UseSystemAssert = false;
        new ShouldEqualThrowsForMismatchDefaultMessage(true, false).verifyMessage('Expected true should equal false');
        new ShouldEqualThrowsForMismatchDefaultMessage(false, true).verifyMessage('Expected false should equal true');
    }

    private class ShouldEqualThrowsForMismatchSpecificMessage extends ThrowCheck {
        private final string message;
        private ShouldEqualThrowsForMismatchSpecificMessage(String m) {
            this.message = m;
        }
        override void testCase() {
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