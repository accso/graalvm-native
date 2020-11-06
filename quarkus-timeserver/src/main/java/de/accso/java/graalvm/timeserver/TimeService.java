package de.accso.java.graalvm.timeserver;

import io.smallrye.mutiny.Multi;
import io.smallrye.mutiny.Uni;

import javax.enterprise.context.ApplicationScoped;
import java.time.Duration;
import java.util.Date;

@ApplicationScoped
public class TimeService {

    public Multi<Date> timeStream() {
        return Multi.createFrom().ticks().every(Duration.ofSeconds(1)).map(it -> new Date());
    }

    public Uni<Date> time() {
        return Uni.createFrom().item(new Date());
    }
}
