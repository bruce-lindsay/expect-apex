public virtual class Expect {
    public static Boolean UseSystemAssert = true;
    public static final String SHOULD_BE_MESSAGE = 'Expected {0} should{1} be {2}';
    private Object expected;

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

    private String expectedMessage(Object actual, String delimiter) {
        return String.format(SHOULD_BE_MESSAGE, new String[]{
            String.valueOf(expected),
            delimiter,
            String.valueOf(actual)
        });
    }
}