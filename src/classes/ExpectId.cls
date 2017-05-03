public class ExpectId extends Expect {
    protected final Id expected;

    public ExpectId(Id expected) {
        this.expected = expected;
    }
    protected override String getExpectedAsString() {
        return String.valueOf(expected);
    }
    private ExpectId assertThis(Boolean test, String message) {
        Expect.assert(test, message);
        return this;
    }
    public ExpectId shouldEqual(Id actual) {
        return shouldEqual(actual, expectedShouldBeMessage(String.valueOf(actual)));
    }
    public ExpectId shouldEqual(Id actual, String message) {
        return assertThis(expected == actual, message);
    }
    public ExpectId shouldNotEqual(Id actual) {
        return shouldNotEqual(actual, expectedShouldNotBeMessage(String.valueOf(actual)));
    }
    public ExpectId shouldNotEqual(Id actual, String message) {
        return assertThis(expected != actual, message);
    }
    public ExpectId shouldBeLessThan(Id actual, string message) {
        return assertThis(expected < actual, message);
    }
    public ExpectId shouldBeLessThan(Id actual) {
        return shouldBeLessThan(actual, expectedFormatMessage(SHOULD_BE_LESS_MESSAGE, String.valueOf(actual)));
    }
    public ExpectId shouldBeLessThanOrEqualTo(Id actual, string message) {
        return assertThis(expected <= actual, message);
    }
    public ExpectId shouldBeLessThanOrEqualTo(Id actual) {
        return shouldBeLessThanOrEqualTo(actual, expectedFormatMessage(SHOULD_BE_LESS_OR_EQUAL_MESSAGE, String.valueOf(actual)));
    }
    public ExpectId shouldBeGreaterThan(Id actual, string message) {
        return assertThis(expected > actual, message);
    }
    public ExpectId shouldBeGreaterThan(Id actual) {
        return shouldBeGreaterThan(actual, expectedFormatMessage(SHOULD_BE_GREATER_MESSAGE, String.valueOf(actual)));
    }
    public ExpectId shouldBeGreaterThanOrEqualTo(Id actual, string message) {
        return assertThis(expected >= actual, message);
    }
    public ExpectId shouldBeGreaterThanOrEqualTo(Id actual) {
        return shouldBeGreaterThanOrEqualTo(actual, expectedFormatMessage(SHOULD_BE_GREATER_OR_EQUAL_MESSAGE, String.valueOf(actual)));
    }
    public ExpectId shouldBeBetween(Id rangeStart, Id rangeEnd) {
        return shouldBeBetween(rangeStart, rangeEnd, expectedShouldBeBetweenMessage(String.valueOf(rangeStart), String.valueOf(rangeEnd)));
    }
    public ExpectId shouldBeBetween(Id rangeStart, Id rangeEnd, string message) {
        Boolean testedBetween = (rangeStart < rangeEnd) ?
            rangeStart <= this.expected && this.expected <= rangeEnd :
            rangeEnd <= this.expected && this.expected <= rangeStart;

        return assertThis(testedBetween, message);
    }
    public ExpectId andIt { get { return this; } }
}