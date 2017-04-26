public class ExpectDatetime {
    //probably we can use this string for the other implementations as well?
    public static final String DATETIME_SHOULD_BE_MESSAGE = 'Expected {0} should{1} be {2}';
    public static final String DATETIME_SHOULD_BE_LESS_MESSAGE = 'Expected {0} should be less than {1}';
    public static final String DATETIME_SHOULD_BE_LESS_OR_EQUAL_MESSAGE = 'Expected {0} should be less than or equal to {1}';
    public static final String DATETIME_SHOULD_BE_GREATER_MESSAGE = 'Expected {0} should be greater than {1}';
    public static final String DATETIME_SHOULD_BE_GREATER_OR_EQUAL_MESSAGE = 'Expected {0} should be greater than or equal to {1}';
    public static final String DATETIME_BETWEEN_MESSAGE = 'Expected {0} should be between {1} and {2}';

    private final Datetime expected;

    public ExpectDatetime(Datetime expected) {
        this.expected = expected;
    }
    private ExpectDatetime assertThis(Boolean test, String message) {
        Expect.assert(test, message);
        return this;
    }
    public ExpectDatetime shouldEqual(Datetime actual) {
        return shouldEqual(actual, String.format(DATETIME_SHOULD_BE_MESSAGE, new String[]{
            String.valueOf(expected), '', String.valueOf(actual)}));
    }
    public ExpectDatetime shouldEqual(Datetime actual, String message) {
        return assertThis(expected == actual, message);
    }
    public ExpectDatetime shouldNotEqual(Datetime actual) {
        return shouldNotEqual(actual, String.format(DATETIME_SHOULD_BE_MESSAGE, new String[]{
            String.valueOf(expected), ' not', String.valueOf(actual)}));
    }
    public ExpectDatetime shouldNotEqual(Datetime actual, String message) {
        return assertThis(expected != actual, message);
    }
    public ExpectDatetime shouldBeLessThan(Datetime actual, string message) {
        return assertThis(expected < actual, message);
    }
    public ExpectDatetime shouldBeLessThan(Datetime actual) {
        return shouldBeLessThan(actual, String.format(DATETIME_SHOULD_BE_LESS_MESSAGE, new String[]{
            String.valueOf(expected),
            String.valueOf(actual)
        }));
    }
    public ExpectDatetime shouldBeLessThanOrEqualTo(Datetime actual, string message) {
        return assertThis(expected <= actual, message);
    }
    public ExpectDatetime shouldBeLessThanOrEqualTo(Datetime actual) {
        return shouldBeLessThanOrEqualTo(actual, String.format(DATETIME_SHOULD_BE_LESS_OR_EQUAL_MESSAGE, new String[]{
            String.valueOf(expected),
            String.valueOf(actual)
        }));
    }
    public ExpectDatetime shouldBeGreaterThan(Datetime actual, string message) {
        return assertThis(expected > actual, message);
    }
    public ExpectDatetime shouldBeGreaterThan(Datetime actual) {
        return shouldBeGreaterThan(actual, String.format(DATETIME_SHOULD_BE_GREATER_MESSAGE, new String[]{
            String.valueOf(expected),
            String.valueOf(actual)
        }));
    }
    public ExpectDatetime shouldBeGreaterThanOrEqualTo(Datetime actual, string message) {
        return assertThis(expected >= actual, message);
    }
    public ExpectDatetime shouldBeGreaterThanOrEqualTo(Datetime actual) {
        return shouldBeGreaterThanOrEqualTo(actual, String.format(DATETIME_SHOULD_BE_GREATER_OR_EQUAL_MESSAGE, new String[]{
            String.valueOf(expected),
            String.valueOf(actual)
        }));
    }
    public ExpectDatetime shouldBeBetween(Datetime rangeStart, Datetime rangeEnd) {
        return shouldBeBetween(rangeStart, rangeEnd,
            String.format(DATETIME_BETWEEN_MESSAGE, new String[]{
                String.valueOf(expected),
                String.valueOf(rangeStart),
                String.valueOf(rangeEnd)
            }));
    }
    public ExpectDatetime shouldBeBetween(Datetime rangeStart, Datetime rangeEnd, string message) {
        Boolean testedBetween = (rangeStart < rangeEnd) ?
            rangeStart <= this.expected && this.expected <= rangeEnd :
            rangeEnd <= this.expected && this.expected <= rangeStart;

        return assertThis(testedBetween, message);
    }
    public ExpectDatetime andIt { get { return this; } }
}