import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

public class MandelbrotToPNGFile {
    static final double MIN_X = -2;
    static final double MIN_Y = -2;
    static final long maxIterations = 100;
    static final double WINDOW = 4;
    static final double THRESHOLD = 3;

    static final int resolutionBase = 1024;
    static int resolutionFactor = 1;
    static int resolution = resolutionBase * resolutionFactor;

    public static void main(String[] args) throws IOException {
        if (args.length != 0) {
            resolutionFactor = Integer.parseInt(args[0]);
            resolution = resolutionBase * resolutionFactor;
        }

        createPNGImageFile(createMandelbrotImage());
    }

    public static BufferedImage createMandelbrotImage() {
        BufferedImage image = new BufferedImage(resolution, resolution, BufferedImage.TYPE_INT_RGB);

        for(int i = 0; i < resolution; i++) {
            for(int j = 0; j < resolution; j++) {
                int m = mandelbrot(i, j, maxIterations, resolution);
                double theta = (((double)m)/50*Math.PI*2);
                image.setRGB(i, j, getColorValue(theta));
            }
        }
        return image;
    }

    private static int getColorValue(double val) {
        int blue  = (int)(127 + Math.sin(val)               * 127);
        int red   = (int)(127 + Math.sin(val +   Math.PI/3) * 127);
        int green = (int)(127 + Math.sin(val + 2*Math.PI/3) * 127);
        return new Color(red, green, blue).getRGB();
    }

    private static int mandelbrot(int i, int j, long maxIterations, int resolution) {
        Complex c1 = new Complex(MIN_X + WINDOW*i/resolution, MIN_Y + WINDOW*j/resolution);
        Complex c2 = new Complex(0, 0);
        for (int counter = 0; counter < maxIterations; counter++) {
            if (c2.magnitude() > THRESHOLD)
                return counter;

            c2 = c2.multiply(c2).add(c1);
        }
        return 0;
    }

    private static void createPNGImageFile(BufferedImage image) throws IOException {
        long now = System.currentTimeMillis();
		String tmpDir = System.getProperty("java.io.tmpdir", "/tmp");
        String filename = tmpDir + "/mandelbrot-" + now + ".png";
        File file = new File(filename);

        ImageIO.write(image, "png", file);
        System.out.println("Created new mandelbrot file " + file.getCanonicalFile().getName());
    }
}
