public class ExpectSObject extends Expect {
    private final SObject expected;

    public ExpectSObject(SObject expected) {
        this.expected = expected;

    }
    private ExpectSObject(ExpectSObject existingInstance) {
        super(NegatedAssert, existingInstance);
        this.expected = existingInstance.expected;
    }

    protected override String getExpectedAsString() {
        return String.valueOf(expected);
    }

    public ExpectSObject andIt { get { return (ExpectSObject) parentInstance; } }

    public ExpectSObject negated {
        get {
            return new ExpectSObject(this);
        }
    }

    public ExpectSObject shouldEqual(SObject actual) {
        shouldEqual(actual, formatMessage(SHOULD_BE_MESSAGE, actual));
        return this;
    }

    public ExpectSObject shouldEqual(SObject actual, String message) {
        return assertSObject(expected === actual, message);
    }

    public ExpectSObject sObjectTypeEquals(SObject actual) {
        return sObjectTypeEquals(actual.getSObjectType());
    }

    public ExpectSObject sObjectTypeEquals(SObject actual, String message) {
        return sObjectTypeEquals(actual.getSObjectType(), message);
    }

    public ExpectSObject sObjectTypeEquals(SObjectType objType) {
        return sObjectTypeEquals(objType, formatMessage(SHOULD_BE_MESSAGE, objType));
    }

    public ExpectSObject sObjectTypeEquals(SObjectType objType, String message) {
        return assertSObject(expected.getSObjectType() == objType, message);
    }

    private ExpectSObject assertSObject(Boolean test, String message) {
        assertNegatable(test, message);
        return this;
    }

    private ExpectError failDmlExpectation(string dmlOperationName) {
        assertNegatable(false, 'Expected ' + String.valueOf(expected) + ' should error on ' + dmlOperationName);
        return null;
    }

    public ExpectError shouldHaveInsertError() {
        try {
            insert expected;
        } catch(Exception ex) {
            return new ExpectError(ex);
        }
        return failDmlExpectation('insert');
    }

    public ExpectError shouldHaveUpdateError() {
        try {
            update expected;
        } catch(Exception ex) {
            return new ExpectError(ex);
        }
        return failDmlExpectation('update');
    }

    public ExpectError shouldHaveUpsertError() {
        try {
            upsert expected;
        } catch(Exception ex) {
            return new ExpectError(ex);
        }
        return failDmlExpectation('upsert');
    }

    public ExpectError shouldHaveDeleteError() {
        try {
            delete expected;
        } catch(Exception ex) {
            return new ExpectError(ex);
        }
        return failDmlExpectation('delete');
    }
}