package host.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import host.model.HostBean;
import host.model.HostDao;

@Controller
public class HJoinController {
	
	private final String command = "join.ht";
	private String getPage = "join";
	//private String gotoPage = "redirect:/login.ht";

	@Autowired
	private HostDao hostDao;

	@RequestMapping(value=command, method=RequestMethod.GET)
	public String join() {
		return getPage;
	}

	@RequestMapping(value=command, method=RequestMethod.POST)
	public String join(@ModelAttribute("host") @Valid HostBean hb,
						BindingResult result,
						HttpServletResponse response) {
		//System.out.println("JC");

		if(result.hasErrors()) {
			return getPage;
		}

		hostDao.insertHost(hb);

		response.setContentType("text/html charset=utf-8");
		try {
			PrintWriter writer = response.getWriter();
			writer.println("<script>");
			writer.println("alert('회원가입을 축하합니다.')");
			writer.println("location.href='login.ht'");
			writer.println("</script>");
			
			writer.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
