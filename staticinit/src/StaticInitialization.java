public class StaticInitialization {
    private String userHome = System.getProperty("user.home");
    private static String userHomeStatic = System.getProperty("user.home");
    private final String userHomeFinal = System.getProperty("user.home");
    private static final String userHomeStaticFinal = System.getProperty("user.home");

    private static final String customProperty = System.getProperty("custom.property");

    public static void main(String[] args) {
        (new StaticInitialization()).printSystemProperties();
    }

    public void printSystemProperties() {
        System.out.println("user.home: " + userHome);
        System.out.println("user.home (static): " + userHomeStatic);
        System.out.println("user.home (final): " + userHomeFinal);
        System.out.println("user.home (static final): " + userHomeStaticFinal);

        System.out.println("custom property: " + customProperty);
    }
}