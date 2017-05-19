public class ExpectSObjectType extends Expect {
    protected final SObjectType expected;
    public static final String SHOULD_HAVE_RECORDS = 'Expected {0} {1} have records';
    public ExpectSObjectType(SObjectType expected) {
        this.expected = expected;
    }
    private ExpectSObjectType(ExpectSObjectType existingInstance) {
        super(NegatedAssert, existingInstance);
        this.expected = existingInstance.expected;
    }
    protected override String getExpectedAsString() {
        return String.valueOf(expected);
    }
    private Boolean isRecord() {
        SObject[] records = Database.query('select Id from ' + expected.getDescribe().getName() + ' LIMIT 1');
        return records.size() > 0;
    }
    public ExpectSObjectType shouldHaveRecords() {
        shouldHaveRecords(formatMessage(SHOULD_HAVE_RECORDS, null));
        return (ExpectSObjectType) parentInstance;
    }
    public ExpectSObjectType shouldHaveRecords(String message) {
        assertNegatable(isRecord(), message);
        return (ExpectSObjectType) parentInstance;
    }
    public ExpectSObjectType andIt { get { return (ExpectSObjectType) parentInstance; } }
    public ExpectSObjectType negated { get { return new ExpectSObjectType(this); }}
}