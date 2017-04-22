public class Expect {
    public static Boolean UseSystemAssert = true;
    public static final String SHOULD_BE_MESSAGE = 'Expected {0} should{1} be {2}';
    public static final String BOOLEAN_SHOULD_BE_FALSE_MESSAGE = 'Expected true should be false';
    public static final String BOOLEAN_SHOULD_BE_TRUE_MESSAGE = 'Expected false should be true';
    public static final String SHOULD_BE_COMPARISON = 'Expected {0} should be {1} than {2}';
    public static final String SHOULD_CONTAIN = 'Expected {0} should{1} contain {2}';
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

    private static String formatMessage(String[] expectedDelimiterActuals) {
        return String.format(SHOULD_BE_MESSAGE, expectedDelimiterActuals);
    }

    private static String formatComparisonMessage(String[] expectedDelimiterActuals) {
        return String.format(SHOULD_BE_COMPARISON, expectedDelimiterActuals);
    }

    private static String formatContainMessage(String[] expectedDelimiterActuals) {
        return String.format(SHOULD_CONTAIN, expectedDelimiterActuals);
    }

    private static String[] shouldBe(Object expected, Object actual) {
        return shouldBe(expected, '', actual);
    }

    private static String[] shouldBe(Object expected, String delimiter, Object actual) {
        return new List<String>{String.valueOf(expected), delimiter, String.valueOf(actual)};
    }

    private static String[] shouldNotBe(Object expected, Object actual) {
        return shouldNotBe(expected,' not', actual);
    }

    private static String[] shouldNotBe(Object expected, String delimiter, Object actual) {
        return new List<String>{String.valueOf(expected), delimiter, String.valueOf(actual)};
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

        public void shouldBeGreaterThan(Object actual) {
            shouldBeGreaterThan(actual, formatComparisonMessage(shouldNotBe(expected, '>', actual)));
        }

        public void shouldBeGreaterThan(Object actual, String message) {
            assert(JSON.serialize(expected).hashCode() > JSON.serialize(actual).hashCode(), message);
        }

        public void shouldBeGreaterThanOrEqual(Object actual) {
            shouldBeGreaterThanOrEqual(actual, formatComparisonMessage(shouldNotBe(expected, '>=', actual)));
        }

        public void shouldBeGreaterThanOrEqual(Object actual, String message) {
            assert(JSON.serialize(expected).hashCode() >= JSON.serialize(actual).hashCode(), message);
        }

        public void shouldBeLessThan(Object actual) {
            shouldBeLessThan(actual, formatComparisonMessage(shouldNotBe(expected, '<', actual)));
        }

        public void shouldBeLessThan(Object actual, String message) {
            assert(JSON.serialize(expected).hashCode() < JSON.serialize(actual).hashCode(), message);
        }

        public void shouldBeLessThanOrEqual(Object actual) {
            shouldBeLessThanOrEqual(actual, formatComparisonMessage(shouldNotBe(expected, '<=', actual)));
        }

        public void shouldBeLessThanOrEqual(Object actual, String message) {
            assert(JSON.serialize(expected).hashCode() <= JSON.serialize(actual).hashCode(), message);
        }

        public void shouldBeFalse() {
            shouldBeFalse(BOOLEAN_SHOULD_BE_FALSE_MESSAGE);
        }

        public void shouldBeFalse(String message) {
            assert(expected != true, message);
        }

        public void shouldBeTrue() {
            shouldBeTrue(BOOLEAN_SHOULD_BE_TRUE_MESSAGE);
        }

        public void shouldBeTrue(String message) {
            assert(expected == true, message);
        }

        public void shouldContain(Object actual) {
            shouldContain(actual,formatContainMessage(shouldBe(expected, actual)));
        }

        public void shouldContain(Object actual, String message) {
            assert(JSON.serialize(expected).containsIgnoreCase(JSON.serialize(actual)), message);
        }

        public void shouldNotContain(Object actual) {
            shouldNotContain(actual, formatContainMessage(shouldNotBe(expected, actual)));
        }

        public void shouldNotContain(Object actual, String message) {
            assert(!JSON.serialize(expected).containsIgnoreCase(JSON.serialize(actual)), message);
        }
    }

    public class ExpectString {
        private final String expected;

        private ExpectString(String expected) {
            this.expected = expected;
        }

        public void shouldEqual(String actual) {
            shouldEqual(actual, formatMessage(shouldBe(expected, actual)));
        }

        public void shouldEqual(String actual, String message) {
            assert(expected.equals(actual), message);
        }

        public void shouldEqualIgnoreOrdinalCase(String actual) {
            shouldEqualIgnoreOrdinalCase(actual, formatMessage(shouldBe(expected, actual)));
        }

        public void shouldEqualIgnoreOrdinalCase(String actual, String message) {
            assert(expected.toLowerCase().equals(actual.toLowerCase()), message);
        }

        public void shouldNotEqual(String actual) {
            shouldNotEqual(actual, formatMessage(shouldNotBe(expected,'not ', actual)));
        }

        public void shouldNotEqual(String actual, String message) {
            assert(!expected.equals(actual), message);
        }

        public void shouldBeGreaterThan(String actual) {
            shouldBeGreaterThan(actual, formatComparisonMessage(shouldNotBe(expected, '>', actual)));
        }

        public void shouldBeGreaterThan(String actual, String message) {
            assert(expected > actual, message);
        }

        public void shouldBeGreaterThanOrEqual(String actual) {
            shouldBeGreaterThanOrEqual(actual, formatComparisonMessage(shouldNotBe(expected, '>=', actual)));
        }

        public void shouldBeGreaterThanOrEqual(String actual, String message) {
            assert(expected >= actual, message);
        }

        public void shouldBeLessThan(String actual) {
            shouldBeLessThan(actual, formatComparisonMessage(shouldNotBe(expected, '<', actual)));
        }

        public void shouldBeLessThan(String actual, String message) {
            assert(expected < actual, message);
        }

        public void shouldBeLessThanOrEqual(String actual) {
            shouldBeLessThanOrEqual(actual, formatComparisonMessage(shouldNotBe(expected, '<=', actual)));
        }

        public void shouldBeLessThanOrEqual(String actual, String message) {
            assert(expected <= actual, message);
        }
    }

    public static ExpectObject that(Object expected) {
        return new ExpectObject(expected);
    }

    public static ExpectString that(String expected) {
        return new ExpectString(expected);
    }
}