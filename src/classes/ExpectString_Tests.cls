@isTest
public class ExpectString_Tests {
    private class CapitalLetter extends ThrowCheck {
        protected override void testCase() {
            Expect.that('a').shouldEqual('A');
        }
        protected override void testCase(String message) {
            Expect.that('a').shouldEqual('A', message);
        }
    }

    @isTest
    static void ExpectACapitalLetterShouldNotEqualALowerCaseLetter() {
        new CapitalLetter().verifyMessage('Expected a should be A');
        new CapitalLetter().verifyCustomMessage('A != a');
    }

    @isTest
    static void ExpectACapitalLetterShouldEqualALowerCaseLetterIgnoringCase() {
        Expect.that('a').shouldEqualIgnoreOrdinalCase('A');
    }

    @isTest
    static void ExpectStringContainsShouldNotThrowWhenStringDoesContain() {
        Expect.that('abc').shouldContain('b');
        Expect.that('abc').shouldContain('a');
        Expect.that('abc').shouldContain('c');
    }

    private class StringWithoutContainingLetters extends ThrowCheck {
        protected override void testCase() {
            Expect.that('a').shouldContain('b');
        }

        protected override void testCase(String message) {
            Expect.that('a').shouldContain('A', message);
        }
    }

    @isTest
    static void ExpectStringContainsShouldThrowWhenStringDoesNotContain() {
        new StringWithoutContainingLetters().verify();
        new StringWithoutContainingLetters().verifyCustomMessage('hello');
    }

    @isTest
    static void ExpectStringShouldNotContainDoesNotThrowWhenStringDoesNotContain() {
        Expect.that('a').negated.shouldContain('A');
    }

    private class ShouldNotContainThrows extends ThrowCheck {
        protected override void testCase() {
            Expect.that('ab').negated.shouldContain('ab');
        }

        protected override void testCase(String message) {
            Expect.that('ab').negated.shouldContain('ab', message);
        }
    }

    @isTest
    static void ExpectStringShouldNotContainThrowsWhenStringDoesContain() {
        new ShouldNotContainThrows().verify();
        new ShouldNotContainThrows().verifyCustomMessage('hello');
    }
}