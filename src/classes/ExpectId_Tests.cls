@isTest
public class ExpectId_Tests {
    private static final Id ID_LOWEST = Id.valueOf('0014100000K0TKtAAN');
    private static final Id ID_MIDDLE = Id.valueOf('0014100000K0TKuAAN');
    private static final Id ID_HIGHEST = Id.valueOf('0014100000K0TKvAAN');
    private static final String ID_LOWEST_S = String.valueOf(ID_LOWEST);
    private static final String ID_MIDDLE_S = String.valueOf(ID_MIDDLE);
    private static final String ID_HIGHEST_S = String.valueOf(ID_HIGHEST);

    @isTest
    static void ExpectShouldEqualMatchingValueDoesNotThrow() {
        Expect.that(ID_LOWEST).shouldEqual(ID_LOWEST);
    }

    private class ShouldEqualThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(ID_LOWEST).shouldEqual(ID_MIDDLE);
        }
        protected override void testCase(string message) {
            Expect.that(ID_LOWEST).shouldEqual(ID_MIDDLE, message);
        }
    }

    @isTest
    static void ExpectShouldEqualThrowsDefaultMessage() {
        new ShouldEqualThrows()
            .verifyMessage('Expected ' + ID_LOWEST_S + ' should be ' + ID_MIDDLE_S);
    }

    @isTest
    static void ExpectShouldEqualThrowsSpecificMessage() {
        new ShouldEqualThrows()
            .verifyCustomMessage('Unequal');
    }

    @isTest
    static void ExpectShouldNotEqualDoesNotThrow() {
        Expect.that(ID_LOWEST).negated.shouldEqual(ID_MIDDLE);
    }

    private class ShouldNotEqualThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(ID_LOWEST).negated.shouldEqual(ID_LOWEST);
        }
        protected override void testCase(string message) {
            Expect.that(ID_LOWEST).negated.shouldEqual(ID_LOWEST, message);
        }
    }

    @isTest
    static void ExpectShouldNotEqualThrowsDefaultMessage() {
        new ShouldNotEqualThrows()
            .verifyMessage('Expected ' + ID_LOWEST_S + ' should not be ' + ID_LOWEST_S);
    }

    @isTest
    static void ExpectShouldNotEqualThrowsSpecificMessage() {
        new ShouldNotEqualThrows()
            .verifyCustomMessage('equaled');
    }

    @isTest
    static void ExpectShouldBeLessThanDoesNotThrow() {
        Expect.that(ID_LOWEST).shouldBeLessThan(ID_MIDDLE);
    }

    @isTest
    static void ExpectShouldBeLessThanNegatedDoesNotThrow() {
        Expect.that(ID_MIDDLE).negated.shouldBeLessThan(ID_LOWEST)
            .andIt.shouldBeLessThan(ID_HIGHEST);
    }

    private class ShouldBeLessThanThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(ID_MIDDLE).shouldBeLessThan(ID_LOWEST);
        }
        protected override void testCase(String message) {
            Expect.that(ID_MIDDLE).shouldBeLessThan(ID_LOWEST, message);
        }
    }

    @isTest
    static void ExpectShouldBeLessThanThrowsDefaultMessage() {
        new ShouldBeLessThanThrows()
            .verifyMessage('Expected ' + ID_MIDDLE_S + ' should be less than ' + ID_LOWEST_S);
    }

    @isTest
    static void ExpectShouldBeLessThanThrowsCustomMessage() {
        new ShouldBeLessThanThrows()
            .verifyCustomMessage('too high');
    }

    @isTest
    static void ExpectShouldBeLessThanOrEqualToDoesNotThrow() {
        Expect.that(ID_LOWEST).shouldBeLessThanOrEqualTo(ID_LOWEST);
        Expect.that(ID_LOWEST).shouldBeLessThanOrEqualTo(ID_MIDDLE);
    }

    private class ShouldBeLessThanOrEqualToThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(ID_MIDDLE).shouldBeLessThanOrEqualTo(ID_LOWEST);
        }
        protected override void testCase(String message) {
            Expect.that(ID_MIDDLE).shouldBeLessThanOrEqualTo(ID_LOWEST, message);
        }
    }

    @isTest
    static void ExpectShouldBeLessThanOrEqualToThrowsDefaultMessage() {
        new ShouldBeLessThanOrEqualToThrows()
            .verifyMessage('Expected ' + ID_MIDDLE_S + ' should be less than or equal to ' + ID_LOWEST_S);
    }

    @isTest
    static void ExpectShouldBeLessThanOrEqualToThrowsCustomMessage() {
        new ShouldBeLessThanOrEqualToThrows()
            .verifyCustomMessage('too high');
    }

    @isTest
    static void ExpectShouldBeGreaterThanDoesNotThrow() {
        Expect.that(ID_MIDDLE).shouldBeGreaterThan(ID_LOWEST);
    }

    private class ShouldBeGreaterThanThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(ID_LOWEST).shouldBeGreaterThan(ID_MIDDLE);
        }
        protected override void testCase(String message) {
            Expect.that(ID_LOWEST).shouldBeGreaterThan(ID_MIDDLE, message);
        }
    }

    @isTest
    static void ExpectShouldBeGreaterThanThrowsDefaultMessage() {
        new ShouldBeGreaterThanThrows()
            .verifyMessage('Expected ' + ID_LOWEST_S + ' should be greater than '+ ID_MIDDLE_S);
    }

    @isTest
    static void ExpectShouldBeGreaterThanThrowsSpecificMessage() {
        new ShouldBeGreaterThanThrows()
            .verifyCustomMessage('too low');
    }

    @isTest
    static void ExpectShouldBeGreaterThanOrEqualToDoesNotThrow() {
        Expect.that(ID_MIDDLE).shouldBeGreaterThanOrEqualTo(ID_LOWEST);
        Expect.that(ID_LOWEST).shouldBeGreaterThanOrEqualTo(ID_LOWEST);
    }

    private class ShouldBeGreaterThanOrEqualToThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(ID_LOWEST).shouldBeGreaterThanOrEqualTo(ID_MIDDLE);
        }
        protected override void testCase(String message) {
            Expect.that(ID_LOWEST).shouldBeGreaterThanOrEqualTo(ID_MIDDLE, message);
        }
    }

    @isTest
    static void ExpectShouldBeGreaterThanOrEqualToThrowsDefaultMessage() {
        new ShouldBeGreaterThanOrEqualToThrows()
            .verifyMessage('Expected ' + ID_LOWEST_S + ' should be greater than or equal to ' + ID_MIDDLE_S);
    }

    @isTest
    static void ExpectShouldBeGreaterThanOrEqualToThrowsSpecificMessage() {
        new ShouldBeGreaterThanOrEqualToThrows()
            .verifyCustomMessage('too low');
    }

    @isTest
    static void ExpectShouldBeBetweenDoesNotThrow() {
        Expect.that(ID_MIDDLE).shouldBeBetween(ID_MIDDLE, ID_HIGHEST);
        Expect.that(ID_MIDDLE).shouldBeBetween(ID_LOWEST, ID_MIDDLE);
        Expect.that(ID_MIDDLE).shouldBeBetween(ID_LOWEST, ID_HIGHEST);
        Expect.that(ID_MIDDLE).shouldBeBetween(ID_HIGHEST, ID_MIDDLE);
    }

    private class ShouldBeBetweenThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(ID_LOWEST).shouldBeBetween(ID_MIDDLE, ID_HIGHEST);
        }
        protected override void testCase(String message) {
            Expect.that(ID_LOWEST).shouldBeBetween(ID_MIDDLE, ID_HIGHEST, message);
        }
    }

    @isTest
    static void ExpectShouldBeBetweenThrowsThrowsDefaultMessage() {
        new ShouldBeBetweenThrows()
            .verifyMessage('Expected ' + ID_LOWEST_S + ' should be between ' + ID_MIDDLE_S + ' and ' + ID_HIGHEST_S);
    }

    @isTest
    static void ExpectShouldBeBetweenThrowsSpecificMessage() {
        new ShouldBeBetweenThrows()
            .verifyCustomMessage('outside allowed range');
    }

    private class ShouldNotBeBetweenThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that(ID_MIDDLE).negated.shouldBeBetween(ID_LOWEST, ID_HIGHEST);
        }
        protected override void testCase(String message) {
            Expect.that(ID_MIDDLE).negated.shouldBeBetween(ID_LOWEST, ID_HIGHEST, message);
        }
    }

    @isTest
    static void ExpectShouldNotBeBetweenThrowsThrowsDefaultMessage() {
        new ShouldNotBeBetweenThrows()
            .verifyMessage('Expected ' + ID_MIDDLE_S + ' should not be between ' + ID_LOWEST_S + ' and ' + ID_HIGHEST_S);
    }

    @isTest
    static void ExpectShouldNotBeBetweenThrowsSpecificMessage() {
        new ShouldNotBeBetweenThrows()
            .verifyCustomMessage('outside allowed range');
    }

    @isTest
    static void ExpectIdChains() {
        Expect.that(ID_LOWEST).shouldBeLessThan(ID_MIDDLE)
            .andit.shouldEqual(ID_LOWEST);
    }

}