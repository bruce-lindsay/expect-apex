public class Expect {
    public static Boolean UseSystemAssert = true;

    public class AssertException extends System.Exception {}

    private static void assert(Boolean expected, String message) {
        if(UseSystemAssert) {
            System.assert(expected, message);
        } else {
            if(!expected) {
                throw new Expect.AssertException(message);
            }
        }
    }

    public static final String BOOLEAN_SHOULD_BE_FALSE_MESSAGE = 'Expected true should be false';
    public static final String BOOLEAN_SHOULD_BE_TRUE_MESSAGE = 'Expected false should be true';
    public class ExpectBoolean {
        private final Boolean expected;

        private ExpectBoolean(Boolean expected) {
            this.expected = expected;
        }
        public void shouldBeFalse() {
            shouldBeFalse(BOOLEAN_SHOULD_BE_FALSE_MESSAGE);
        }
        public void shouldBeFalse(String message) {
            assert(expected == false, message);
        }
        public void shouldBeTrue() {
            shouldBeTrue(BOOLEAN_SHOULD_BE_TRUE_MESSAGE);
        }
        public void shouldBeTrue(String message) {
            assert(expected, message);
        }
        public void shouldEqual(Boolean actual) {
            shouldEqual(actual, 'Expected ' + (expected ? 'true' : 'false')
            + ' should equal ' + (actual ? 'true' : 'false'));
        }
        public void shouldEqual(Boolean actual, String message) {
            assert(expected == actual, message);
        }
    }

    //probably we can use this string for the other implementations as well?
    public static final String INTEGER_SHOULD_BE_MESSAGE = 'Expected {0} should{1} be {2}';
    public static final String INTEGER_SHOULD_BE_LESS_MESSAGE = 'Expected {0} should be less than {1}';
    public static final String INTEGER_SHOULD_BE_GREATER_MESSAGE = 'Expected {0} should be greater than {1}';
    public class ExpectInteger {
        private final Integer expected;

        private ExpectInteger(Integer expected) {
            this.expected = expected;
        }
        public void shouldEqual(Integer actual) {
            shouldEqual(actual, String.format(INTEGER_SHOULD_BE_MESSAGE, new String[]{
                String.valueOf(expected), '', String.valueOf(actual)}));
        }
        public void shouldEqual(Integer actual, String message) {
            assert(expected == actual, message);
        }
        public void shouldNotEqual(Integer actual) {
            shouldNotEqual(actual, String.format(INTEGER_SHOULD_BE_MESSAGE, new String[]{
                String.valueOf(expected), ' not', String.valueOf(actual)}));
        }
        public void shouldNotEqual(Integer actual, String message) {
            assert(expected != actual, message);
        }
        public void shouldBeLessThan(Integer actual, string message) {
            assert(expected < actual, message);
        }
        public void shouldBeLessThan(Integer actual) {
            shouldBeLessThan(actual, String.format(INTEGER_SHOULD_BE_LESS_MESSAGE, new String[]{
                String.valueOf(expected),
                String.valueOf(actual)
            }));
        }
        public void shouldBeGreaterThan(Integer actual, string message) {
            assert(expected > actual, message);
        }
        public void shouldBeGreaterThan(Integer actual) {
            shouldBeGreaterThan(actual, String.format(INTEGER_SHOULD_BE_GREATER_MESSAGE, new String[]{
                String.valueOf(expected),
                String.valueOf(actual)
            }));
        }
    }

    public static ExpectBoolean that(Boolean expected) {
        return new ExpectBoolean(expected);
    }
    public static ExpectInteger that(Integer expected) {
        return new ExpectInteger(expected);
    }
}