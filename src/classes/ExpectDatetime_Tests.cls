@isTest
public class ExpectDatetime_Tests {
    private static final Datetime DATETIME_LOWEST = Datetime.newInstance(70000);
    private static final Datetime DATETIME_MIDDLE = Datetime.newInstance(80000);
    private static final Datetime DATETIME_HIGHEST = Datetime.newInstance(90000);
    private static final String DATETIME_LOWEST_S = String.valueOf(DATETIME_LOWEST);
    private static final String DATETIME_MIDDLE_S = String.valueOf(DATETIME_MIDDLE);
    private static final String DATETIME_HIGHEST_S = String.valueOf(DATETIME_HIGHEST);

    @isTest
    static void ExpectShouldEqualMatchingValueDoesNotThrow() {
        Expect.that(DATETIME_LOWEST).shouldEqual(DATETIME_LOWEST);
    }

    private class ShouldEqualThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(DATETIME_LOWEST).shouldEqual(DATETIME_MIDDLE);
        }
        protected override void testCase(string message) {
            Expect.that(DATETIME_LOWEST).shouldEqual(DATETIME_MIDDLE, message);
        }
    }

    @isTest
    static void ExpectShouldEqualThrowsDefaultMessage() {
        new ShouldEqualThrows()
            .verifyMessage('Expected ' + DATETIME_LOWEST_S + ' should be ' + DATETIME_MIDDLE_S);
    }

    @isTest
    static void ExpectShouldEqualThrowsSpecificMessage() {
        new ShouldEqualThrows()
            .verifyCustomMessage('Unequal');
    }

    @isTest
    static void ExpectShouldNotEqualDoesNotThrow() {
        Expect.that(DATETIME_LOWEST).shouldNotEqual(DATETIME_MIDDLE);
    }

    private class ShouldNotEqualThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(DATETIME_LOWEST).shouldNotEqual(DATETIME_LOWEST);
        }
        protected override void testCase(string message) {
            Expect.that(DATETIME_LOWEST).shouldNotEqual(DATETIME_LOWEST, message);
        }
    }

    @isTest
    static void ExpectShouldNotEqualThrowsDefaultMessage() {
        new ShouldNotEqualThrows()
            .verifyMessage('Expected ' + DATETIME_LOWEST_S + ' should not be ' + DATETIME_LOWEST_S);
    }

    @isTest
    static void ExpectShouldNotEqualThrowsSpecificMessage() {
        new ShouldNotEqualThrows()
            .verifyCustomMessage('equaled');
    }

    @isTest
    static void ExpectShouldBeLessThanDoesNotThrow() {
        Expect.that(DATETIME_LOWEST).shouldBeLessThan(DATETIME_MIDDLE);
    }

    private class ShouldBeLessThanThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(DATETIME_MIDDLE).shouldBeLessThan(DATETIME_LOWEST);
        }
        protected override void testCase(String message) {
            Expect.that(DATETIME_MIDDLE).shouldBeLessThan(DATETIME_LOWEST, message);
        }
    }

    @isTest
    static void ExpectShouldBeLessThanThrowsDefaultMessage() {
        new ShouldBeLessThanThrows()
            .verifyMessage('Expected ' + DATETIME_MIDDLE_S + ' should be less than ' + DATETIME_LOWEST_S);
    }

    @isTest
    static void ExpectShouldBeLessThanThrowsCustomMessage() {
        new ShouldBeLessThanThrows()
            .verifyCustomMessage('too high');
    }

    @isTest
    static void ExpectShouldBeLessThanOrEqualToDoesNotThrow() {
        Expect.that(DATETIME_LOWEST).shouldBeLessThanOrEqualTo(DATETIME_LOWEST);
        Expect.that(DATETIME_LOWEST).shouldBeLessThanOrEqualTo(DATETIME_MIDDLE);
    }

    private class ShouldBeLessThanOrEqualToThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(DATETIME_MIDDLE).shouldBeLessThanOrEqualTo(DATETIME_LOWEST);
        }
        protected override void testCase(String message) {
            Expect.that(DATETIME_MIDDLE).shouldBeLessThanOrEqualTo(DATETIME_LOWEST, message);
        }
    }

    @isTest
    static void ExpectShouldBeLessThanOrEqualToThrowsDefaultMessage() {
        new ShouldBeLessThanOrEqualToThrows()
            .verifyMessage('Expected ' + DATETIME_MIDDLE_S + ' should be less than or equal to ' + DATETIME_LOWEST_S);
    }

    @isTest
    static void ExpectShouldBeLessThanOrEqualToThrowsCustomMessage() {
        new ShouldBeLessThanOrEqualToThrows()
            .verifyCustomMessage('too high');
    }

    @isTest
    static void ExpectShouldBeGreaterThanDoesNotThrow() {
        Expect.that(DATETIME_MIDDLE).shouldBeGreaterThan(DATETIME_LOWEST);
    }

    private class ShouldBeGreaterThanThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(DATETIME_LOWEST).shouldBeGreaterThan(DATETIME_MIDDLE);
        }
        protected override void testCase(String message) {
            Expect.that(DATETIME_LOWEST).shouldBeGreaterThan(DATETIME_MIDDLE, message);
        }
    }

    @isTest
    static void ExpectShouldBeGreaterThanThrowsDefaultMessage() {
        new ShouldBeGreaterThanThrows()
            .verifyMessage('Expected ' + DATETIME_LOWEST_S + ' should be greater than '+ DATETIME_MIDDLE_S);
    }

    @isTest
    static void ExpectShouldBeGreaterThanThrowsSpecificMessage() {
        new ShouldBeGreaterThanThrows()
            .verifyCustomMessage('too low');
    }

    @isTest
    static void ExpectShouldBeGreaterThanOrEqualToDoesNotThrow() {
        Expect.that(DATETIME_MIDDLE).shouldBeGreaterThanOrEqualTo(DATETIME_LOWEST);
        Expect.that(DATETIME_LOWEST).shouldBeGreaterThanOrEqualTo(DATETIME_LOWEST);
    }

    private class ShouldBeGreaterThanOrEqualToThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(DATETIME_LOWEST).shouldBeGreaterThanOrEqualTo(DATETIME_MIDDLE);
        }
        protected override void testCase(String message) {
            Expect.that(DATETIME_LOWEST).shouldBeGreaterThanOrEqualTo(DATETIME_MIDDLE, message);
        }
    }

    @isTest
    static void ExpectShouldBeGreaterThanOrEqualToThrowsDefaultMessage() {
        new ShouldBeGreaterThanOrEqualToThrows()
            .verifyMessage('Expected ' + DATETIME_LOWEST_S + ' should be greater than or equal to ' + DATETIME_MIDDLE_S);
    }

    @isTest
    static void ExpectShouldBeGreaterThanOrEqualToThrowsSpecificMessage() {
        new ShouldBeGreaterThanOrEqualToThrows()
            .verifyCustomMessage('too low');
    }

    @isTest
    static void ExpectShouldBeBetweenDoesNotThrow() {
        Expect.that(DATETIME_MIDDLE).shouldBeBetween(DATETIME_MIDDLE, DATETIME_HIGHEST);
        Expect.that(DATETIME_MIDDLE).shouldBeBetween(DATETIME_LOWEST, DATETIME_MIDDLE);
        Expect.that(DATETIME_MIDDLE).shouldBeBetween(DATETIME_LOWEST, DATETIME_HIGHEST);
        Expect.that(DATETIME_MIDDLE).shouldBeBetween(DATETIME_HIGHEST, DATETIME_MIDDLE);
    }

    private class ShouldBeBetweenThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(DATETIME_LOWEST).shouldBeBetween(DATETIME_MIDDLE, DATETIME_HIGHEST);
        }
        protected override void testCase(String message) {
            Expect.that(DATETIME_LOWEST).shouldBeBetween(DATETIME_MIDDLE, DATETIME_HIGHEST, message);
        }
    }

    @isTest
    static void ExpectShouldBeBetweenThrowsThrowsDefaultMessage() {
        new ShouldBeBetweenThrows()
            .verifyMessage('Expected ' + DATETIME_LOWEST_S + ' should be between ' + DATETIME_MIDDLE_S + ' and ' + DATETIME_HIGHEST_S);
    }

    @isTest
    static void ExpectShouldBeBetweenThrowsSpecificMessage() {
        new ShouldBeBetweenThrows()
            .verifyCustomMessage('outside allowed range');
    }

    @isTest
    static void ExpectDatetimeChains() {
        Expect.that(DATETIME_LOWEST).shouldBeLessThan(DATETIME_MIDDLE)
            .andit.shouldEqual(DATETIME_LOWEST);
    }

}