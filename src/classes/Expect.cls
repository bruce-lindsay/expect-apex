public abstract class Expect {
    public static Boolean UseSystemAssert = true;
    public static final String SHOULD_BE_MESSAGE = 'Expected {0} {1} be {2}';
    public static final String SHOULD_BE_LESS_MESSAGE = 'Expected {0} {1} be less than {2}';
    public static final String SHOULD_BE_LESS_OR_EQUAL_MESSAGE = 'Expected {0} {1} be less than or equal to {2}';
    public static final String SHOULD_BE_GREATER_MESSAGE = 'Expected {0} {1} be greater than {2}';
    public static final String SHOULD_BE_GREATER_OR_EQUAL_MESSAGE = 'Expected {0} {1} be greater than or equal to {2}';
    private static final String SHOULD_BE_BETWEEN_MESSAGE = 'Expected {0} {1} be between {2} and {3}';
    public static final String SHOULD_BE_FALSE_MESSAGE = 'Expected true {1} be false'; //  remove in favor of SHOULD_BE_MESSAGE?
    public static final String SHOULD_BE_TRUE_MESSAGE = 'Expected false {1} be true'; // remove in favor of SHOULD_BE_MESSAGE?
    public static final String SHOULD_CONTAIN_MESSAGE = 'Expected {0} {1} contain {2}';

    protected Expect() {}

    protected abstract String getExpectedAsString();

    public class AssertException extends System.Exception {}

    public static void assert(Boolean expected, String message) {
        if(UseSystemAssert) {
            System.assert(expected, message);
        } else if (!expected) {
            throw new Expect.AssertException(message);
        }
    }

    public static ExpectObject that(Object expected) {
        return new ExpectObject(expected);
    }

    public static ExpectBoolean that(Boolean expected) {
        return new ExpectBoolean(expected);
    }

    public static ExpectInteger that(Integer expected) {
        return new ExpectInteger(expected);
    }

    public static ExpectString that(String expected) {
        return new ExpectString(expected);
    }

    public static ExpectDate that(Date expected) {
        return new ExpectDate(expected);
    }

    public static ExpectDateTime that(DateTime expected) {
        return new ExpectDateTime(expected);
    }

    public static ExpectSObject that(SObject expected) {
        return new ExpectSObject(expected);
    }

    protected String expectedShouldBeMessage(Object actual) {
        return expectedMessage(actual, SHOULD_BE_MESSAGE, 'should');
    }

    protected String expectedShouldNotBeMessage(Object actual) {
        return expectedMessage(actual, SHOULD_BE_MESSAGE, 'should not');
    }

    protected String expectedFormatMessage(String formatString, Object actual) {
        return expectedMessage(actual, formatString, 'should');
    }

    protected String expectedFormatNotMessage(String formatString, Object actual) {
        return expectedMessage(actual, formatString, 'should not');
    }

    protected String expectedShouldBeBetweenMessage(Object beginRange, Object endRange) {
        return String.format(SHOULD_BE_BETWEEN_MESSAGE, new String[] {
            this.getExpectedAsString(),
            'should',
            String.valueOf(beginRange),
            String.valueOf(endRange)
        });
    }

// TODO: refactor this to be more explicit?
// expectedShouldBe expectedShouldNotBe
    protected String expectedMessage(Object actual, String delimiter) {
        return expectedMessage(actual, SHOULD_BE_MESSAGE, delimiter);
    }
// TODO: refactor this to be more explicit?
// formatExpectedMessage? formatString actual
// formatExpectedMessageNot? formatString actual
    protected String expectedMessage(Object actual, String formatString, String delimiter) {
        return String.format(formatString, new String[] {
            this.getExpectedAsString(),
            delimiter == '' ? 'should' : delimiter, //temporary!
            String.valueOf(actual)
        });
    }
}