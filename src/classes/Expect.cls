public class Expect {
    public static Boolean UseSystemAssert = true;
    public static final String SHOULD_BE_MESSAGE = 'Expected {0} should{1} be {2}';
    public static final String BOOLEAN_SHOULD_BE_FALSE_MESSAGE = 'Expected true should be false';
    public static final String BOOLEAN_SHOULD_BE_TRUE_MESSAGE = 'Expected false should be true';
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

    public static String formatMessage(List<String> expectedDelimiterActuals) {
        return String.format(SHOULD_BE_MESSAGE, expectedDelimiterActuals);
    }

    private static String[] shouldBe (Object expected, Object actual) {
        return new List<String>{String.valueOf(expected), '', String.valueOf(actual)};
    }

    private static String[] shouldNotBe(Object expected, Object actual) {
        return new List<String>{String.valueOf(expected), ' not', String.valueOf(actual)};
    }

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

    public class ExpectInteger {
        private final Integer expected;

        private ExpectInteger(Integer expected) {
            this.expected = expected;
        }
        public void shouldEqual(Integer actual) {
            shouldEqual(actual, formatMessage(shouldBe(expected, actual)));
        }
        public void shouldEqual(Integer actual, String message) {
            assert(expected == actual, message);
        }
        public void shouldNotEqual(Integer actual) {
            shouldNotEqual(actual, formatMessage(shouldNotBe(expected, actual)));
        }
        public void shouldNotEqual(Integer actual, String message) {
            assert(expected != actual, message);
        }
    }

    public class ExpectObject {
        private final Object expected;

        private ExpectObject(Object expected) {
            this.expected = expected;
        }

        public void shouldEqual(Object actual) {
            shouldEqual(actual, formatMessage(shouldBe(expected, actual)));
        }

        public void shouldEqual(Object actual, String message) {
            assert(expected == actual, message);
        }

        public void shouldNotEqual(Object actual) {
            shouldNotEqual(actual, formatMessage(shouldNotBe(expected, actual)));
        }

        public void shouldNotEqual(Object actual, String message) {
            assert(expected != actual, message);
        }
    }

    public static ExpectBoolean that(Boolean expected) {
        return new ExpectBoolean(expected);
    }
    public static ExpectInteger that(Integer expected) {
        return new ExpectInteger(expected);
    }

    public static ExpectObject that(Object expected) {
        return new ExpectObject(expected);
    }
}