@isTest
public class ExpectString_Tests {
    @isTest
    static void ExpectEqualLettersShouldNotThrowForEquals() {
        Expect.that('a').shouldEqual('a');
    }

    @isTest
    static void ExpectNonEqualLettersShouldNotThrowForNotEquals() {
        Expect.that('a').shouldNotEqual('A');
    }

    private class EqualLetters extends ThrowCheck {
        protected override void testCase() {
            Expect.that('a').shouldEqual('b');
        }
    }

    @isTest
    static void ExpectNonEqualLettersShouldThrowForEquals() {
        Expect.UseSystemAssert = false;
        new EqualLetters().verifyMessage(String.format(Expect.SHOULD_BE_MESSAGE, new String[]{'a','', 'b'}));
    }

    private class NotEqualLetters extends ThrowCheck {
        protected override void testCase() {
            Expect.that('a').shouldNotEqual('a');
        }
    }

    @isTest
    static void ExpectEqualLettersShouldThrowForNotEquals() {
        Expect.UseSystemAssert = false;
        new NotEqualLetters().verifyMessage(String.format(Expect.SHOULD_BE_MESSAGE, new String[]{'a','not ', 'a'}));
    }

    private class CapitalLetter extends ThrowCheck {
        protected override void testCase() {
            Expect.that('a').shouldEqual('A');
        }
    }

    @isTest
    static void ExpectACapitalLetterShouldNotEqualALowerCaseLetter() {
        Expect.UseSystemAssert = false;
        new CapitalLetter().verifyMessage(String.format(Expect.SHOULD_BE_MESSAGE, new String[]{'a','','A'}));
    }

    @isTest
    static void ExpectACapitalLetterShouldEqualALowerCaseLetterIgnoringCase() {
        Expect.that('a').shouldEqualIgnoreOrdinalCase('A');
    }

    @isTest
    static void ExpectASmallerLetterShouldBeLessThanALargerOne() {
        Expect.that('a').shouldBeLessThan('b');
    }

    @isTest
    static void ExpectASmallerLetterShouldBeLessThanOrEqualToALargerOne() {
        Expect.that('a').shouldBeLessThanOrEqual('b');
    }

    private class LessThanLetter extends ThrowCheck {
        protected override void testCase() {
            Expect.that('b').shouldBeLessThan('a');
        }
    }

    @isTest
    static void ExpectANonSmallerLetterShouldThrowForLessThan() {
        Expect.UseSystemAssert = false;
        new LessThanLetter().verifyMessage(String.format(Expect.SHOULD_BE_COMPARISON,new String[]{'b','<','a'}));
    }

    private class LessThanOrEqualLetter extends ThrowCheck {
        protected override void testCase() {
            Expect.that('b').shouldBeLessThanOrEqual('a');
        }
    }

    @isTest
    static void ExpectANonSmallerLetterShouldThrowForLessThanOrEqual() {
        Expect.UseSystemAssert = false;
        new LessThanOrEqualLetter().verifyMessage(String.format(Expect.SHOULD_BE_COMPARISON,new String[]{'b','<=','a'}));
    }

    @isTest
    static void ExpectALargerLetterShouldNotThrowForGreaterThan() {
        Expect.that('b').shouldBeGreaterThan('a');
    }

    @isTest
    static void ExpectALargerLetterShouldNotThrowForGreaterThanOrEqualTo() {
        Expect.that('b').shouldBeGreaterThanOrEqual('a');
    }

    private class GreaterThanLetter extends ThrowCheck {
        protected override void testCase() {
            Expect.that('a').shouldBeGreaterThan('b');
        }
    }

    @isTest
    static void ExpectANonLargerLetterShouldThrowForGreaterThan() {
        Expect.UseSystemAssert = false;
        new GreaterThanLetter().verifyMessage(String.format(Expect.SHOULD_BE_COMPARISON,new String[]{'a','>','b'}));
    }

    private class GreaterThanOrEqualToLetter extends ThrowCheck {
        protected override void testCase() {
            Expect.that('a').shouldBeGreaterThanOrEqual('b');
        }
    }

    @isTest
    static void ExpectANonLargerLetterShouldThrowForGreaterThanOrEqualTo() {
        Expect.UseSystemAssert = false;
        new GreaterThanOrEqualToLetter().verifyMessage(String.format(Expect.SHOULD_BE_COMPARISON,new String[]{'a','>=','b'}));
    }
}