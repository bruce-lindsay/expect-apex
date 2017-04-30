public class ExpectObject extends Expect {

    private final Object expected;

    public ExpectObject(Object expected) {
        this.expected = expected;
    }

    protected override String getExpectedAsString() {
        return String.valueOf(expected);
    }

    public ExpectObject andIt { get { return this; } }

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
        assert(expected !== actual, message);
        return this;
    }

    public Expect isEquivalentTo(Object actual) {
        return isEquivalentTo(actual, expectedMessage(actual,''));
    }

    public Expect isEquivalentTo(Object actual, String message) {
        assert(expected == actual, message);
        return this;
    }
}