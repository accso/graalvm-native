public class App {
	public int counter = 0;
	
	public App() {
	}
	
	public void incCounter() {
		counter = counter+1;
	}
	
	public void decCounter() {
		counter = counter-1;
	}
	
	public int getCounter() {
		return counter;
	}
	
	public static void main(String[] args) {
		App app = new App();
		app.incCounter();
		System.out.println(app.counter);
	}
}
