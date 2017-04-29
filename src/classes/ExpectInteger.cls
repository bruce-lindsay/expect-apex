public class ExpectInteger extends Expect {
    protected final Integer expected;

    public ExpectInteger(Integer expected) {
        this.expected = expected;
    }
    protected override String getExpectedAsString() {
        return String.valueOf(expected);
    }
    private ExpectInteger assertThis(Boolean test, String message) {
        Expect.assert(test, message);
        return this;
    }
    public ExpectInteger shouldEqual(Integer actual) {
        return shouldEqual(actual, expectedShouldBeMessage(String.valueOf(actual)));
    }
    public ExpectInteger shouldEqual(Integer actual, String message) {
        return assertThis(expected == actual, message);
    }
    public ExpectInteger shouldNotEqual(Integer actual) {
        return shouldNotEqual(actual, expectedShouldNotBeMessage(String.valueOf(actual)));
    }
    public ExpectInteger shouldNotEqual(Integer actual, String message) {
        return assertThis(expected != actual, message);
    }
    public ExpectInteger shouldBeLessThan(Integer actual, string message) {
        return assertThis(expected < actual, message);
    }
    public ExpectInteger shouldBeLessThan(Integer actual) {
        return shouldBeLessThan(actual, expectedFormatMessage(SHOULD_BE_LESS_MESSAGE, String.valueOf(actual)));
    }
    public ExpectInteger shouldBeLessThanOrEqualTo(Integer actual, string message) {
        return assertThis(expected <= actual, message);
    }
    public ExpectInteger shouldBeLessThanOrEqualTo(Integer actual) {
        return shouldBeLessThanOrEqualTo(actual, expectedFormatMessage(SHOULD_BE_LESS_OR_EQUAL_MESSAGE, String.valueOf(actual)));
    }
    public ExpectInteger shouldBeGreaterThan(Integer actual, string message) {
        return assertThis(expected > actual, message);
    }
    public ExpectInteger shouldBeGreaterThan(Integer actual) {
        return shouldBeGreaterThan(actual, expectedFormatMessage(SHOULD_BE_GREATER_MESSAGE, String.valueOf(actual)));
    }
    public ExpectInteger shouldBeGreaterThanOrEqualTo(Integer actual, string message) {
        return assertThis(expected >= actual, message);
    }
    public ExpectInteger shouldBeGreaterThanOrEqualTo(Integer actual) {
        return shouldBeGreaterThanOrEqualTo(actual, expectedFormatMessage(SHOULD_BE_GREATER_OR_EQUAL_MESSAGE, String.valueOf(actual)));
    }
    public ExpectInteger shouldBeBetween(Integer rangeStart, Integer rangeEnd) {
        return shouldBeBetween(rangeStart, rangeEnd, expectedShouldBeBetweenMessage(String.valueOf(rangeStart), String.valueOf(rangeEnd)));
    }
    public ExpectInteger shouldBeBetween(Integer rangeStart, Integer rangeEnd, string message) {
        Boolean testedBetween = (rangeStart < rangeEnd) ?
            rangeStart <= this.expected && this.expected <= rangeEnd :
            rangeEnd <= this.expected && this.expected <= rangeStart;

        return assertThis(testedBetween, message);
    }
    public ExpectInteger andIt { get { return this; } }
}