public class ExpectBoolean {
    private final Boolean expected;
    public static final String BOOLEAN_SHOULD_BE_FALSE_MESSAGE = 'Expected true should be false';
    public static final String BOOLEAN_SHOULD_BE_TRUE_MESSAGE = 'Expected false should be true';

    public ExpectBoolean(Boolean expected) {
        this.expected = expected;
    }
    public void shouldBeFalse() {
        shouldBeFalse(BOOLEAN_SHOULD_BE_FALSE_MESSAGE);
    }
    public void shouldBeFalse(String message) {
        Expect.assert(expected == false, message);
    }
    public void shouldBeTrue() {
        shouldBeTrue(BOOLEAN_SHOULD_BE_TRUE_MESSAGE);
    }
    public void shouldBeTrue(String message) {
        Expect.assert(expected, message);
    }
    public void shouldEqual(Boolean actual) {
        shouldEqual(actual, 'Expected ' + (expected ? 'true' : 'false')
        + ' should equal ' + (actual ? 'true' : 'false'));
    }
    public void shouldEqual(Boolean actual, String message) {
        Expect.assert(expected == actual, message);
    }
}