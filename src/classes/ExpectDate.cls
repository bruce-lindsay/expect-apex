public class ExpectDate extends Expect {
    protected final Date expected;
    protected final ExpectDate parent;

    public ExpectDate(Date expected) {
        this.expected = expected;
        this.parent = this;
    }
    private ExpectDate(Date expected, Boolean negate, ExpectDate parent) {
        super(negate);
        this.expected = expected;
        this.parent = parent;
    }
    public ExpectDate negated {
        get {
            return negate ? this : new ExpectDate(this.expected, true, this);
        }
    }
    protected override String getExpectedAsString() {
        return String.valueOf(expected);
    }
    private ExpectDate assertThis(Boolean test, String message) {
        assertNegatable(test, message);
        return this.parent;
    }
    public ExpectDate shouldEqual(Date actual) {
        return shouldEqual(actual, formatMessage(SHOULD_BE_MESSAGE, String.valueOf(actual)));
    }
    public ExpectDate shouldEqual(Date actual, String message) {
        return assertThis(expected == actual, message);
    }
    public ExpectDate shouldBeLessThan(Date actual, string message) {
        return assertThis(expected < actual, message);
    }
    public ExpectDate shouldBeLessThan(Date actual) {
        return shouldBeLessThan(actual, expectedFormatMessage(SHOULD_BE_LESS_MESSAGE, String.valueOf(actual)));
    }
    public ExpectDate shouldBeLessThanOrEqualTo(Date actual, string message) {
        return assertThis(expected <= actual, message);
    }
    public ExpectDate shouldBeLessThanOrEqualTo(Date actual) {
        return shouldBeLessThanOrEqualTo(actual, expectedFormatMessage(SHOULD_BE_LESS_OR_EQUAL_MESSAGE, String.valueOf(actual)));
    }
    public ExpectDate shouldBeGreaterThan(Date actual, string message) {
        return assertThis(expected > actual, message);
    }
    public ExpectDate shouldBeGreaterThan(Date actual) {
        return shouldBeGreaterThan(actual, expectedFormatMessage(SHOULD_BE_GREATER_MESSAGE, String.valueOf(actual)));
    }
    public ExpectDate shouldBeGreaterThanOrEqualTo(Date actual, string message) {
        return assertThis(expected >= actual, message);
    }
    public ExpectDate shouldBeGreaterThanOrEqualTo(Date actual) {
        return shouldBeGreaterThanOrEqualTo(actual, expectedFormatMessage(SHOULD_BE_GREATER_OR_EQUAL_MESSAGE, String.valueOf(actual)));
    }
    public ExpectDate shouldBeBetween(Date rangeStart, Date rangeEnd) {
        return shouldBeBetween(rangeStart, rangeEnd, expectedShouldBeBetweenMessage(String.valueOf(rangeStart), String.valueOf(rangeEnd)));
    }
    public ExpectDate shouldBeBetween(Date rangeStart, Date rangeEnd, string message) {
        Boolean testedBetween = (rangeStart < rangeEnd) ?
            rangeStart <= this.expected && this.expected <= rangeEnd :
            rangeEnd <= this.expected && this.expected <= rangeStart;

        return assertThis(testedBetween, message);
    }
    public ExpectDate andIt { get { return this; } }
}