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
        protected override void testCase(string message) {
            Expect.that(1).shouldEqual(2, message);
        }
    }

    @isTest
    static void ExpectShouldEqualNonMatchingValuesDoesThrow() {
        new ShouldEqualNonMatchingValueShouldThrow()
            .verifyMessage('Expected 1 should be 2');
    }

    @isTest
    static void ExpectShouldEqualNonMatchingValueShouldThrowCustomMessage() {
        new ShouldEqualNonMatchingValueShouldThrow()
            .verifyCustomMessage('Unequal');
    }

    private class ShouldNotEqualMatchingValuesDoesThrow extends ThrowCheck {
        protected override void testCase() {
            Expect.that(1).shouldNotEqual(1);
        }
        protected override void testCase(string message) {
            Expect.that(1).shouldNotEqual(1, message);
        }
    }

    @isTest
    static void ExpectShouldNotEqualMatchingValuesDoesThrow() {
        new ShouldNotEqualMatchingValuesDoesThrow()
            .verifyMessage('Expected 1 should not be 1');
    }

    @isTest
    static void ExpectShouldNotEqualMatchingValuesDoesThrowCustomMessage() {
        new ShouldNotEqualMatchingValuesDoesThrow()
            .verifyCustomMessage('equaled');
    }

    @isTest
    static void ExpectShouldNotEqualNonMatchingValueDoesNotThrow() {
        Expect.that(1).shouldNotEqual(2);
    }

    @isTest
    static void ExpectShouldBeLessThanValuesDoesThrow() {
        new ShouldBeLessThanValuesDoesThrow()
            .verifyMessage('Expected 7 should be less than 5');
    }

    private class ShouldBeLessThanValuesDoesThrow extends ThrowCheck {
        protected override void testCase() {
            Expect.that(7).shouldBeLessThan(5);
        }
        protected override void testCase(String message) {
            Expect.that(7).shouldBeLessThan(5, message);
        }
    }

    @isTest
    static void ExpectShouldBeLessThanValuesDoesThrowCustomMessage() {
        new ShouldBeLessThanValuesDoesThrow()
            .verifyCustomMessage('too high');
    }

    @isTest
    static void ExpectShouldBeGreaterThanValuesDoesNotThrow() {
        Expect.that(7).shouldBeGreaterThan(5);
    }

    @isTest
    static void ExpectShouldBeGreaterThanValuesDoesThrow() {
        new ShouldBeGreaterThanValuesDoesThrow()
            .verifyMessage('Expected 5 should be greater than 7');
    }

    private class ShouldBeGreaterThanValuesDoesThrow extends ThrowCheck {
        protected override void testCase() {
            Expect.that(5).shouldBeGreaterThan(7);
        }
        protected override void testCase(String message) {
            Expect.that(5).shouldBeGreaterThan(7, message);
        }
    }

    @isTest
    static void ExpectShouldBeGreaterThanValuesDoesThrowCustomMessage() {
        new ShouldBeGreaterThanValuesDoesThrow()
            .verifyCustomMessage('too low');
    }

    @isTest
    static void ExpectShouldBeLessThanValuesDoesNotThrow() {
        Expect.that(5).shouldBeLessThan(7);
    }

    @isTest
    static void ExpectShouldIntegerChainDoesNotThrow() {
        Expect.that(5).shouldBeLessThan(7)
            .andit.shouldBeGreaterThan(1)
            .andit.shouldEqual(5);
    }
}