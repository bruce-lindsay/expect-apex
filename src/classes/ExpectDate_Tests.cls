@isTest
public class ExpectDate_Tests {
    private static final Date MARCH_ONE = Date.newInstance(2001, 03, 01);
    private static final Date MARCH_TWO = Date.newInstance(2001, 03, 02);
    private static final Date MARCH_THREE = Date.newInstance(2001, 03, 03);
    private static final String MARCH_ONE_S = String.valueOf(MARCH_ONE);
    private static final String MARCH_TWO_S = String.valueOf(MARCH_TWO);
    private static final String MARCH_THREE_S = String.valueOf(MARCH_THREE);

    @isTest
    static void ExpectShouldEqualMatchingValueDoesNotThrow() {
        Expect.that(MARCH_ONE).shouldEqual(MARCH_ONE);
    }

    private class ShouldEqualThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(MARCH_ONE).shouldEqual(MARCH_TWO);
        }
        protected override void testCase(string message) {
            Expect.that(MARCH_ONE).shouldEqual(MARCH_TWO, message);
        }
    }

    @isTest
    static void ExpectShouldEqualThrowsDefaultMessage() {
        new ShouldEqualThrows()
            .verifyMessage('Expected ' + MARCH_ONE_S + ' should be ' + MARCH_TWO_S);
    }

    @isTest
    static void ExpectShouldEqualThrowsSpecificMessage() {
        new ShouldEqualThrows()
            .verifyCustomMessage('Unequal');
    }

    @isTest
    static void ExpectShouldNotEqualDoesNotThrow() {
        Expect.that(MARCH_ONE).shouldNotEqual(MARCH_TWO);
    }

    private class ShouldNotEqualThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(MARCH_ONE).shouldNotEqual(MARCH_ONE);
        }
        protected override void testCase(string message) {
            Expect.that(MARCH_ONE).shouldNotEqual(MARCH_ONE, message);
        }
    }

    @isTest
    static void ExpectShouldNotEqualThrowsDefaultMessage() {
        new ShouldNotEqualThrows()
            .verifyMessage('Expected ' + MARCH_ONE_S + ' should not be ' + MARCH_ONE_S);
    }

    @isTest
    static void ExpectShouldNotEqualThrowsSpecificMessage() {
        new ShouldNotEqualThrows()
            .verifyCustomMessage('equaled');
    }

    @isTest
    static void ExpectShouldBeLessThanDoesNotThrow() {
        Expect.that(MARCH_ONE).shouldBeLessThan(MARCH_TWO);
    }

    private class ShouldBeLessThanThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(MARCH_TWO).shouldBeLessThan(MARCH_ONE);
        }
        protected override void testCase(String message) {
            Expect.that(MARCH_TWO).shouldBeLessThan(MARCH_ONE, message);
        }
    }

    @isTest
    static void ExpectShouldBeLessThanThrowsDefaultMessage() {
        new ShouldBeLessThanThrows()
            .verifyMessage('Expected ' + MARCH_TWO_S + ' should be less than ' + MARCH_ONE_S);
    }

    @isTest
    static void ExpectShouldBeLessThanThrowsCustomMessage() {
        new ShouldBeLessThanThrows()
            .verifyCustomMessage('too high');
    }

    @isTest
    static void ExpectShouldBeLessThanOrEqualToDoesNotThrow() {
        Expect.that(MARCH_ONE).shouldBeLessThanOrEqualTo(MARCH_ONE);
        Expect.that(MARCH_ONE).shouldBeLessThanOrEqualTo(MARCH_TWO);
    }

    private class ShouldBeLessThanOrEqualToThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(MARCH_TWO).shouldBeLessThanOrEqualTo(MARCH_ONE);
        }
        protected override void testCase(String message) {
            Expect.that(MARCH_TWO).shouldBeLessThanOrEqualTo(MARCH_ONE, message);
        }
    }

    @isTest
    static void ExpectShouldBeLessThanOrEqualToThrowsDefaultMessage() {
        new ShouldBeLessThanOrEqualToThrows()
            .verifyMessage('Expected ' + MARCH_TWO_S + ' should be less than or equal to ' + MARCH_ONE_S);
    }

    @isTest
    static void ExpectShouldBeLessThanOrEqualToThrowsCustomMessage() {
        new ShouldBeLessThanOrEqualToThrows()
            .verifyCustomMessage('too high');
    }

    @isTest
    static void ExpectShouldBeGreaterThanDoesNotThrow() {
        Expect.that(MARCH_TWO).shouldBeGreaterThan(MARCH_ONE);
    }

    private class ShouldBeGreaterThanThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(MARCH_ONE).shouldBeGreaterThan(MARCH_TWO);
        }
        protected override void testCase(String message) {
            Expect.that(MARCH_ONE).shouldBeGreaterThan(MARCH_TWO, message);
        }
    }

    @isTest
    static void ExpectShouldBeGreaterThanThrowsDefaultMessage() {
        new ShouldBeGreaterThanThrows()
            .verifyMessage('Expected ' + MARCH_ONE_S + ' should be greater than '+ MARCH_TWO_S);
    }

    @isTest
    static void ExpectShouldBeGreaterThanThrowsSpecificMessage() {
        new ShouldBeGreaterThanThrows()
            .verifyCustomMessage('too low');
    }

    @isTest
    static void ExpectShouldBeGreaterThanOrEqualToDoesNotThrow() {
        Expect.that(MARCH_TWO).shouldBeGreaterThanOrEqualTo(MARCH_ONE);
        Expect.that(MARCH_ONE).shouldBeGreaterThanOrEqualTo(MARCH_ONE);
    }

    private class ShouldBeGreaterThanOrEqualToThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(MARCH_ONE).shouldBeGreaterThanOrEqualTo(MARCH_TWO);
        }
        protected override void testCase(String message) {
            Expect.that(MARCH_ONE).shouldBeGreaterThanOrEqualTo(MARCH_TWO, message);
        }
    }

    @isTest
    static void ExpectShouldBeGreaterThanOrEqualToThrowsDefaultMessage() {
        new ShouldBeGreaterThanOrEqualToThrows()
            .verifyMessage('Expected ' + MARCH_ONE_S + ' should be greater than or equal to ' + MARCH_TWO_S);
    }

    @isTest
    static void ExpectShouldBeGreaterThanOrEqualToThrowsSpecificMessage() {
        new ShouldBeGreaterThanOrEqualToThrows()
            .verifyCustomMessage('too low');
    }

    @isTest
    static void ExpectShouldBeBetweenDoesNotThrow() {
        Expect.that(MARCH_TWO).shouldBeBetween(MARCH_TWO, MARCH_THREE);
        Expect.that(MARCH_TWO).shouldBeBetween(MARCH_ONE, MARCH_TWO);
        Expect.that(MARCH_TWO).shouldBeBetween(MARCH_ONE, MARCH_THREE);
        Expect.that(MARCH_TWO).shouldBeBetween(MARCH_THREE, MARCH_TWO);
    }

    private class ShouldBeBetweenThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(MARCH_ONE).shouldBeBetween(MARCH_TWO, MARCH_THREE);
        }
        protected override void testCase(String message) {
            Expect.that(MARCH_ONE).shouldBeBetween(MARCH_TWO, MARCH_THREE, message);
        }
    }

    @isTest
    static void ExpectShouldBeBetweenThrowsThrowsDefaultMessage() {
        new ShouldBeBetweenThrows()
            .verifyMessage('Expected ' + MARCH_ONE_S + ' should be between ' + MARCH_TWO_S + ' and ' + MARCH_THREE_S);
    }

    @isTest
    static void ExpectShouldBeBetweenThrowsSpecificMessage() {
        new ShouldBeBetweenThrows()
            .verifyCustomMessage('outside allowed range');
    }

    @isTest
    static void ExpectDateChains() {
        Expect.that(MARCH_ONE).shouldBeLessThan(MARCH_TWO)
            .andit.shouldEqual(MARCH_ONE);
    }

}