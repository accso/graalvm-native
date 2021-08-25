import java.lang.reflect.Method;

public class ReflectionCaller {
    public static void main(String[] args) throws ReflectiveOperationException {
        String className  = args[0];
        String methodName = args[1];
        String input      = args[2];

        Class<?> clazz = Class.forName(className);
        Method method = clazz.getDeclaredMethod(methodName, String.class);

        System.out.println(method.invoke(null, input));
    }
}
