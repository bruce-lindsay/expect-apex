public class ExpectBoolean extends Expect {
    private final Boolean expected;
    public ExpectBoolean(Boolean expected) {
        this.expected = expected;
    }

    protected override String getExpectedAsString() {
        return String.valueOf(expected);
    }

    public ExpectBoolean andIt { get { return this; } }

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
        return shouldEqual(actual, expectedShouldBeMessage(actual));
    }

    public ExpectBoolean shouldEqual(Boolean actual, String message) {
        Expect.assert(expected == actual, message);
        return this;
    }
}