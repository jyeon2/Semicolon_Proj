package admin.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Ad_HomeController {

	public final String command = "/home.ad";
	public String getPage = "/home";
	
	@Autowired
	private ServletContext application;
	
	@RequestMapping(command)
	public String home(HttpSession session) {
		System.out.println("Ad_HCÀÇ admin:"+application.getAttribute("admin"));
		return getPage;
	}
}
