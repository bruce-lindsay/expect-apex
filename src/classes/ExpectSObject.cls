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

    private ExpectSObject assertSObject(Boolean test, String message) {
        assert(test, message);
        return this;
    }
}