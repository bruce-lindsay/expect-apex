@isTest
public class ExpectError_Tests {
    private static final Exception nullPtr = new NullPointerException();

    @isTest
    static void ExpectErrorShouldExposeErrorMessageAsExpectString() {
        nullPtr.setMessage('explode');
        ExpectError wrappedError = new ExpectError(nullPtr);
        wrappedError.andErrorMessage
            .shouldEqual(nullPtr.getMessage());
    }

    @isTest
    static void ExpectErrorShouldExposeErrorTypeAsExpectString() {
        ExpectError wrappedError = new ExpectError(nullPtr);
        wrappedError.andErrorType
            .shouldEqual(nullPtr.getTypeName());
    }

    @isTest
    static void ExpectErrorShouldChainMessageAndErrorType() {
        nullPtr.setMessage('explode');
        new ExpectError(nullPtr)
            .andErrorType.shouldEqual(nullPtr.getTypeName())
            .andErrorMessage.shouldEqual(nullPtr.getMessage());
    }

}