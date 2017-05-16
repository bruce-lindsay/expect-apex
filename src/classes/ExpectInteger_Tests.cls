@isTest
public class ExpectInteger_Tests {
    private static final Integer INTEGER_LOWEST = 4;
    private static final Integer INTEGER_MIDDLE = 5;
    private static final Integer INTEGER_HIGHEST = 6;
    private static final String INTEGER_LOWEST_S = String.valueOf(INTEGER_LOWEST);
    private static final String INTEGER_MIDDLE_S = String.valueOf(INTEGER_MIDDLE);
    private static final String INTEGER_HIGHEST_S = String.valueOf(INTEGER_HIGHEST);

    @isTest
    static void ExpectShouldEqualMatchingValueDoesNotThrow() {
        Expect.that(INTEGER_LOWEST).shouldEqual(INTEGER_LOWEST);
    }

    private class ShouldEqualThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(INTEGER_LOWEST).shouldEqual(INTEGER_MIDDLE);
        }
        protected override void testCase(string message) {
            Expect.that(INTEGER_LOWEST).shouldEqual(INTEGER_MIDDLE, message);
        }
    }

    @isTest
    static void ExpectShouldEqualThrowsDefaultMessage() {
        new ShouldEqualThrows()
            .verifyMessage('Expected ' + INTEGER_LOWEST_S + ' should be ' + INTEGER_MIDDLE_S);
    }

    @isTest
    static void ExpectShouldEqualThrowsSpecificMessage() {
        new ShouldEqualThrows()
            .verifyCustomMessage('Unequal');
    }

    @isTest
    static void ExpectShouldNotEqualDoesNotThrow() {
        Expect.that(INTEGER_LOWEST).negated.shouldEqual(INTEGER_MIDDLE);
    }

    @isTest
    static void ExpectNegatedLastsForOneTest() {
        Expect.that(INTEGER_LOWEST).negated.shouldEqual(INTEGER_MIDDLE)
            .shouldEqual(INTEGER_LOWEST);
    }

    private class ShouldNotEqualThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(INTEGER_LOWEST).negated.shouldEqual(INTEGER_LOWEST);
        }
        protected override void testCase(string message) {
            Expect.that(INTEGER_LOWEST).negated.shouldEqual(INTEGER_LOWEST, message);
        }
    }

    @isTest
    static void ExpectShouldNotEqualThrowsDefaultMessage() {
        new ShouldNotEqualThrows()
            .verifyMessage('Expected ' + INTEGER_LOWEST_S + ' should not be ' + INTEGER_LOWEST_S);
    }

    @isTest
    static void ExpectShouldNotEqualThrowsSpecificMessage() {
        new ShouldNotEqualThrows()
            .verifyCustomMessage('equaled');
    }

    @isTest
    static void ExpectShouldBeLessThanDoesNotThrow() {
        Expect.that(INTEGER_LOWEST).shouldBeLessThan(INTEGER_MIDDLE);
    }

    @isTest
    static void ExpectShouldBeLessThanNegatedDoesNotThrow() {
        Expect.that(INTEGER_MIDDLE).negated.shouldBeLessThan(INTEGER_LOWEST)
            .andIt.shouldBeLessThan(INTEGER_HIGHEST)
            .andIt.negated.shouldBeLessThan(-INTEGER_MIDDLE);
    }

    private class ShouldBeLessThanThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(INTEGER_MIDDLE).shouldBeLessThan(INTEGER_LOWEST);
        }
        protected override void testCase(String message) {
            Expect.that(INTEGER_MIDDLE).shouldBeLessThan(INTEGER_LOWEST, message);
        }
    }

    @isTest
    static void ExpectShouldBeLessThanThrowsDefaultMessage() {
        new ShouldBeLessThanThrows()
            .verifyMessage('Expected ' + INTEGER_MIDDLE_S + ' should be less than ' + INTEGER_LOWEST_S);
    }

    @isTest
    static void ExpectShouldBeLessThanThrowsCustomMessage() {
        new ShouldBeLessThanThrows()
            .verifyCustomMessage('too high');
    }

    @isTest
    static void ExpectShouldBeLessThanOrEqualToDoesNotThrow() {
        Expect.that(INTEGER_LOWEST).shouldBeLessThanOrEqualTo(INTEGER_LOWEST);
        Expect.that(INTEGER_LOWEST).shouldBeLessThanOrEqualTo(INTEGER_MIDDLE);
    }

    private class ShouldBeLessThanOrEqualToThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(INTEGER_MIDDLE).shouldBeLessThanOrEqualTo(INTEGER_LOWEST);
        }
        protected override void testCase(String message) {
            Expect.that(INTEGER_MIDDLE).shouldBeLessThanOrEqualTo(INTEGER_LOWEST, message);
        }
    }

    @isTest
    static void ExpectShouldBeLessThanOrEqualToThrowsDefaultMessage() {
        new ShouldBeLessThanOrEqualToThrows()
            .verifyMessage('Expected ' + INTEGER_MIDDLE_S + ' should be less than or equal to ' + INTEGER_LOWEST_S);
    }

    @isTest
    static void ExpectShouldBeLessThanOrEqualToThrowsCustomMessage() {
        new ShouldBeLessThanOrEqualToThrows()
            .verifyCustomMessage('too high');
    }

    @isTest
    static void ExpectShouldBeGreaterThanDoesNotThrow() {
        Expect.that(INTEGER_MIDDLE).shouldBeGreaterThan(INTEGER_LOWEST);
    }

    private class ShouldBeGreaterThanThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(INTEGER_LOWEST).shouldBeGreaterThan(INTEGER_MIDDLE);
        }
        protected override void testCase(String message) {
            Expect.that(INTEGER_LOWEST).shouldBeGreaterThan(INTEGER_MIDDLE, message);
        }
    }

    @isTest
    static void ExpectShouldBeGreaterThanThrowsDefaultMessage() {
        new ShouldBeGreaterThanThrows()
            .verifyMessage('Expected ' + INTEGER_LOWEST_S + ' should be greater than '+ INTEGER_MIDDLE_S);
    }

    @isTest
    static void ExpectShouldBeGreaterThanThrowsSpecificMessage() {
        new ShouldBeGreaterThanThrows()
            .verifyCustomMessage('too low');
    }

    @isTest
    static void ExpectShouldBeGreaterThanOrEqualToDoesNotThrow() {
        Expect.that(INTEGER_MIDDLE).shouldBeGreaterThanOrEqualTo(INTEGER_LOWEST);
        Expect.that(INTEGER_LOWEST).shouldBeGreaterThanOrEqualTo(INTEGER_LOWEST);
    }

    private class ShouldBeGreaterThanOrEqualToThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(INTEGER_LOWEST).shouldBeGreaterThanOrEqualTo(INTEGER_MIDDLE);
        }
        protected override void testCase(String message) {
            Expect.that(INTEGER_LOWEST).shouldBeGreaterThanOrEqualTo(INTEGER_MIDDLE, message);
        }
    }

    @isTest
    static void ExpectShouldBeGreaterThanOrEqualToThrowsDefaultMessage() {
        new ShouldBeGreaterThanOrEqualToThrows()
            .verifyMessage('Expected ' + INTEGER_LOWEST_S + ' should be greater than or equal to ' + INTEGER_MIDDLE_S);
    }

    @isTest
    static void ExpectShouldBeGreaterThanOrEqualToThrowsSpecificMessage() {
        new ShouldBeGreaterThanOrEqualToThrows()
            .verifyCustomMessage('too low');
    }

    @isTest
    static void ExpectShouldBeBetweenDoesNotThrow() {
        Expect.that(INTEGER_MIDDLE).shouldBeBetween(INTEGER_MIDDLE, INTEGER_HIGHEST);
        Expect.that(INTEGER_MIDDLE).shouldBeBetween(INTEGER_LOWEST, INTEGER_MIDDLE);
        Expect.that(INTEGER_MIDDLE).shouldBeBetween(INTEGER_LOWEST, INTEGER_HIGHEST);
        Expect.that(INTEGER_MIDDLE).shouldBeBetween(INTEGER_HIGHEST, INTEGER_MIDDLE);
    }

    private class ShouldBeBetweenThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(INTEGER_LOWEST).shouldBeBetween(INTEGER_MIDDLE, INTEGER_HIGHEST);
        }
        protected override void testCase(String message) {
            Expect.that(INTEGER_LOWEST).shouldBeBetween(INTEGER_MIDDLE, INTEGER_HIGHEST, message);
        }
    }

    @isTest
    static void ExpectShouldBeBetweenThrowsThrowsDefaultMessage() {
        new ShouldBeBetweenThrows()
            .verifyMessage('Expected ' + INTEGER_LOWEST_S + ' should be between ' + INTEGER_MIDDLE_S + ' and ' + INTEGER_HIGHEST_S);
    }

    @isTest
    static void ExpectShouldBeBetweenThrowsSpecificMessage() {
        new ShouldBeBetweenThrows()
            .verifyCustomMessage('outside allowed range');
    }

    @isTest
    static void ExpectIntegerChains() {
        Expect.that(INTEGER_LOWEST).shouldBeLessThan(INTEGER_MIDDLE)
            .andit.shouldEqual(INTEGER_LOWEST);
    }

}