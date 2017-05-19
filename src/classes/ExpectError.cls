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
        private final ExpectStringDecorator parent;
        private ExpectStringDecorator(String value, ExpectError wrapped) {
            this.wrapped = wrapped;
            this.wrappedString = new ExpectString(value);
            this.parent = this;
        }
        // negation constructor
        private ExpectStringDecorator(ExpectStringDecorator parent) {
            this.wrapped = parent.wrapped;
            this.wrappedString = parent.wrappedString.negated;
            this.parent = parent;
        }
        public ExpectStringDecorator andErrorMessage {
            get { return wrapped.andErrorMessage; }
        }
        public ExpectStringDecorator andErrorType {
            get { return wrapped.andErrorType; }
        }
        public ExpectStringDecorator shouldEqualIgnoreOrdinalCase(String actual) {
            wrappedString.shouldEqualIgnoreOrdinalCase(actual);
            return parent;
        }
        public ExpectStringDecorator shouldEqualIgnoreOrdinalCase(String actual, String message) {
            wrappedString.shouldEqualIgnoreOrdinalCase(actual, message);
            return parent;
        }
        public ExpectStringDecorator shouldContain(String actual) {
            wrappedString.shouldContain(actual);
            return parent;
        }
        public ExpectStringDecorator shouldContain(String actual, String message) {
            wrappedString.shouldContain(actual, message);
            return parent;
        }
        public ExpectStringDecorator shouldEqual(String actual) {
            wrappedString.shouldEqual(actual);
            return parent;
        }
        public ExpectStringDecorator shouldEqual(String actual, String message) {
            wrappedString.shouldEqual(actual, message);
            return parent;
        }
        public ExpectStringDecorator negated {
            get {
                return new ExpectStringDecorator(this);
            }
        }
    }
}