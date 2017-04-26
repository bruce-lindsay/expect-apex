@isTest
public class ExpectDate_Tests {
    private static final Date DATE_LOWEST = Date.newInstance(2001, 03, 01);
    private static final Date DATE_MIDDLE = Date.newInstance(2001, 03, 02);
    private static final Date DATE_HIGHEST = Date.newInstance(2001, 03, 03);
    private static final String DATE_LOWEST_S = String.valueOf(DATE_LOWEST);
    private static final String DATE_MIDDLE_S = String.valueOf(DATE_MIDDLE);
    private static final String DATE_HIGHEST_S = String.valueOf(DATE_HIGHEST);

    @isTest
    static void ExpectShouldEqualMatchingValueDoesNotThrow() {
        Expect.that(DATE_LOWEST).shouldEqual(DATE_LOWEST);
    }

    private class ShouldEqualThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(DATE_LOWEST).shouldEqual(DATE_MIDDLE);
        }
        protected override void testCase(string message) {
            Expect.that(DATE_LOWEST).shouldEqual(DATE_MIDDLE, message);
        }
    }

    @isTest
    static void ExpectShouldEqualThrowsDefaultMessage() {
        new ShouldEqualThrows()
            .verifyMessage('Expected ' + DATE_LOWEST_S + ' should be ' + DATE_MIDDLE_S);
    }

    @isTest
    static void ExpectShouldEqualThrowsSpecificMessage() {
        new ShouldEqualThrows()
            .verifyCustomMessage('Unequal');
    }

    @isTest
    static void ExpectShouldNotEqualDoesNotThrow() {
        Expect.that(DATE_LOWEST).shouldNotEqual(DATE_MIDDLE);
    }

    private class ShouldNotEqualThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(DATE_LOWEST).shouldNotEqual(DATE_LOWEST);
        }
        protected override void testCase(string message) {
            Expect.that(DATE_LOWEST).shouldNotEqual(DATE_LOWEST, message);
        }
    }

    @isTest
    static void ExpectShouldNotEqualThrowsDefaultMessage() {
        new ShouldNotEqualThrows()
            .verifyMessage('Expected ' + DATE_LOWEST_S + ' should not be ' + DATE_LOWEST_S);
    }

    @isTest
    static void ExpectShouldNotEqualThrowsSpecificMessage() {
        new ShouldNotEqualThrows()
            .verifyCustomMessage('equaled');
    }

    @isTest
    static void ExpectShouldBeLessThanDoesNotThrow() {
        Expect.that(DATE_LOWEST).shouldBeLessThan(DATE_MIDDLE);
    }

    private class ShouldBeLessThanThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(DATE_MIDDLE).shouldBeLessThan(DATE_LOWEST);
        }
        protected override void testCase(String message) {
            Expect.that(DATE_MIDDLE).shouldBeLessThan(DATE_LOWEST, message);
        }
    }

    @isTest
    static void ExpectShouldBeLessThanThrowsDefaultMessage() {
        new ShouldBeLessThanThrows()
            .verifyMessage('Expected ' + DATE_MIDDLE_S + ' should be less than ' + DATE_LOWEST_S);
    }

    @isTest
    static void ExpectShouldBeLessThanThrowsCustomMessage() {
        new ShouldBeLessThanThrows()
            .verifyCustomMessage('too high');
    }

    @isTest
    static void ExpectShouldBeLessThanOrEqualToDoesNotThrow() {
        Expect.that(DATE_LOWEST).shouldBeLessThanOrEqualTo(DATE_LOWEST);
        Expect.that(DATE_LOWEST).shouldBeLessThanOrEqualTo(DATE_MIDDLE);
    }

    private class ShouldBeLessThanOrEqualToThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(DATE_MIDDLE).shouldBeLessThanOrEqualTo(DATE_LOWEST);
        }
        protected override void testCase(String message) {
            Expect.that(DATE_MIDDLE).shouldBeLessThanOrEqualTo(DATE_LOWEST, message);
        }
    }

    @isTest
    static void ExpectShouldBeLessThanOrEqualToThrowsDefaultMessage() {
        new ShouldBeLessThanOrEqualToThrows()
            .verifyMessage('Expected ' + DATE_MIDDLE_S + ' should be less than or equal to ' + DATE_LOWEST_S);
    }

    @isTest
    static void ExpectShouldBeLessThanOrEqualToThrowsCustomMessage() {
        new ShouldBeLessThanOrEqualToThrows()
            .verifyCustomMessage('too high');
    }

    @isTest
    static void ExpectShouldBeGreaterThanDoesNotThrow() {
        Expect.that(DATE_MIDDLE).shouldBeGreaterThan(DATE_LOWEST);
    }

    private class ShouldBeGreaterThanThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(DATE_LOWEST).shouldBeGreaterThan(DATE_MIDDLE);
        }
        protected override void testCase(String message) {
            Expect.that(DATE_LOWEST).shouldBeGreaterThan(DATE_MIDDLE, message);
        }
    }

    @isTest
    static void ExpectShouldBeGreaterThanThrowsDefaultMessage() {
        new ShouldBeGreaterThanThrows()
            .verifyMessage('Expected ' + DATE_LOWEST_S + ' should be greater than '+ DATE_MIDDLE_S);
    }

    @isTest
    static void ExpectShouldBeGreaterThanThrowsSpecificMessage() {
        new ShouldBeGreaterThanThrows()
            .verifyCustomMessage('too low');
    }

    @isTest
    static void ExpectShouldBeGreaterThanOrEqualToDoesNotThrow() {
        Expect.that(DATE_MIDDLE).shouldBeGreaterThanOrEqualTo(DATE_LOWEST);
        Expect.that(DATE_LOWEST).shouldBeGreaterThanOrEqualTo(DATE_LOWEST);
    }

    private class ShouldBeGreaterThanOrEqualToThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(DATE_LOWEST).shouldBeGreaterThanOrEqualTo(DATE_MIDDLE);
        }
        protected override void testCase(String message) {
            Expect.that(DATE_LOWEST).shouldBeGreaterThanOrEqualTo(DATE_MIDDLE, message);
        }
    }

    @isTest
    static void ExpectShouldBeGreaterThanOrEqualToThrowsDefaultMessage() {
        new ShouldBeGreaterThanOrEqualToThrows()
            .verifyMessage('Expected ' + DATE_LOWEST_S + ' should be greater than or equal to ' + DATE_MIDDLE_S);
    }

    @isTest
    static void ExpectShouldBeGreaterThanOrEqualToThrowsSpecificMessage() {
        new ShouldBeGreaterThanOrEqualToThrows()
            .verifyCustomMessage('too low');
    }

    @isTest
    static void ExpectShouldBeBetweenDoesNotThrow() {
        Expect.that(DATE_MIDDLE).shouldBeBetween(DATE_MIDDLE, DATE_HIGHEST);
        Expect.that(DATE_MIDDLE).shouldBeBetween(DATE_LOWEST, DATE_MIDDLE);
        Expect.that(DATE_MIDDLE).shouldBeBetween(DATE_LOWEST, DATE_HIGHEST);
        Expect.that(DATE_MIDDLE).shouldBeBetween(DATE_HIGHEST, DATE_MIDDLE);
    }

    private class ShouldBeBetweenThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(DATE_LOWEST).shouldBeBetween(DATE_MIDDLE, DATE_HIGHEST);
        }
        protected override void testCase(String message) {
            Expect.that(DATE_LOWEST).shouldBeBetween(DATE_MIDDLE, DATE_HIGHEST, message);
        }
    }

    @isTest
    static void ExpectShouldBeBetweenThrowsThrowsDefaultMessage() {
        new ShouldBeBetweenThrows()
            .verifyMessage('Expected ' + DATE_LOWEST_S + ' should be between ' + DATE_MIDDLE_S + ' and ' + DATE_HIGHEST_S);
    }

    @isTest
    static void ExpectShouldBeBetweenThrowsSpecificMessage() {
        new ShouldBeBetweenThrows()
            .verifyCustomMessage('outside allowed range');
    }

    @isTest
    static void ExpectDateChains() {
        Expect.that(DATE_LOWEST).shouldBeLessThan(DATE_MIDDLE)
            .andit.shouldEqual(DATE_LOWEST);
    }

}