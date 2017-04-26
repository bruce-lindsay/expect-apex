public class ExpectSObject extends Expect {
    private static Boolean isSuccess = true;
    private static Boolean isFail = false;
    private static String exceptionString;
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
        assert(expected === actual, message);
        return this;
    }

    public ExpectSObject shouldNotEqual(SObject actual) {
        return shouldNotEqual(actual, expectedMessage(actual,' not'));
    }

    public ExpectSObject shouldNotEqual(SObject actual, String message) {
        assert(expected !== actual, message);
        return this;
    }

    public ExpectSObject sObjectTypeEquals(SObject actual) {
        return sObjectTypeEquals(actual, expectedMessage(actual.getSObjectType(),''));
    }

    public ExpectSObject sObjectTypeEquals(SObject actual, String message) {
        assert(expected.getSObjectType() == actual.getSObjectType(), message);
        return this;
    }

    public ExpectSObject sObjectTypeEquals(SObjectType objType) {
        return sObjectTypeEquals(objType, expectedMessage(objType,''));
    }

    public ExpectSObject sObjectTypeEquals(SObjectType objType, String message) {
        assert(expected.getSObjectType() == objType, message);
        return this;
    }

    public ExpectSObject whenTryingToUpsert() {
        try {
            upsert this.expected;
            System.assert(false, new Expect.AssertException('Upsert failed'));
        } catch (Exception ex) {
            Boolean isUnintendedException = ex instanceof Expect.AssertException;
            isFail = !isUnintendedException;
            isSuccess = isUnintendedException;
            exceptionString = ex.getMessage();
        }

        return this;
    }

    public ExpectSObject shouldFailWithMessage(String errorKeywords) {
        if(!isFail) {
            throw new Expect.AssertException('Should have failed');
        }

        assert(exceptionString.contains(errorKeywords), expectedMessage(exceptionString, SHOULD_CONTAIN_MESSAGE, ' not'));
        return this;
    }

    public ExpectSObject shouldBeOK() {
        if(!isSuccess) {
            throw new Expect.AssertException('Should have succeeded, instead got error: ' + exceptionString);
        }

        return this;
    }
}