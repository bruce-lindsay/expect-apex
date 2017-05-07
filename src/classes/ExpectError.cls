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

    public class ExpectStringDecorator {
        private final ExpectError wrapped;
        private final ExpectString wrappedString;
        private ExpectStringDecorator(String value, ExpectError wrapped) {
            this.wrapped = wrapped;
            this.wrappedString = new ExpectString(value);
        }
        public ExpectStringDecorator andErrorMessage {
            get { return wrapped.andErrorMessage; }
        }
        public ExpectStringDecorator andErrorType {
            get { return wrapped.andErrorType; }
        }
        public ExpectStringDecorator shouldEqualIgnoreOrdinalCase(String actual) {
            wrappedString.shouldEqualIgnoreOrdinalCase(actual);
            return this;
        }
        public ExpectStringDecorator shouldEqualIgnoreOrdinalCase(String actual, String message) {
            wrappedString.shouldEqualIgnoreOrdinalCase(actual, message);
            return this;
        }
        public ExpectStringDecorator shouldContain(String actual) {
            wrappedString.shouldContain(actual);
            return this;
        }
        public ExpectStringDecorator shouldContain(String actual, String message) {
            wrappedString.shouldContain(actual, message);
            return this;
        }
        public ExpectStringDecorator shouldNotContain(String actual) {
            wrappedString.shouldNotContain(actual);
            return this;
        }
        public ExpectStringDecorator shouldNotContain(String actual, String message) {
            wrappedString.shouldNotContain(actual, message);
            return this;
        }
        public ExpectStringDecorator shouldEqual(String actual) {
            wrappedString.shouldEqual(actual);
            return this;
        }
        public ExpectStringDecorator shouldEqual(String actual, String message) {
            wrappedString.shouldEqual(actual, message);
            return this;
        }
        public ExpectStringDecorator shouldNotEqual(String actual) {
            wrappedString.shouldNotEqual(actual);
            return this;
        }
        public ExpectStringDecorator shouldNotEqual(String actual, String message) {
            wrappedString.shouldNotEqual(actual, message);
            return this;
        }
    }
}