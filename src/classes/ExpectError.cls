public class ExpectError {
    private final String errorMessage;

    public ExpectError(Exception ex) {
        errorMessage = ex.getMessage();
    }

    public ExpectString andErrorMessage {
        get { return new ExpectString(errorMessage); }
    }
}