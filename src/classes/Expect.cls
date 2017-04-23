public class Expect {
    public static Boolean UseSystemAssert = true;

    public class AssertException extends System.Exception {}

    public static void assert(Boolean expected, String message) {
        if(UseSystemAssert) {
            System.assert(expected, message);
        }
        if(!expected) {
            throw new Expect.AssertException(message);
        }
    }

    public static ExpectBoolean that(Boolean expected) {
        return new ExpectBoolean(expected);
    }
    public static ExpectInteger that(Integer expected) {
        return new ExpectInteger(expected);
    }
    public static ExpectDate that(Date expected) {
        return new ExpectDate(expected);
    }
}