@isTest
public class ExpectStringBase_Tests {
    private static final String STRING_LOWEST = 'aaa';
    private static final String STRING_MIDDLE = 'bbb';
    private static final String STRING_HIGHEST = 'ccc';
    private static final String STRING_LOWEST_S = String.valueOf(STRING_LOWEST);
    private static final String STRING_MIDDLE_S = String.valueOf(STRING_MIDDLE);
    private static final String STRING_HIGHEST_S = String.valueOf(STRING_HIGHEST);

    @isTest
    static void ExpectShouldEqualMatchingValueDoesNotThrow() {
        Expect.that(STRING_LOWEST).shouldEqual(STRING_LOWEST);
    }

    private class ShouldEqualThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(STRING_LOWEST).shouldEqual(STRING_MIDDLE);
        }
        protected override void testCase(string message) {
            Expect.that(STRING_LOWEST).shouldEqual(STRING_MIDDLE, message);
        }
    }

    @isTest
    static void ExpectShouldEqualThrowsDefaultMessage() {
        new ShouldEqualThrows()
            .verifyMessage('Expected ' + STRING_LOWEST_S + ' should be ' + STRING_MIDDLE_S);
    }

    @isTest
    static void ExpectShouldEqualThrowsSpecificMessage() {
        new ShouldEqualThrows()
            .verifyCustomMessage('Unequal');
    }

    @isTest
    static void ExpectShouldNotEqualDoesNotThrow() {
        Expect.that(STRING_LOWEST).negated.shouldEqual(STRING_MIDDLE);
    }

    private class ShouldNotEqualThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(STRING_LOWEST).negated.shouldEqual(STRING_LOWEST);
        }
        protected override void testCase(string message) {
            Expect.that(STRING_LOWEST).negated.shouldEqual(STRING_LOWEST, message);
        }
    }

    @isTest
    static void ExpectShouldNotEqualThrowsDefaultMessage() {
        new ShouldNotEqualThrows()
            .verifyMessage('Expected ' + STRING_LOWEST_S + ' should not be ' + STRING_LOWEST_S);
    }

    @isTest
    static void ExpectShouldNotEqualThrowsSpecificMessage() {
        new ShouldNotEqualThrows()
            .verifyCustomMessage('equaled');
    }

    @isTest
    static void ExpectShouldBeLessThanDoesNotThrow() {
        Expect.that(STRING_LOWEST).shouldBeLessThan(STRING_MIDDLE);
    }

    @isTest
    static void ExpectShouldBeLessThanNegatedDoesNotThrow() {
        Expect.that(STRING_MIDDLE).negated.shouldBeLessThan(STRING_LOWEST)
            .andIt.shouldBeLessThan(STRING_HIGHEST);
    }

    private class ShouldBeLessThanThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(STRING_MIDDLE).shouldBeLessThan(STRING_LOWEST);
        }
        protected override void testCase(String message) {
            Expect.that(STRING_MIDDLE).shouldBeLessThan(STRING_LOWEST, message);
        }
    }

    @isTest
    static void ExpectShouldBeLessThanThrowsDefaultMessage() {
        new ShouldBeLessThanThrows()
            .verifyMessage('Expected ' + STRING_MIDDLE_S + ' should be less than ' + STRING_LOWEST_S);
    }

    @isTest
    static void ExpectShouldBeLessThanThrowsCustomMessage() {
        new ShouldBeLessThanThrows()
            .verifyCustomMessage('too high');
    }

    @isTest
    static void ExpectShouldBeLessThanOrEqualToDoesNotThrow() {
        Expect.that(STRING_LOWEST).shouldBeLessThanOrEqualTo(STRING_LOWEST);
        Expect.that(STRING_LOWEST).shouldBeLessThanOrEqualTo(STRING_MIDDLE);
    }

    private class ShouldBeLessThanOrEqualToThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(STRING_MIDDLE).shouldBeLessThanOrEqualTo(STRING_LOWEST);
        }
        protected override void testCase(String message) {
            Expect.that(STRING_MIDDLE).shouldBeLessThanOrEqualTo(STRING_LOWEST, message);
        }
    }

    @isTest
    static void ExpectShouldBeLessThanOrEqualToThrowsDefaultMessage() {
        new ShouldBeLessThanOrEqualToThrows()
            .verifyMessage('Expected ' + STRING_MIDDLE_S + ' should be less than or equal to ' + STRING_LOWEST_S);
    }

    @isTest
    static void ExpectShouldBeLessThanOrEqualToThrowsCustomMessage() {
        new ShouldBeLessThanOrEqualToThrows()
            .verifyCustomMessage('too high');
    }

    @isTest
    static void ExpectShouldBeGreaterThanDoesNotThrow() {
        Expect.that(STRING_MIDDLE).shouldBeGreaterThan(STRING_LOWEST);
    }

    private class ShouldBeGreaterThanThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(STRING_LOWEST).shouldBeGreaterThan(STRING_MIDDLE);
        }
        protected override void testCase(String message) {
            Expect.that(STRING_LOWEST).shouldBeGreaterThan(STRING_MIDDLE, message);
        }
    }

    @isTest
    static void ExpectShouldBeGreaterThanThrowsDefaultMessage() {
        new ShouldBeGreaterThanThrows()
            .verifyMessage('Expected ' + STRING_LOWEST_S + ' should be greater than '+ STRING_MIDDLE_S);
    }

    @isTest
    static void ExpectShouldBeGreaterThanThrowsSpecificMessage() {
        new ShouldBeGreaterThanThrows()
            .verifyCustomMessage('too low');
    }

    @isTest
    static void ExpectShouldBeGreaterThanOrEqualToDoesNotThrow() {
        Expect.that(STRING_MIDDLE).shouldBeGreaterThanOrEqualTo(STRING_LOWEST);
        Expect.that(STRING_LOWEST).shouldBeGreaterThanOrEqualTo(STRING_LOWEST);
    }

    private class ShouldBeGreaterThanOrEqualToThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(STRING_LOWEST).shouldBeGreaterThanOrEqualTo(STRING_MIDDLE);
        }
        protected override void testCase(String message) {
            Expect.that(STRING_LOWEST).shouldBeGreaterThanOrEqualTo(STRING_MIDDLE, message);
        }
    }

    @isTest
    static void ExpectShouldBeGreaterThanOrEqualToThrowsDefaultMessage() {
        new ShouldBeGreaterThanOrEqualToThrows()
            .verifyMessage('Expected ' + STRING_LOWEST_S + ' should be greater than or equal to ' + STRING_MIDDLE_S);
    }

    @isTest
    static void ExpectShouldBeGreaterThanOrEqualToThrowsSpecificMessage() {
        new ShouldBeGreaterThanOrEqualToThrows()
            .verifyCustomMessage('too low');
    }

    @isTest
    static void ExpectShouldBeBetweenDoesNotThrow() {
        Expect.that(STRING_MIDDLE).shouldBeBetween(STRING_MIDDLE, STRING_HIGHEST);
        Expect.that(STRING_MIDDLE).shouldBeBetween(STRING_LOWEST, STRING_MIDDLE);
        Expect.that(STRING_MIDDLE).shouldBeBetween(STRING_LOWEST, STRING_HIGHEST);
        Expect.that(STRING_MIDDLE).shouldBeBetween(STRING_HIGHEST, STRING_MIDDLE);
    }

    private class ShouldBeBetweenThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(STRING_LOWEST).shouldBeBetween(STRING_MIDDLE, STRING_HIGHEST);
        }
        protected override void testCase(String message) {
            Expect.that(STRING_LOWEST).shouldBeBetween(STRING_MIDDLE, STRING_HIGHEST, message);
        }
    }

    @isTest
    static void ExpectShouldBeBetweenThrowsThrowsDefaultMessage() {
        new ShouldBeBetweenThrows()
            .verifyMessage('Expected ' + STRING_LOWEST_S + ' should be between ' + STRING_MIDDLE_S + ' and ' + STRING_HIGHEST_S);
    }

    @isTest
    static void ExpectShouldBeBetweenThrowsSpecificMessage() {
        new ShouldBeBetweenThrows()
            .verifyCustomMessage('outside allowed range');
    }

    private class ShouldNotBeBetweenThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(STRING_MIDDLE).negated.shouldBeBetween(STRING_LOWEST, STRING_HIGHEST);
        }
        protected override void testCase(String message) {
            Expect.that(STRING_MIDDLE).negated.shouldBeBetween(STRING_LOWEST, STRING_HIGHEST, message);
        }
    }

    @isTest
    static void ExpectShouldNotBeBetweenThrowsThrowsDefaultMessage() {
        new ShouldNotBeBetweenThrows()
            .verifyMessage('Expected ' + STRING_MIDDLE_S + ' should not be between ' + STRING_LOWEST_S + ' and ' + STRING_HIGHEST_S);
    }

    @isTest
    static void ExpectShouldNotBeBetweenThrowsSpecificMessage() {
        new ShouldNotBeBetweenThrows()
            .verifyCustomMessage('outside allowed range');
    }

    @isTest
    static void ExpectStringChains() {
        Expect.that(STRING_LOWEST).shouldBeLessThan(STRING_MIDDLE)
            .andit.shouldEqual(STRING_LOWEST);
    }

}