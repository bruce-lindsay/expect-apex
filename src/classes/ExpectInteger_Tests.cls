@isTest
public class ExpectInteger_Tests {
    @isTest
    static void ExpectShouldEqualMatchingValueDoesNotThrow() {
        Expect.that(1).shouldEqual(1);
    }

    private class EqualNonMatchingValueShouldThrow extends ThrowCheck {
        protected override void testCase() {
            Expect.that(1).shouldEqual(2);
        }
    }

    @isTest
    static void ExpectShouldEqualNonMatchingValuesDoesThrow() {
        Expect.UseSystemAssert = false;
        new EqualNonMatchingValueShouldThrow().verifyMessage('Expected 1 should be 2');
    }

    private class NotEqualMatchingValuesDoesThrow extends ThrowCheck {
        protected override void testCase() {
            Expect.that(1).shouldNotEqual(1);
        }
    }

    @isTest
    static void ExpectShouldNotEqualMatchingValuesDoesThrow() {
        Expect.UseSystemAssert = false;
        new NotEqualMatchingValuesDoesThrow().verifyMessage('Expected 1 should not be 1');
    }

    @isTest
    static void ExpectShouldNotEqualNonMatchingValueDoesNotThrow() {
        Expect.that(1).shouldNotEqual(2);
    }
}