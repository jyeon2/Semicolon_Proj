package guest.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import guest.model.GuestBean;
import guest.model.GuestDao;

@Controller
public class FindidController {
	private final String command = "findid.gt";
	private final String getPage = "findId";
	private String gotoPage = "redirect:/login.gt";

	@Autowired
	private GuestDao guestDao;

	@RequestMapping(value=command, method=RequestMethod.GET)
	public String findid() {
		return getPage;

	}

	@RequestMapping(value=command, method=RequestMethod.POST)
	public String findid(@ModelAttribute("guest") GuestBean guest
			,HttpServletResponse response) throws IOException {
		

		System.out.println("findid");

		GuestBean gb = guestDao.findId(guest);
		if(gb==null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>");
			writer.println("alert('가입하지 않은 회원입니다.');");
			writer.println("</script>");

			writer.flush();
			
			return getPage;
		}
		else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>");
			writer.println("alert('"+gb.getEmail()+"입니다.');");
			writer.println("location.href='login.gt'");
			writer.println("</script>");

			writer.flush();
			
			return gotoPage;
		}
		

	}
}
