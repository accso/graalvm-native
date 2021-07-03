import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class AppTest {
    @Test 
	void appHasInitialCounterSetToZero() {
        App sut = new App();

        assertEquals(0, sut.getCounter(), "app should an initial counter set to 0");
    }

    @Test 
	void appHasCorrectCounter() {
        App sut = new App();

		sut.incCounter();
		sut.decCounter();
		sut.incCounter();
		sut.decCounter();
		sut.incCounter();
		
        assertEquals(1, sut.getCounter(), "app should a counter set to 1");
    }
}
