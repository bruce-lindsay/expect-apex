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
        return assertSObject(expected === actual, message);
    }

    public ExpectSObject shouldNotEqual(SObject actual) {
        return shouldNotEqual(actual, expectedShouldNotBeMessage(actual));
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
            System.assert(false, new Expect.AssertException(message));
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

        return assertSObject(exceptionString.contains(errorKeywords), expectedMessage(exceptionString, SHOULD_CONTAIN_MESSAGE, ' not'));
    }

    public ExpectSObject shouldBeOK() {
        if(!isSuccess) {
            throw new Expect.AssertException('Should have succeeded, instead got error: ' + exceptionString);
        }

        return this;
    }

    private ExpectSObject assertSObject(Boolean test, String message) {
        assert(test, message);
        return this;
    }
}