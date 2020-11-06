package de.accso.java.graalvm.timeserver;

import io.smallrye.mutiny.Multi;
import io.smallrye.mutiny.Uni;
import org.jboss.resteasy.annotations.SseElementType;
import org.jboss.resteasy.annotations.cache.NoCache;

import javax.annotation.security.RolesAllowed;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/time")
@RequestScoped
public class SecureTimeResource {

    @Inject
    TimeService service;

    @GET
    @Path("/secure")
    @Produces(MediaType.APPLICATION_JSON)
    @NoCache
    @RolesAllowed("admin")
    public Uni<Timestamp> time() {
        return service.time().map(t -> Timestamp.from(t));
    }

}
