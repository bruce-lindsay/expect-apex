public class ExpectSObject extends Expect {
    private final SObject expected;

    public ExpectSObject(SObject expected) {
        this.expected = expected;
    }

    protected override String getExpectedAsString() {
        return String.valueOf(expected);
    }

    public ExpectSObject andIt { get { return this; } }

    public ExpectSObject shouldEqual(SObject actual) {
        shouldEqual(actual, expectedShouldBeMessage(actual));
        return this;
    }

    public ExpectSObject shouldEqual(SObject actual, String message) {
        return assertSObject(expected === actual, message);
    }

    public ExpectSObject shouldNotEqual(SObject actual) {
        return shouldNotEqual(actual, expectedShouldNotBeMessage(actual));
    }

    public ExpectSObject shouldNotEqual(SObject actual, String message) {
        return assertSObject(expected !== actual, message);
    }

    public ExpectSObject sObjectTypeEquals(SObject actual) {
        return sObjectTypeEquals(actual.getSObjectType());
    }

    public ExpectSObject sObjectTypeEquals(SObject actual, String message) {
        return sObjectTypeEquals(actual.getSObjectType(), message);
    }

    public ExpectSObject sObjectTypeEquals(SObjectType objType) {
        return sObjectTypeEquals(objType, expectedShouldBeMessage(objType));
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