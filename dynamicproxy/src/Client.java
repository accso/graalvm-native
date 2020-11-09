public class Client {

	public void callFooAndBar(FooAndBarInterface callee) {
		callee.foo();
		System.out.println(callee.bar("test"));
		System.out.println(callee.toString());
	}

	public void callBaz(BazInterface callee) {
		callee.baz();
		System.out.println(callee.toString());
	}
}
