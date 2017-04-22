public class ExpectInteger {
    //probably we can use this string for the other implementations as well?
    public static final String INTEGER_SHOULD_BE_MESSAGE = 'Expected {0} should{1} be {2}';
    public static final String INTEGER_SHOULD_BE_LESS_MESSAGE = 'Expected {0} should be less than {1}';
    public static final String INTEGER_SHOULD_BE_LESS_OR_EQUAL_MESSAGE = 'Expected {0} should be less than or equal to {1}';
    public static final String INTEGER_SHOULD_BE_GREATER_MESSAGE = 'Expected {0} should be greater than {1}';
    public static final String INTEGER_SHOULD_BE_GREATER_OR_EQUAL_MESSAGE = 'Expected {0} should be greater than or equal to {1}';
    public static final String INTEGER_BETWEEN_MESSAGE = 'Expected {0} should be between {1} and {2}';

    private final Integer expected;

    public ExpectInteger(Integer expected) {
        this.expected = expected;
    }
    private ExpectInteger assertThis(Boolean test, String message) {
        Expect.assert(test, message);
        return this;
    }
    public ExpectInteger shouldEqual(Integer actual) {
        return shouldEqual(actual, String.format(INTEGER_SHOULD_BE_MESSAGE, new String[]{
            String.valueOf(expected), '', String.valueOf(actual)}));
    }
    public ExpectInteger shouldEqual(Integer actual, String message) {
        return assertThis(expected == actual, message);
    }
    public ExpectInteger shouldNotEqual(Integer actual) {
        return shouldNotEqual(actual, String.format(INTEGER_SHOULD_BE_MESSAGE, new String[]{
            String.valueOf(expected), ' not', String.valueOf(actual)}));
    }
    public ExpectInteger shouldNotEqual(Integer actual, String message) {
        return assertThis(expected != actual, message);
    }
    public ExpectInteger shouldBeLessThan(Integer actual, string message) {
        return assertThis(expected < actual, message);
    }
    public ExpectInteger shouldBeLessThan(Integer actual) {
        return shouldBeLessThan(actual, String.format(INTEGER_SHOULD_BE_LESS_MESSAGE, new String[]{
            String.valueOf(expected),
            String.valueOf(actual)
        }));
    }
    public ExpectInteger shouldBeLessThanOrEqualTo(Integer actual, string message) {
        return assertThis(expected <= actual, message);
    }
    public ExpectInteger shouldBeLessThanOrEqualTo(Integer actual) {
        return shouldBeLessThanOrEqualTo(actual, String.format(INTEGER_SHOULD_BE_LESS_OR_EQUAL_MESSAGE, new String[]{
            String.valueOf(expected),
            String.valueOf(actual)
        }));
    }
    public ExpectInteger shouldBeGreaterThan(Integer actual, string message) {
        return assertThis(expected > actual, message);
    }
    public ExpectInteger shouldBeGreaterThan(Integer actual) {
        return shouldBeGreaterThan(actual, String.format(INTEGER_SHOULD_BE_GREATER_MESSAGE, new String[]{
            String.valueOf(expected),
            String.valueOf(actual)
        }));
    }
    public ExpectInteger shouldBeGreaterThanOrEqualTo(Integer actual, string message) {
        return assertThis(expected >= actual, message);
    }
    public ExpectInteger shouldBeGreaterThanOrEqualTo(Integer actual) {
        return shouldBeGreaterThanOrEqualTo(actual, String.format(INTEGER_SHOULD_BE_GREATER_OR_EQUAL_MESSAGE, new String[]{
            String.valueOf(expected),
            String.valueOf(actual)
        }));
    }
    public ExpectInteger shouldBeBetween(Integer rangeStart, Integer rangeEnd) {
        return shouldBeBetween(rangeStart, rangeEnd,
            String.format(INTEGER_BETWEEN_MESSAGE, new String[]{
                String.valueOf(expected),
                String.valueOf(rangeStart),
                String.valueOf(rangeEnd)
            }));
    }
    public ExpectInteger shouldBeBetween(Integer rangeStart, Integer rangeEnd, string message) {
        Boolean testedBetween = (rangeStart < rangeEnd) ?
            rangeStart <= this.expected && this.expected <= rangeEnd :
            rangeEnd <= this.expected && this.expected <= rangeStart;

        return assertThis(testedBetween, message);
    }
    public ExpectInteger andIt { get { return this; } }
}