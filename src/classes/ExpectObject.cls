public class ExpectObject extends Expect {

    private final Object expected;

    public ExpectObject(Object expected) {
        this.expected = expected;
    }

    protected override String getExpectedAsString() {
        return String.valueOf(expected);
    }

    private ExpectObject assertThis(Boolean test, String message) {
        Expect.assert(test, message);
        return this;
    }

    public ExpectObject shouldEqual(Object actual) {
        return shouldEqual(actual, expectedShouldBeMessage(actual));
    }

    public ExpectObject shouldEqual(Object actual, String message) {
        return assertThis(expected === actual, message);
    }

    public Expect shouldNotEqual(Object actual) {
        return shouldNotEqual(actual, expectedShouldNotBeMessage(actual));
    }

    public Expect shouldNotEqual(Object actual, String message) {
        assert(expected !== actual, message);
        return this;
    }

    public ExpectObject isEquivalentTo(Object actual) {
        return isEquivalentTo(actual, expectedShouldBeMessage(actual));
    }

    public ExpectObject isEquivalentTo(Object actual, String message) {
        return assertThis(expected == actual, message);
    }

    public ExpectObject andIt { get { return this; } }
}