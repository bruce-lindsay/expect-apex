public class ExpectBoolean extends Expect {
    private final Boolean expected;

    public ExpectBoolean(Boolean expected) {
        this.expected = expected;
    }

    protected override String getExpectedAsString() {
        return String.valueOf(expected);
    }

    public ExpectBoolean andThat { get { return this; } }

    public ExpectBoolean shouldBeFalse() {
        shouldBeFalse(SHOULD_BE_FALSE_MESSAGE);
        return this;
    }
    public ExpectBoolean shouldBeFalse(String message) {
        Expect.assert(expected == false, message);
        return this;
    }
    public ExpectBoolean shouldBeTrue() {
        shouldBeTrue(SHOULD_BE_TRUE_MESSAGE);
        return this;
    }
    public ExpectBoolean shouldBeTrue(String message) {
        Expect.assert(expected, message);
        return this;
    }
    public ExpectBoolean shouldEqual(Boolean actual) {
        shouldEqual(actual, 'Expected ' + (expected ? 'true' : 'false')
        + ' should equal ' + (actual ? 'true' : 'false'));
        return this;
    }
    public ExpectBoolean shouldEqual(Boolean actual, String message) {
        Expect.assert(expected == actual, message);
        return this;
    }
}