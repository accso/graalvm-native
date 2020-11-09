public class BazImpl implements BazInterface {
	public BazImpl() {
		System.out.println("BazImpl()");
	}

	@Override
	public void baz() {
		System.out.println("baz()");
	}

	@Override
	public String toString() {
		return "I am an instance of the class " + BazImpl.class.getName();
	}
}
