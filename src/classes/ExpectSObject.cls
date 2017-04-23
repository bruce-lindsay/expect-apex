public class ExpectSObject extends Expect {
    private static Boolean isSuccess = true;
    private static Boolean isFail = false;
    private static String exceptionString;
    private SObject expected;

    public ExpectSObject(SObject expected) {
        super(expected);
        this.expected = expected;
    }

    public ExpectSObject andIt { get { return this; } }

    public ExpectSObject shouldEqual(SObject actual) {
        shouldEqual(actual, expectedMessage(actual,''));
        return this;
    }

    public ExpectSObject shouldEqual(SObject actual, String message) {
        assert(expected === actual, message);
        return this;
    }

    public ExpectSObject shouldNotEqual(SObject actual) {
        return shouldNotEqual(actual, expectedMessage(actual,' not'));
    }

    public ExpectSObject shouldNotEqual(SObject actual, String message) {
        assert(expected != actual, message);
        return this;
    }

    public ExpectSObject whenTryingToUpdate() {
        try {
            update this.expected;
        } catch (Exception ex) {
            isFail = true;
            isSuccess = false;
            exceptionString = ex.getMessage();
        }

        return this;
    }

    public ExpectSObject shouldFailWithMessage(String errorKeywords) {
        if(!isFail) {
            throw new Expect.AssertException('Should have failed');
        }

        assert(exceptionString.contains(errorKeywords), expectedMessage(exceptionString, SHOULD_CONTAIN_MESSAGE, ' not'));
        return this;
    }

    public static void shouldBeOK() {
        if(!isSuccess) {
            throw new Expect.AssertException('Should have succeeded');
        }
    }
}