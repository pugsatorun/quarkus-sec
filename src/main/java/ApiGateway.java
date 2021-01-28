package org.acme.security.keycloak.authorization;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.annotation.security.RolesAllowed;

@Path("/api")
public class ApiGateway {

    @GET
    @Path("/sample/1.0")
    @RolesAllowed({"admin"})
    @Produces(MediaType.TEXT_PLAIN)
    public String admin() {
        return "Hello satoshi";
    }
}