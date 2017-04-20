public class Expect {
    public static Boolean UseSystemAssert = true;
    public class AssertException extends System.Exception {}

    private static void assert(Boolean v, String message) {
        if(UseSystemAssert) {
            System.assert(v, message);
        } else {
            if(!v) {
                throw new Expect.AssertException(message);
            }
        }
    }

    public class ExpectBoolean {
        private final Boolean value;
        private ExpectBoolean(Boolean v) {
            this.value = v;
        }
        public void shouldBeFalse() {
            shouldBeFalse('Expected false value');
        }
        public void shouldBeFalse(String message) {
            assert(value == false, message);
        }
        public void shouldBeTrue() {
            assert(value, 'Expected true value');
        }
        public void shouldBeTrue(String message) {
            assert(value, message);
        }
        public void shouldEqual(Boolean actual) {
            assert(actual == this.value, 'Expected ' + (this.value ? 'true' : 'false')
            + ' should equal ' + (actual ? 'true' : 'false'));
        }
        public void shouldEqual(Boolean actual, String message) {
            assert(actual == this.value, message);
        }
    }

    public static ExpectBoolean that(Boolean b) {
        return new ExpectBoolean(b);
    }
}