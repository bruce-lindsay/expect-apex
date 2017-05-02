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
        return assertThis(expected !== actual, message);
    }

    public ExpectObject shouldBeEquivalentTo(Object actual) {
        return shouldBeEquivalentTo(actual, expectedShouldBeMessage(actual));
    }

    public ExpectObject shouldBeEquivalentTo(Object actual, String message) {
        return assertThis(expected == actual, message);
    }

    public ExpectObject shouldNotBeEquivalentTo(Object actual) {
        return shouldNotBeEquivalentTo(actual, expectedShouldNotBeMessage(actual));
    }

    public ExpectObject shouldNotBeEquivalentTo(Object actual, string message) {
        return assertThis(expected != actual, message);
    }

    public ExpectObject andIt { get { return this; } }
}