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

    private class NonEqualLetters extends ThrowCheck {
        protected override void testCase() {
            Expect.that('a').shouldEqual('b');
        }

        protected override void testCase(String message) {
            Expect.that('a').shouldEqual('b', message);
        }
    }

    @isTest
    static void ExpectNonEqualLettersShouldThrowForEquals() {
        new NonEqualLetters().verifyMessage(String.format(Expect.SHOULD_BE_MESSAGE, new String[]{'a','', 'b'}));
        new NonEqualLetters().verifyCustomMessage('hello');
    }

    private class EqualLettersThrowsForNotEqual extends ThrowCheck {
        protected override void testCase() {
            Expect.that('a').shouldNotEqual('a');
        }
        protected override void testCase(String message) {
            Expect.that('a').shouldNotEqual('a', message);
        }
    }

    @isTest
    static void ExpectEqualLettersShouldThrowForNotEquals() {
        new EqualLettersThrowsForNotEqual().verifyMessage(String.format(Expect.SHOULD_BE_MESSAGE, new String[]{'a',' not', 'a'}));
        new EqualLettersThrowsForNotEqual().verifyCustomMessage('hello');
    }

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
        new CapitalLetter().verifyMessage(String.format(Expect.SHOULD_BE_MESSAGE, new String[]{'a','','A'}));
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
        Expect.that('a').shouldNotContain('A');
    }

    private class StringDoesContain extends ThrowCheck {
        protected override void testCase() {
            Account account = new Account(Name = 'Hello');
            insert account;

            String one = 'Account id: ' + String.valueOf(account.Id);
            String two = String.valueOf(account.Id);

            Expect.that(one).shouldNotContain(two);
        }

        protected override void testCase(String message) {
            Expect.that('ab').shouldNotContain('ab', message);
        }
    }

    @isTest
    static void ExpectStringShouldNotContainThrowsWhenStringDoesContain() {
        new StringDoesContain().verify();
        new StringDoesContain().verifyCustomMessage('hello');
    }
}