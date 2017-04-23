public class ExpectBoolean extends Expect {
    private final Boolean expected;
    public static final String BOOLEAN_SHOULD_BE_FALSE_MESSAGE = 'Expected true should be false';
    public static final String BOOLEAN_SHOULD_BE_TRUE_MESSAGE = 'Expected false should be true';

    public ExpectBoolean(Boolean expected) {
        this.expected = expected;
    }
    public ExpectBoolean andThat { get { return this; } }

    public ExpectBoolean shouldBeFalse() {
        shouldBeFalse(BOOLEAN_SHOULD_BE_FALSE_MESSAGE);
        return this;
    }
    public ExpectBoolean shouldBeFalse(String message) {
        Expect.assert(expected == false, message);
        return this;
    }
    public ExpectBoolean shouldBeTrue() {
        shouldBeTrue(BOOLEAN_SHOULD_BE_TRUE_MESSAGE);
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