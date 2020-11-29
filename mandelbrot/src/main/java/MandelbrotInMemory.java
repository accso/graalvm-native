public class MandelbrotInMemory {
    static final double MIN_X = -2;
    static final double MIN_Y = -2;
    static final long maxIterations = 100;
    static final double WINDOW = 4;
    static final double THRESHOLD = 3;

    static final int resolutionBase = 1024;
    static int resolutionFactor = 1;
    static int resolution = resolutionBase * resolutionFactor;
    
    public static void main(String[] args) {
        if (args.length != 0) {
            resolutionFactor = Integer.parseInt(args[0]);
            resolution = resolutionBase * resolutionFactor;
        }

        createMandelbrotImage();
    }

    public static Buffer createMandelbrotImage() {
        Buffer image = new Buffer(resolution, resolution);

        for(int i = 0; i < resolution; i++) {
            for(int j = 0; j < resolution; j++) {
                int m = mandelbrot(i, j, maxIterations, resolution);
                double theta = (((double)m)/50*Math.PI*2);
                image.setRGB(i, j, getColorValue(theta));
            }
            if (i%100 == 0) System.out.print(i + "... ");
        }
        return image;
    }

    private static int getColorValue(double val) {
        int blue  = (int)(127 + Math.sin(val)               * 127);
        int red   = (int)(127 + Math.sin(val +   Math.PI/3) * 127);
        int green = (int)(127 + Math.sin(val + 2*Math.PI/3) * 127);
        return new RGBColor(red, green, blue).getRGB();
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

}

class Buffer {
    private int[][] buffer;

    public Buffer(int width, int height) {
        buffer = new int[width][height];
    }

    void setRGB(int i, int j, int value) {
        buffer[i][j] = value;
    }
}

class RGBColor {
    int alpha=255;
    int value;

    public RGBColor(int r, int g, int b) {
        value = ((alpha & 0xFF) << 24) |
                ((r & 0xFF) << 16) |
                ((g & 0xFF) << 8)  |
                ((b & 0xFF) << 0);
    }

    int getRGB() {
        return value;
    }
}
