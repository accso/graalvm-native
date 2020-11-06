package de.accso.java.graalvm.timeserver;

import java.util.Date;

public class Timestamp {
    private Date time;

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public static Timestamp from(Date time) {
        Timestamp ts = new Timestamp();
        ts.setTime(time);
        return ts;
    }
}
