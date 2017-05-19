public class ExpectString extends ExpectStringBase {
    public ExpectString(string s) {
        super(s);
    }
    public ExpectString(ExpectString parent) {
        super(parent);
    }

    public ExpectString shouldEqualIgnoreOrdinalCase(String actual) {
        return shouldEqualIgnoreOrdinalCase(actual, expectedShouldBeMessage(actual));
    }

    public ExpectString shouldEqualIgnoreOrdinalCase(String actual, String message) {
        return assertThis(expected.equalsIgnoreCase(actual), message);
    }

    public ExpectString shouldContain(String actual) {
        return shouldContain(actual, expectedFormatMessage(SHOULD_CONTAIN_MESSAGE, actual));
    }

    public ExpectString shouldContain(String actual, String message) {
        return assertThis(expected.contains(actual), message);
    }
}