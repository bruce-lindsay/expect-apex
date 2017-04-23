public class ExpectString extends Expect {
    private String expected;

    public ExpectString(String expected) {
        super(expected);
        this.expected = expected;
    }

    public ExpectString shouldEqual(String actual) {
        return shouldEqual(actual, expectedMessage(actual,''));
    }

    public ExpectString shouldEqual(String actual, String message) {
        assert(expected.equals(actual), message);
        return this;
    }

    public ExpectString shouldEqualIgnoreOrdinalCase(String actual) {
        return shouldEqualIgnoreOrdinalCase(actual, expectedMessage(actual,''));
    }

    public ExpectString shouldEqualIgnoreOrdinalCase(String actual, String message) {
        assert(expected.equalsIgnoreCase(actual), message);
        return this;
    }

    public ExpectString shouldNotEqual(String actual) {
        return shouldNotEqual(actual, expectedMessage(actual,' not'));
    }

    public ExpectString shouldNotEqual(String actual, String message) {
        assert(!expected.equals(actual), message);
        return this;
    }

    public ExpectString shouldContain(String actual) {
        return shouldContain(actual, expectedMessage(actual, SHOULD_CONTAIN_MESSAGE, ''));
    }

    public ExpectString shouldContain(String actual, String message) {
        assert(expected.contains(actual), message);
        return this;
    }

    public ExpectString shouldNotContain(String actual) {
        return shouldNotContain(actual, expectedMessage(actual, SHOULD_CONTAIN_MESSAGE, ' not'));
    }

    public ExpectString shouldNotContain(String actual, String message) {
        assert(expected.containsNone(actual), message);
        return this;
    }
}