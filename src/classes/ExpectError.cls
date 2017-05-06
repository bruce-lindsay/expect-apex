public class ExpectError {
    private final String errorMessage;
    private final String errorType;

    public ExpectError(Exception ex) {
        errorMessage = ex.getMessage();
        errorType = ex.getTypeName();
    }

    public ExpectString andErrorMessage {
        get { return new ExpectString(errorMessage); }
    }

    public ExpectString andErrorType {
        get { return new ExpectString(errorType); }
    }
}