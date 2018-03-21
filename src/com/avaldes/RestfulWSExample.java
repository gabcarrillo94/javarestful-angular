package com.avaldes;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.avaldes.model.Actor;

@Path("/actors")
public class RestfulWSExample {
	static final String api_version = "1.01A rev.18729";
	static String xmlString = null;
	static Map<String, Actor> actors = new HashMap<String, Actor>();
	
	static { 
		System.out.println("Initializing Internal DataStore...");
		actors.put("1", new Actor(1, "admin01@testmail.com", "123456", "Admin", "01"));
		actors.put("2", new Actor(2, "admin02@testmail.com", "123456", "Admin", "02"));
		actors.put("3", new Actor(3, "admin03@testmail.com", "123456", "Admin", "03"));
		actors.put("4", new Actor(4, "admin04@testmail.com", "123456", "Admin", "04"));
	}
		
	@Path("/version") 
	@GET
	@Produces(MediaType.TEXT_HTML)
	public String returnVersion() {
		return "<p>Version: " + api_version + "</p>";
	}
	
	// Login Path
	@Path("/login")
	@POST
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public Actor sigin(Actor user) {
		System.out.println("Creating session with EMAIL: " + user.getEmail());
	  
	  if (user != null) {
		  for (Actor u : actors.values()) {
		    if ((u.getEmail().toUpperCase().equals(user.getEmail().toUpperCase()))
		    		&&
		    	(u.getPassword().equals(user.getPassword()))
		    	) {
		    	
		    	user.setId(u.getId());
			    user.setFirstName(u.getFirstName());
			    user.setLastName(u.getLastName());
		    }
		  }
	  }
	  
	  return user;
	}

	// This is the default @PATH
	@GET
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public ArrayList<Actor> getAllActors() {
		System.out.println("Getting all actors...");
		ArrayList<Actor> actorList = new ArrayList<Actor>(actors.values());
		return actorList;
	}
}
