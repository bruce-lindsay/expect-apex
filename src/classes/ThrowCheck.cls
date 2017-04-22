public abstract class ThrowCheck {
    final String ASSERTION_MESSAGE = 'Expect.AssertException expected';
    protected abstract void testCase();
    protected abstract void testCase(string message);
    public string verify() {
        Expect.UseSystemAssert = false;
        try {
            testCase();
            System.assert(false, ASSERTION_MESSAGE);
        } catch(Expect.AssertException exceptionValue) {
            return exceptionValue.getMessage();
        }
        return null;
    }
    public void verifyMessage(string expectedMessage) {
        System.assertEquals(expectedMessage, this.verify());
    }
    public void verifyCustomMessage(string expectedMessage) {
        Expect.UseSystemAssert = false;
        try {
            testCase(expectedMessage);
            System.assert(false, ASSERTION_MESSAGE);
        } catch(Expect.AssertException exceptionValue) {
            System.assertEquals(expectedMessage, exceptionValue.getMessage());
        }
    }
}