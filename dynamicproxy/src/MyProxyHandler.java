import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public class MyProxyHandler implements InvocationHandler {
	private Object target = null;

	public static Object newProxyInstance (Class targetClass) throws Throwable {
		System.out.println("newInstance()");

		return Proxy.newProxyInstance(targetClass.getClassLoader(),
				targetClass.getInterfaces(),
				new MyProxyHandler(targetClass));
	}

	public MyProxyHandler(Class targetClass) throws Throwable {
		System.out.println("MyProxyHandler()");
		this.target = targetClass.getDeclaredConstructor().newInstance();
	}

    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
		// methods from java.lang.Object are called here, NOT passed through
		// examples: do NOT pass through toString(), equals(), hashCode()
		if (method.getDeclaringClass().equals(Object.class))
			return method.invoke(this, args);

		// else: invoker the target object
		System.out.println(MyProxyHandler.class.getName() + ".invoke()");
    	return method.invoke(target, args);
    }

	public String toString() {
		return "I am an instance of the class " + MyProxyHandler.class.getName();
	}
}
