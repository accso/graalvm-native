public class PrintProperties {

    private static final String myBuildtimeFlag = System.getProperty("my.buildtime.flag");

    public static void main(String[] args) {
        System.getProperties().list(System.out);
		System.out.println("my.buildtime.flag=" + myBuildtimeFlag);
    }
}
