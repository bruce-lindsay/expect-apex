public class ExpectDatetime extends Expect {
    protected final Datetime expected;

    public ExpectDatetime(Datetime expected) {
        this.expected = expected;
    }
    private ExpectDatetime(ExpectDatetime existingInstance) {
        super(NegatedAssert, existingInstance);
        this.expected = existingInstance.expected;
    }

    public ExpectDatetime negated { get { return new ExpectDatetime(this); }}

    protected override String getExpectedAsString() {
        return String.valueOf(expected);
    }
    private ExpectDatetime assertThis(Boolean test, String message) {
        assertNegatable(test, message);
        return (ExpectDatetime) parentInstance;
    }
    public ExpectDatetime shouldEqual(Datetime actual) {
        return shouldEqual(actual, formatMessage(SHOULD_BE_MESSAGE, String.valueOf(actual)));
    }
    public ExpectDatetime shouldEqual(Datetime actual, String message) {
        return assertThis(expected == actual, message);
    }
    public ExpectDatetime shouldBeLessThan(Datetime actual, string message) {
        return assertThis(expected < actual, message);
    }
    public ExpectDatetime shouldBeLessThan(Datetime actual) {
        return shouldBeLessThan(actual, formatMessage(SHOULD_BE_LESS_MESSAGE, String.valueOf(actual)));
    }
    public ExpectDatetime shouldBeLessThanOrEqualTo(Datetime actual, string message) {
        return assertThis(expected <= actual, message);
    }
    public ExpectDatetime shouldBeLessThanOrEqualTo(Datetime actual) {
        return shouldBeLessThanOrEqualTo(actual, formatMessage(SHOULD_BE_LESS_OR_EQUAL_MESSAGE, String.valueOf(actual)));
    }
    public ExpectDatetime shouldBeGreaterThan(Datetime actual, string message) {
        return assertThis(expected > actual, message);
    }
    public ExpectDatetime shouldBeGreaterThan(Datetime actual) {
        return shouldBeGreaterThan(actual, formatMessage(SHOULD_BE_GREATER_MESSAGE, String.valueOf(actual)));
    }
    public ExpectDatetime shouldBeGreaterThanOrEqualTo(Datetime actual, string message) {
        return assertThis(expected >= actual, message);
    }
    public ExpectDatetime shouldBeGreaterThanOrEqualTo(Datetime actual) {
        return shouldBeGreaterThanOrEqualTo(actual, formatMessage(SHOULD_BE_GREATER_OR_EQUAL_MESSAGE, String.valueOf(actual)));
    }
    public ExpectDatetime shouldBeBetween(Datetime rangeStart, Datetime rangeEnd) {
        return shouldBeBetween(rangeStart, rangeEnd, expectedShouldBeBetweenMessage(String.valueOf(rangeStart), String.valueOf(rangeEnd)));
    }
    public ExpectDatetime shouldBeBetween(Datetime rangeStart, Datetime rangeEnd, string message) {
        Boolean testedBetween = (rangeStart < rangeEnd) ?
            rangeStart <= this.expected && this.expected <= rangeEnd :
            rangeEnd <= this.expected && this.expected <= rangeStart;

        return assertThis(testedBetween, message);
    }
    public ExpectDatetime andIt { get { return (ExpectDatetime) parentInstance; } }
}