public virtual class ExpectStringBase extends Expect {
    protected final String expected;

    public ExpectStringBase(String expected) {
        this.expected = expected;
    }
    protected override String getExpectedAsString() {
        return String.valueOf(expected);
    }
    private ExpectString assertThis(Boolean test, String message) {
        Expect.assert(test, message);
        return (ExpectString) this;
    }
    public ExpectString shouldEqual(String actual) {
        return shouldEqual(actual, expectedShouldBeMessage(actual));
    }
    public ExpectString shouldEqual(String actual, String message) {
        return assertThis(expected == actual, message);
    }
    public ExpectString shouldNotEqual(String actual) {
        return shouldNotEqual(actual, expectedShouldNotBeMessage(actual));
    }
    public ExpectString shouldNotEqual(String actual, String message) {
        return assertThis(expected != actual, message);
    }
    public ExpectString shouldBeLessThan(String actual, string message) {
        return assertThis(expected < actual, message);
    }
    public ExpectString shouldBeLessThan(String actual) {
        return shouldBeLessThan(actual, expectedFormatMessage(SHOULD_BE_LESS_MESSAGE, actual));
    }
    public ExpectString shouldBeLessThanOrEqualTo(String actual, string message) {
        return assertThis(expected <= actual, message);
    }
    public ExpectString shouldBeLessThanOrEqualTo(String actual) {
        return shouldBeLessThanOrEqualTo(actual, expectedFormatMessage(SHOULD_BE_LESS_OR_EQUAL_MESSAGE, actual));
    }
    public ExpectString shouldBeGreaterThan(String actual, string message) {
        return assertThis(expected > actual, message);
    }
    public ExpectString shouldBeGreaterThan(String actual) {
        return shouldBeGreaterThan(actual, expectedFormatMessage(SHOULD_BE_GREATER_MESSAGE, actual));
    }
    public ExpectString shouldBeGreaterThanOrEqualTo(String actual, string message) {
        return assertThis(expected >= actual, message);
    }
    public ExpectString shouldBeGreaterThanOrEqualTo(String actual) {
        return shouldBeGreaterThanOrEqualTo(actual, expectedFormatMessage(SHOULD_BE_GREATER_OR_EQUAL_MESSAGE, actual));
    }
    public ExpectString shouldBeBetween(String rangeStart, String rangeEnd) {
        return shouldBeBetween(rangeStart, rangeEnd, expectedShouldBeBetweenMessage(rangeStart, rangeEnd));
    }
    public ExpectString shouldBeBetween(String rangeStart, String rangeEnd, string message) {
        Boolean testedBetween = (rangeStart < rangeEnd) ?
            rangeStart <= this.expected && this.expected <= rangeEnd :
            rangeEnd <= this.expected && this.expected <= rangeStart;

        return assertThis(testedBetween, message);
    }
    public ExpectString andIt { get { return (ExpectString) this; } }
}