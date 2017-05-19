public class ExpectBoolean extends Expect {
    private final Boolean expected;
    public ExpectBoolean(Boolean expected) {
        this.expected = expected;
    }
    private ExpectBoolean(ExpectBoolean existingInstance) {
        super(NegatedAssert, existingInstance);
        this.expected = existingInstance.expected;
    }

    protected override String getExpectedAsString() {
        return String.valueOf(expected);
    }

    public ExpectBoolean andIt { get { return (ExpectBoolean) parentInstance; } }

    public ExpectBoolean shouldBeFalse() {
        return shouldEqual(false);
    }

    public ExpectBoolean shouldBeFalse(String message) {
        return shouldEqual(false, message);
    }

    public ExpectBoolean shouldBeTrue() {
        return shouldEqual(true);
    }

    public ExpectBoolean shouldBeTrue(String message) {
        return shouldEqual(true, message);
    }

    public ExpectBoolean shouldEqual(Boolean actual) {
        return shouldEqual(actual, formatMessage(SHOULD_BE_MESSAGE, actual));
    }

    public ExpectBoolean shouldEqual(Boolean actual, String message) {
        assertNegatable(this.expected == actual, message);
        return (ExpectBoolean) parentInstance;
    }
    public ExpectBoolean negated {
        get {
            return new ExpectBoolean(this);
        }
    }

}