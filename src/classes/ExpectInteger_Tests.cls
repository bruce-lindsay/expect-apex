@isTest
public class ExpectInteger_Tests {
    @isTest
    static void ExpectShouldEqualMatchingValueDoesNotThrow() {
        Expect.that(1).shouldEqual(1);
    }

    private class ShouldEqualNonMatchingValueShouldThrow extends ThrowCheck {
        protected override void testCase() {
            Expect.that(1).shouldEqual(2);
        }
    }

    @isTest
    static void ExpectShouldEqualNonMatchingValuesDoesThrow() {
        Expect.UseSystemAssert = false;
        new ShouldEqualNonMatchingValueShouldThrow().verifyMessage('Expected 1 should be 2');
    }

    private class ShouldEqualNonMatchingValueShouldThrowCustomMessage extends ThrowCheck {
        private final String message;
        private ShouldEqualNonMatchingValueShouldThrowCustomMessage(String message) {
            this.message = message;
        }
        protected override void testCase() {
            Expect.that(1).shouldEqual(2, this.message);
        }
    }

    @isTest
    static void ExpectShouldEqualNonMatchingValueShouldThrowCustomMessage() {
        Expect.UseSystemAssert = false;
        new ShouldEqualNonMatchingValueShouldThrowCustomMessage('Unequal').verifyMessage('Unequal');
    }

    private class ShouldNotEqualMatchingValuesDoesThrow extends ThrowCheck {
        protected override void testCase() {
            Expect.that(1).shouldNotEqual(1);
        }
    }

    @isTest
    static void ExpectShouldNotEqualMatchingValuesDoesThrow() {
        Expect.UseSystemAssert = false;
        new ShouldNotEqualMatchingValuesDoesThrow().verifyMessage('Expected 1 should not be 1');
    }

    private class ShouldNotEqualMatchingValuesDoesThrowCustomMessage extends ThrowCheck {
        private final String message;
        private ShouldNotEqualMatchingValuesDoesThrowCustomMessage(String message) {
            this.message = message;
        }
        protected override void testCase() {
            Expect.that(1).shouldNotEqual(1, this.message);
        }
    }

    @isTest
    static void ExpectShouldNotEqualMatchingValuesDoesThrowCustomMessage() {
        Expect.UseSystemAssert = false;
        new ShouldNotEqualMatchingValuesDoesThrowCustomMessage('equaled').verifyMessage('equaled');
    }

    @isTest
    static void ExpectShouldNotEqualNonMatchingValueDoesNotThrow() {
        Expect.that(1).shouldNotEqual(2);
    }

    @isTest
    static void ExpectShouldBeLessThanValuesDoesThrow() {
        Expect.UseSystemAssert = false;
        new ShouldBeLessThanValuesDoesThrow().verifyMessage('Expected 7 should be less than 5');
    }

    private class ShouldBeLessThanValuesDoesThrow extends ThrowCheck {
        protected override void testCase() {
            Expect.that(7).shouldBeLessThan(5);
        }
    }

    @isTest
    static void ExpectShouldBeLessThanValuesDoesThrowCustomMessage() {
        Expect.UseSystemAssert = false;
        new ShouldBeLessThanValuesDoesThrowCustomMessage('too high').verifyMessage('too high');
    }

    private class ShouldBeLessThanValuesDoesThrowCustomMessage extends ThrowCheck {
        private final String message;
        public ShouldBeLessThanValuesDoesThrowCustomMessage(String message) {
            this.message = message;
        }
        protected override void testCase() {
            Expect.that(7).shouldBeLessThan(5, this.message);
        }
    }

    @isTest
    static void ExpectShouldBeGreaterThanValuesDoesNotThrow() {
        Expect.that(7).shouldBeGreaterThan(5);
    }

    @isTest
    static void ExpectShouldBeGreaterThanValuesDoesThrow() {
        Expect.UseSystemAssert = false;
        new ShouldBeGreaterThanValuesDoesThrow().verifyMessage('Expected 5 should be greater than 7');
    }

    private class ShouldBeGreaterThanValuesDoesThrow extends ThrowCheck {
        protected override void testCase() {
            Expect.that(5).shouldBeGreaterThan(7);
        }
    }

    @isTest
    static void ExpectShouldBeGreaterThanValuesDoesThrowCustomMessage() {
        Expect.UseSystemAssert = false;
        new ShouldBeGreaterThanValuesDoesThrowCustomMessage('too low').verifyMessage('too low');
    }

    private class ShouldBeGreaterThanValuesDoesThrowCustomMessage extends ThrowCheck {
        private final String message;
        private ShouldBeGreaterThanValuesDoesThrowCustomMessage(STring message) {
            this.message = message;
        }
        protected override void testCase() {
            Expect.that(5).shouldBeGreaterThan(7, this.message);
        }
    }

    @isTest
    static void ExpectShouldBeLessThanValuesDoesNotThrow() {
        Expect.that(5).shouldBeLessThan(7);
    }
}