import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ResourceLoader {
    public static void main(String[] args) throws IOException {
    	String resourceFileName = "/my-resources.properties";
        ResourceLoader rl = new ResourceLoader(resourceFileName);
    }
	
	public ResourceLoader(String resourceFileName) throws IOException {
		final Properties properties = new Properties();
		try (final InputStream stream = this.getClass().getResourceAsStream(resourceFileName)) {
		    properties.load(stream);
		}
		String value = properties.getProperty("text", "my-resources properties file could not be loaded");
		
		System.out.println(value);
	}
}
