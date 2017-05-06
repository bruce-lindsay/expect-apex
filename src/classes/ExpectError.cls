public class ExpectError {
    private final String errorMessage;
    private final String errorType;

    public ExpectError(Exception ex) {
        errorMessage = ex.getMessage();
        errorType = ex.getTypeName();
    }

    public ExpectStringDecorator andErrorMessage {
        get { return new ExpectStringDecorator(errorMessage, this); }
    }

    public ExpectStringDecorator andErrorType {
        get { return new ExpectStringDecorator(errorType, this); }
    }

    public class ExpectStringDecorator extends ExpectString {
        private final ExpectError wrapped;
        ExpectStringDecorator(String value, ExpectError wrapped) {
            super(value);
            this.wrapped = wrapped;
        }
        public ExpectStringDecorator andErrorMessage {
            get { return wrapped.andErrorMessage; }
        }

        public ExpectStringDecorator andErrorType {
            get { return wrapped.andErrorType; }
        }
    }
}