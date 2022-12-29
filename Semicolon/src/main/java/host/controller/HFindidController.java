package host.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import host.model.HostBean;
import host.model.HostDao;

@Controller
public class HFindidController {
	private final String command = "findid.ht";
	private final String getPage = "findId";
	private String gotoPage = "redirect:/login.ht";

	@Autowired
	private HostDao hostDao;

	@RequestMapping(value=command, method=RequestMethod.GET)
	public String findid() {
		return getPage;

	}

	@RequestMapping(value=command, method=RequestMethod.POST)
	public String findid(@ModelAttribute("host") HostBean host
			,HttpServletResponse response) throws IOException {
		

		HostBean hb = hostDao.hostfindId(host);
		if(hb==null) {
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
			writer.println("alert('"+hb.getEmail()+"입니다.');");
			writer.println("location.href='login.gt'");
			writer.println("</script>");

			writer.flush();
			
			return gotoPage;
		}
		

	}
}
