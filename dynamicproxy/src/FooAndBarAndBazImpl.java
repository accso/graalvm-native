public class FooAndBarAndBazImpl implements FooAndBarInterface, BazInterface {
	public FooAndBarAndBazImpl() {
		System.out.println("FooAndBarAndBazImpl()");
	}

	@Override
	public void foo() {
		System.out.println("foo()");
	}

	@Override
	public String bar(String s) {
		System.out.println("bar(" + s + ")");
		return ("bar(" + s + ")");
	}

	@Override
	public void baz() {
		System.out.println("baz()");
	}

	@Override
	public String toString() {
		return "I am an instance of the class " + FooAndBarAndBazImpl.class.getName();
	}
}
