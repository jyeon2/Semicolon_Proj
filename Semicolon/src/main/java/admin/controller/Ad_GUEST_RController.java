package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import host.model.HostDao;

@Controller
public class Ad_GUEST_RController {
	private String command="allGuest.ad";
	private String getPage="allReservation_G";	
	@Autowired
	private HostDao hoDao;
	

	
}
