public virtual class Expect {
    public static Boolean UseSystemAssert = true;
    public static final String SHOULD_BE_MESSAGE = 'Expected {0} should{1} be {2}';
    public static final String SHOULD_BE_LESS_MESSAGE = 'Expected {0} should be less than {1}';
    public static final String SHOULD_BE_LESS_OR_EQUAL_MESSAGE = 'Expected {0} should be less than or equal to {1}';
    public static final String SHOULD_BE_GREATER_MESSAGE = 'Expected {0} should be greater than {1}';
    public static final String SHOULD_BE_GREATER_OR_EQUAL_MESSAGE = 'Expected {0} should be greater than or equal to {1}';
    public static final String SHOULD_BE_BETWEEN_MESSAGE = 'Expected {0} should be between {1} and {2}';
    public static final String SHOULD_BE_FALSE_MESSAGE = 'Expected true should be false';
    public static final String SHOULD_BE_TRUE_MESSAGE = 'Expected false should be true';
    public static final String SHOULD_CONTAIN_MESSAGE = 'Expected {0} should{1} contain {2}';

    private final Object expected;

    protected Expect() {}

    public Expect(Object expected) {
        this.expected = expected;
    }

    public Expect andIt { get { return this; } }

    public class AssertException extends System.Exception {}

    public static void assert(Boolean expected, String message) {
        if(UseSystemAssert) {
            System.assert(expected, message);
        } else {
            if(!expected) {
                throw new Expect.AssertException(message);
            }
        }
    }

    public Expect shouldEqual(Object actual) {
        shouldEqual(actual, expectedMessage(actual,''));
        return this;
    }

    public Expect shouldEqual(Object actual, String message) {
        assert(expected === actual, message);
        return this;
    }

    public Expect shouldNotEqual(Object actual) {
        return shouldNotEqual(actual, expectedMessage(actual,' not'));
    }

    public Expect shouldNotEqual(Object actual, String message) {
        assert(expected != actual, message);
        return this;
    }

    public Expect isEquivalentTo(Object actual) {
        return isEquivalentTo(actual, expectedMessage(actual,''));
    }

    public Expect isEquivalentTo(Object actual, String message) {
        assert(expected == actual, message);
        return this;
    }

    public static Expect that(Object expected) {
        return new Expect(expected);
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

    public static ExpectSObject that(SObject expected) {
        return new ExpectSObject(expected);
    }

    protected String expectedMessage(Object actual, String delimiter) {
        return expectedMessage(actual, SHOULD_BE_MESSAGE, delimiter);
    }

    protected String expectedMessage(Object actual, String formatString, String delimiter) {
        return String.format(formatString, new String[] {
            String.valueOf(expected),
            delimiter,
            String.valueOf(actual)
        });
    }
}