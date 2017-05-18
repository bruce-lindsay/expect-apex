@isTest
public class ExpectError_Tests {
    private static final Exception nullPtr = setupException();

    static Exception setupException() {
        Exception ex = new NullPointerException();
        ex.setMessage('explode');
        return ex;
    }

    @isTest
    static void ExpectErrorShouldExposeErrorMessageAsExpectString() {
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
        new ExpectError(nullPtr)
            .andErrorType.shouldEqual(nullPtr.getTypeName())
            .andErrorMessage.shouldEqual(nullPtr.getMessage());
    }

    @isTest
    static void ExpectErrorShouldNegate() {
        new ExpectError(nullPtr)
            .andErrorType
                .negated.shouldEqual('assemble')
                .shouldEqual(nullPtr.getTypeName()) // verify negation lasts for 1 assert
            .andErrorMessage
                .negated.shouldEqual('shuffle')
                .shouldEqual(nullPtr.getMessage()); // verify negation lasts for 1 assert
    }

}