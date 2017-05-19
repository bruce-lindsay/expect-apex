public abstract class Expect {
    public class ExpectNegation {
        private ExpectNegation() {}
    }
    public static Boolean UseSystemAssert = true;
    public static final String SHOULD_BE_MESSAGE = 'Expected {0} {1} be {2}';
    public static final String SHOULD_BE_LESS_MESSAGE = 'Expected {0} {1} be less than {2}';
    public static final String SHOULD_BE_LESS_OR_EQUAL_MESSAGE = 'Expected {0} {1} be less than or equal to {2}';
    public static final String SHOULD_BE_GREATER_MESSAGE = 'Expected {0} {1} be greater than {2}';
    public static final String SHOULD_BE_GREATER_OR_EQUAL_MESSAGE = 'Expected {0} {1} be greater than or equal to {2}';
    private static final String SHOULD_BE_BETWEEN_MESSAGE = 'Expected {0} {1} be between {2} and {3}';
    public static final String SHOULD_CONTAIN_MESSAGE = 'Expected {0} {1} contain {2}';
    protected final Boolean negate;
    public static final ExpectNegation NegatedAssert = new ExpectNegation();
    protected final Expect parentInstance;

    protected Expect() {
        negate = false;
        parentInstance = this;
    }
    protected Expect(boolean negatedState) {
        negate = negatedState;
    }
    protected Expect(ExpectNegation forceNegated, Expect parent) {
        negate = true;
        parentInstance = parent;
    }
    protected abstract String getExpectedAsString();

    private string shouldOrShouldNot {
        get {
            return negate ? 'should not' : 'should';
        }
    }

    public class AssertException extends System.Exception {}

    protected void assertNegatable(Boolean testResult, String message) {
        Boolean expected = negate ? !testResult : testResult;
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

    public static ExpectSObjectType that(SObjectType expected) {
        return new ExpectSObjectType(expected);
    }

    public static ExpectId that(Id expected) {
        return new ExpectId(expected);
    }

    protected String formatMessage(String formatString, Object actual) {
        return expectedMessage(formatString, actual, shouldOrShouldNot);
    }

    protected String expectedShouldBeBetweenMessage(Object beginRange, Object endRange) {
        return String.format(SHOULD_BE_BETWEEN_MESSAGE, new String[] {
            this.getExpectedAsString(),
            shouldOrShouldNot,
            String.valueOf(beginRange),
            String.valueOf(endRange)
        });
    }

    private String expectedMessage(Object actual, String delimiter) {
        return expectedMessage(SHOULD_BE_MESSAGE, actual, delimiter);
    }

    private String expectedMessage(String formatString, Object actual, String delimiter) {
        return String.format(formatString, new String[] {
            this.getExpectedAsString(),
            delimiter,
            String.valueOf(actual)
        });
    }
}