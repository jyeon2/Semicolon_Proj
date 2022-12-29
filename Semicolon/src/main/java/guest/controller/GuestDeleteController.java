package guest.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import guest.model.GuestBean;
import guest.model.GuestDao;

@Controller
public class GuestDeleteController {

	private final String command = "delete.gt";
	//private final String gotoPage = "redirect:/home.gt";
	
	@Autowired
	private GuestDao guestDao;
	
	@RequestMapping(command)
	public void update(HttpSession session,
					   HttpServletResponse response) {
		
		GuestBean guest = (GuestBean) session.getAttribute("guestInfo");
		
		guestDao.deleteGuest(guest.getGno());
		
		response.setContentType("text/html charset=utf-8");
		try {
			PrintWriter writer = response.getWriter();
			writer.println("<script>");
			writer.println("alert('Å»Åð°¡ ¿Ï·áµÇ¾ú½À´Ï´Ù.');");
			writer.println("location.href='logout.gt'");
			writer.println("</script>");
			writer.flush();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//return gotoPage;
		
	}
}
