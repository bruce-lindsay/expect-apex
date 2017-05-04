public class ExpectSObjectType extends Expect {
    protected final SObjectType expected;
    public static final String SHOULD_BE_MESSAGE = 'Expected {0} {1} have records';
    public ExpectSObjectType(SObjectType expected) {
        this.expected = expected;
    }
    protected override String getExpectedAsString() {
        return String.valueOf(expected);
    }
    private Boolean isRecord() {
        SObject[] records = Database.query('select Id from ' + expected.getDescribe().getName() + ' LIMIT 1');
        return records.size() > 0;
    }
    public ExpectSObjectType shouldNotHaveRecords() {
        shouldNotHaveRecords(expectedFormatNotMessage(SHOULD_BE_MESSAGE, null));
        return this;
    }
    public ExpectSObjectType shouldNotHaveRecords(String message) {
        assert(isRecord() == false, message);
        return this;
    }
    public ExpectSObjectType shouldHaveRecords() {
        shouldHaveRecords(expectedFormatMessage(SHOULD_BE_MESSAGE, null));
        return this;
    }
    public ExpectSObjectType shouldHaveRecords(String message) {
        assert(isRecord(), message);
        return this;
    }
    public ExpectSObjectType andIt { get { return this; } }
}