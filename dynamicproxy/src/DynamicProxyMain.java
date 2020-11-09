public class DynamicProxyMain {
	public static void main(String[] args) throws Throwable {
		new Client().callFooAndBar(
			(FooAndBarInterface) MyProxyHandler.newProxyInstance(FooAndBarAndBazImpl.class)
		);

		new Client().callBaz(
			(BazInterface) MyProxyHandler.newProxyInstance(FooAndBarAndBazImpl.class)
		);
		new Client().callBaz(
			(BazInterface) MyProxyHandler.newProxyInstance(BazImpl.class)
		);
	}
}
