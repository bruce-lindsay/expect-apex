public abstract class ThrowCheck {
    final String ASSERTION_MESSAGE = 'Expect.AssertException expected';
    protected abstract void testCase();
    public void verify() {
        try {
            testCase();
            System.assert(false, ASSERTION_MESSAGE);
        } catch(Expect.AssertException unused) { }
    }
    public void verifyMessage(string expectedMessage) {
        try {
            testCase();
            System.assert(false, ASSERTION_MESSAGE);
        } catch(Expect.AssertException exceptionValue) {
            System.assertEquals(expectedMessage, exceptionValue.getMessage());
        }
    }
}