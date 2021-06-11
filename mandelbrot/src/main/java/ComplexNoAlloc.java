class ComplexNoAlloc {
    private double x, y;

    public ComplexNoAlloc(double x, double y) {
        this.x = x;
        this.y = y;
    }

    public ComplexNoAlloc square() {
        double oldx = x;
	    x = x * x - y * y;
	    y = y * oldx + oldx * y;
	    return this;
    }

    public ComplexNoAlloc multiply(ComplexNoAlloc other) {
        double oldx = this.x;
	    this.x = this.x * other.x - this.y * other.y;
	    this.y = this.y * other.x + oldx * other.y;
	    return this;
    }

    public ComplexNoAlloc add(ComplexNoAlloc other) {
	    this.x = this.x + other.x;
	    this.y = this.y + other.y;
	    return this;
    }

    public double magnitude() {
        return Math.sqrt(x*x + y*y);
    }
}
