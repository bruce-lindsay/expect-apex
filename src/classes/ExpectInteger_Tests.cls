@isTest
public class ExpectInteger_Tests {
    @isTest
    static void ExpectShouldEqualMatchingValueDoesNotThrow() {
        Expect.that(1).shouldEqual(1);
    }

    private class ShouldEqualThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(1).shouldEqual(2);
        }
        protected override void testCase(string message) {
            Expect.that(1).shouldEqual(2, message);
        }
    }

    @isTest
    static void ExpectShouldEqualThrowsDefaultMessage() {
        new ShouldEqualThrows()
            .verifyMessage('Expected 1 should be 2');
    }

    @isTest
    static void ExpectShouldEqualThrowsSpecificMessage() {
        new ShouldEqualThrows()
            .verifyCustomMessage('Unequal');
    }

    @isTest
    static void ExpectShouldNotEqualDoesNotThrow() {
        Expect.that(1).shouldNotEqual(2);
    }

    private class ShouldNotEqualThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(1).shouldNotEqual(1);
        }
        protected override void testCase(string message) {
            Expect.that(1).shouldNotEqual(1, message);
        }
    }

    @isTest
    static void ExpectShouldNotEqualThrowsDefaultMessage() {
        new ShouldNotEqualThrows()
            .verifyMessage('Expected 1 should not be 1');
    }

    @isTest
    static void ExpectShouldNotEqualThrowsSpecificMessage() {
        new ShouldNotEqualThrows()
            .verifyCustomMessage('equaled');
    }

    @isTest
    static void ExpectShouldBeLessThanDoesNotThrow() {
        Expect.that(5).shouldBeLessThan(7);
    }

    private class ShouldBeLessThanThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(7).shouldBeLessThan(5);
        }
        protected override void testCase(String message) {
            Expect.that(7).shouldBeLessThan(5, message);
        }
    }

    @isTest
    static void ExpectShouldBeLessThanThrowsDefaultMessage() {
        new ShouldBeLessThanThrows()
            .verifyMessage('Expected 7 should be less than 5');
    }

    @isTest
    static void ExpectShouldBeLessThanThrowsCustomMessage() {
        new ShouldBeLessThanThrows()
            .verifyCustomMessage('too high');
    }

    @isTest
    static void ExpectShouldBeGreaterThanDoesNotThrow() {
        Expect.that(7).shouldBeGreaterThan(5);
    }

    private class ShouldBeGreaterThanThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(5).shouldBeGreaterThan(7);
        }
        protected override void testCase(String message) {
            Expect.that(5).shouldBeGreaterThan(7, message);
        }
    }

    @isTest
    static void ExpectShouldBeGreaterThanThrowsDefaultMessage() {
        new ShouldBeGreaterThanThrows()
            .verifyMessage('Expected 5 should be greater than 7');
    }

    @isTest
    static void ExpectShouldBeGreaterThanThrowsSpecificMessage() {
        new ShouldBeGreaterThanThrows()
            .verifyCustomMessage('too low');
    }

    @isTest
    static void ExpectShouldIntegerChainDoesNotThrow() {
        Expect.that(5).shouldBeLessThan(7)
            .andit.shouldBeGreaterThan(1)
            .andit.shouldEqual(5);
    }
}