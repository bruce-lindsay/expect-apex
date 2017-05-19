public class ExpectObject extends Expect {

    private final Object expected;

    public ExpectObject(Object expected) {
        this.expected = expected;
    }

    private ExpectObject(ExpectObject existingInstance) {
        super(NegatedAssert, existingInstance);
        this.expected = existingInstance.expected;
    }

    protected override String getExpectedAsString() {
        return String.valueOf(expected);
    }

    private ExpectObject assertThis(Boolean test, String message) {
        assertNegatable(test, message);
        return (ExpectObject) parentInstance;
    }

    public ExpectObject shouldEqual(Object actual) {
        return shouldEqual(actual, formatMessage(SHOULD_BE_MESSAGE, actual));
    }

    public ExpectObject shouldEqual(Object actual, String message) {
        return assertThis(expected === actual, message);
    }

    public ExpectObject shouldBeEquivalentTo(Object actual) {
        return shouldBeEquivalentTo(actual, formatMessage(SHOULD_BE_MESSAGE, actual));
    }

    public ExpectObject shouldBeEquivalentTo(Object actual, String message) {
        return assertThis(expected == actual, message);
    }

    public ExpectObject andIt { get { return (ExpectObject) parentInstance; } }

    public ExpectObject negated {
        get {
            return new ExpectObject(this);
        }
    }
}