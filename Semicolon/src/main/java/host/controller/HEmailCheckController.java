	package host.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import host.model.HostBean;
import host.model.HostDao;


@Controller
public class HEmailCheckController {
	private final String command = "emailCheck.ht";
	
	@Autowired
	private HostDao hostDao;
	
	@RequestMapping(value=command)
	public void emailcheck(@RequestParam("useremail") String useremail,
							HttpServletResponse response) {
		//dao
		HostBean hb = hostDao.searchEmail(useremail);
		
		PrintWriter writer=null;
		
		try {
			writer = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("hb:"+hb);
		if(hb==null) {
			writer.print("사용가능");
		}
		else {
			writer.print("사용불가능");
		}
		
		writer.flush();
		
	}
	
	
}
