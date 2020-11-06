package de.accso.java.graalvm.timeserver;

import io.quarkus.test.junit.QuarkusTest;
import org.junit.jupiter.api.Test;

import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.containsString;

@QuarkusTest
public class TimeResourceTest {

    @Test
    public void testTimeEndpoint() {
        given()
          .when().get("/time")
          .then()
             .statusCode(200)
             .body(containsString("time"));
    }

}