import java.time.*;

public class StaticBuildInit {
    private static LocalDateTime now = LocalDateTime.now();
 
    public static void main(String[] args) {
      LocalDateTime startOfUnixTime = LocalDateTime.of(1970, 1, 1, 0, 0, 0, 0);
      Duration since = Duration.between(startOfUnixTime, now);
      System.out.println(since.toSeconds() + "s since 1970/1/1");
    }
}
