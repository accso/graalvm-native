public class StringManipulator {
    static String reverse(String input) {
        return new StringBuilder(input).reverse().toString();
    }

    static String capitalize(String input) {
        return input.toUpperCase();
    }
}
