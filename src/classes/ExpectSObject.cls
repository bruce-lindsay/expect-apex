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
        shouldEqual(actual, expectedMessage(actual,''));
        return this;
    }

    public ExpectSObject shouldEqual(SObject actual, String message) {
        return assertSObject(expected === actual, message);
    }

    public ExpectSObject shouldNotEqual(SObject actual) {
        return shouldNotEqual(actual, expectedMessage(actual,' not'));
    }

    public ExpectSObject shouldNotEqual(SObject actual, String message) {
        return assertSObject(expected !== actual, message);
    }

    public ExpectSObject sObjectTypeEquals(SObject actual) {
        return sObjectTypeEquals(actual, expectedMessage(actual.getSObjectType(),''));
    }

    public ExpectSObject sObjectTypeEquals(SObject actual, String message) {
        return sObjectTypeEquals(actual.getSObjectType(), message);
    }

    public ExpectSObject sObjectTypeEquals(SObjectType objType) {
        return sObjectTypeEquals(objType, expectedMessage(objType,''));
    }

    public ExpectSObject sObjectTypeEquals(SObjectType objType, String message) {
        return assertSObject(expected.getSObjectType() == objType, message);
    }

    public ExpectSObject shouldFailToUpsert() {
        return shouldFailToUpsertWithMessage('Upsert failed');
    }

    public ExpectSObject shouldFailToUpsertWithMessage(String message) {
        try {
            upsert this.expected;
            throw new Expect.AssertException('Should have failed to upsert but didn\'t');
        } catch (Exception ex) {
            Boolean isIntendedException = !(ex instanceof Expect.AssertException);
            if(isIntendedException) {
                String exceptionString = ex.getMessage();
                return assertSObject(exceptionString.contains(message), expectedMessage(exceptionString, SHOULD_CONTAIN_MESSAGE, ' not'));
            } else {
                throw ex;
            }
        }

        return this;
    }

    private ExpectSObject assertSObject(Boolean test, String message) {
        assert(test, message);
        return this;
    }
}