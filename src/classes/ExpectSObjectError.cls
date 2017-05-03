public class ExpectSObjectError extends Expect {
    private final SObject expected;

    public ExpectSObjectError(SObject o) {
        this.expected = o;
    }
    public ExpectSObjectError() {
        this.expected = null;
    }

    protected override String getExpectedAsString() {
        return null;
    }

    public void onInsert() {
        boolean hasError = false;
        try {
            insert expected;
        } catch(Exception ex) {;
            hasError = true;
        }
        assert(hasError, 'error expected');
    }
}