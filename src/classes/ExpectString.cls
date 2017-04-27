public class ExpectString extends ExpectStringBase {
    public ExpectString(string s) {
        super(s);
    }

    public ExpectString shouldEqualIgnoreOrdinalCase(String actual) {
        return shouldEqualIgnoreOrdinalCase(actual, expectedMessage(actual,''));
    }

    public ExpectString shouldEqualIgnoreOrdinalCase(String actual, String message) {
        return assertThis(expected.equalsIgnoreCase(actual), message);
    }

    public ExpectString shouldContain(String actual) {
        return shouldContain(actual, expectedMessage(actual, SHOULD_CONTAIN_MESSAGE, ''));
    }

    public ExpectString shouldContain(String actual, String message) {
        return assertThis(expected.contains(actual), message);
    }

    public ExpectString shouldNotContain(String actual) {
        return shouldNotContain(actual, expectedMessage(actual, SHOULD_CONTAIN_MESSAGE, ' not'));
    }

    public ExpectString shouldNotContain(String actual, String message) {
        return assertThis(expected.containsNone(actual), message);
    }
}