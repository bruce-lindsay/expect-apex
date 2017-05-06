@isTest
public class ExpectError_Tests {

    @isTest
    static void ExpectErrorShouldExposeErrorMessageAsExpectString() {
        Exception nullPtr = new NullPointerException();
        nullPtr.setMessage('explode');
        ExpectError wrappedError = new ExpectError(nullPtr);
        ExpectString wrappedMessage = wrappedError.andErrorMessage;
        wrappedMessage.shouldEqual('explode');
    }

    @isTest
    static void ExpectErrorShouldExposeErrorTypeAsExpectString() {
        Exception nullPtr = new NullPointerException();
        ExpectError wrappedError = new ExpectError(nullPtr);
        ExpectString wrappedType = wrappedError.andErrorType;
        wrappedType.shouldEqual(nullPtr.getTypeName());
    }

}