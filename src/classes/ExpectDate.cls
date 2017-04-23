public class ExpectDate {
    //probably we can use this string for the other implementations as well?
    public static final String DATE_SHOULD_BE_MESSAGE = 'Expected {0} should{1} be {2}';
    public static final String DATE_SHOULD_BE_LESS_MESSAGE = 'Expected {0} should be less than {1}';
    public static final String DATE_SHOULD_BE_LESS_OR_EQUAL_MESSAGE = 'Expected {0} should be less than or equal to {1}';
    public static final String DATE_SHOULD_BE_GREATER_MESSAGE = 'Expected {0} should be greater than {1}';
    public static final String DATE_SHOULD_BE_GREATER_OR_EQUAL_MESSAGE = 'Expected {0} should be greater than or equal to {1}';
    public static final String DATE_BETWEEN_MESSAGE = 'Expected {0} should be between {1} and {2}';

    private final Date expected;

    public ExpectDate(Date expected) {
        this.expected = expected;
    }
    private ExpectDate assertThis(Boolean test, String message) {
        Expect.assert(test, message);
        return this;
    }
    public ExpectDate shouldEqual(Date actual) {
        return shouldEqual(actual, String.format(DATE_SHOULD_BE_MESSAGE, new String[]{
            String.valueOf(expected), '', String.valueOf(actual)}));
    }
    public ExpectDate shouldEqual(Date actual, String message) {
        return assertThis(expected == actual, message);
    }
    public ExpectDate shouldNotEqual(Date actual) {
        return shouldNotEqual(actual, String.format(DATE_SHOULD_BE_MESSAGE, new String[]{
            String.valueOf(expected), ' not', String.valueOf(actual)}));
    }
    public ExpectDate shouldNotEqual(Date actual, String message) {
        return assertThis(expected != actual, message);
    }
    public ExpectDate shouldBeLessThan(Date actual, string message) {
        return assertThis(expected < actual, message);
    }
    public ExpectDate shouldBeLessThan(Date actual) {
        return shouldBeLessThan(actual, String.format(DATE_SHOULD_BE_LESS_MESSAGE, new String[]{
            String.valueOf(expected),
            String.valueOf(actual)
        }));
    }
    public ExpectDate shouldBeLessThanOrEqualTo(Date actual, string message) {
        return assertThis(expected <= actual, message);
    }
    public ExpectDate shouldBeLessThanOrEqualTo(Date actual) {
        return shouldBeLessThanOrEqualTo(actual, String.format(DATE_SHOULD_BE_LESS_OR_EQUAL_MESSAGE, new String[]{
            String.valueOf(expected),
            String.valueOf(actual)
        }));
    }
    public ExpectDate shouldBeGreaterThan(Date actual, string message) {
        return assertThis(expected > actual, message);
    }
    public ExpectDate shouldBeGreaterThan(Date actual) {
        return shouldBeGreaterThan(actual, String.format(DATE_SHOULD_BE_GREATER_MESSAGE, new String[]{
            String.valueOf(expected),
            String.valueOf(actual)
        }));
    }
    public ExpectDate shouldBeGreaterThanOrEqualTo(Date actual, string message) {
        return assertThis(expected >= actual, message);
    }
    public ExpectDate shouldBeGreaterThanOrEqualTo(Date actual) {
        return shouldBeGreaterThanOrEqualTo(actual, String.format(DATE_SHOULD_BE_GREATER_OR_EQUAL_MESSAGE, new String[]{
            String.valueOf(expected),
            String.valueOf(actual)
        }));
    }
    public ExpectDate shouldBeBetween(Date rangeStart, Date rangeEnd) {
        return shouldBeBetween(rangeStart, rangeEnd,
            String.format(DATE_BETWEEN_MESSAGE, new String[]{
                String.valueOf(expected),
                String.valueOf(rangeStart),
                String.valueOf(rangeEnd)
            }));
    }
    public ExpectDate shouldBeBetween(Date rangeStart, Date rangeEnd, string message) {
        Boolean testedBetween = (rangeStart < rangeEnd) ?
            rangeStart <= this.expected && this.expected <= rangeEnd :
            rangeEnd <= this.expected && this.expected <= rangeStart;

        return assertThis(testedBetween, message);
    }
    public ExpectDate andIt { get { return this; } }
}