import org.graalvm.nativeimage.IsolateThread;
import org.graalvm.nativeimage.c.function.CEntryPoint;

public final class MyMath {
	@CEntryPoint(name = "add")
	static int add(IsolateThread thread, int a, int b) { 
		return a + b;
	}

	@CEntryPoint(name = "multiply")
	static int multiply(IsolateThread thread, int a, int b) { 
		return a * b;
	}
}
