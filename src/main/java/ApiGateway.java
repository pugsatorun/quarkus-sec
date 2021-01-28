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
    @Produces(MediaType.TEXT_PLAIN)
    @RolesAllowed({"admin"})
    public String apires() throws Exception {
        String urls = "http://localhost:3000/";
        String connect = URLGetConnection.getText(urls);
        //String urls = "satoshi";
        return connect;
    }
}