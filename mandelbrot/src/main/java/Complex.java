class Complex {
    private double x, y;

    public Complex(double x, double y) {
        this.x = x;
        this.y = y;
    }

    public Complex multiply(Complex other) {
        return new Complex(x*other.x - y*other.y, y*other.x + x*other.y);
    }

    public Complex add(Complex other) {
        return new Complex(x+other.x, y+other.y);
    }

    public double magnitude() {
        return Math.sqrt(x*x + y*y);
    }
}
