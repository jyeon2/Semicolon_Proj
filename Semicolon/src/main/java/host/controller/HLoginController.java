package host.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import host.model.HostBean;
import host.model.HostDao;

@Controller
public class HLoginController {
	private final String command = "login.ht";
	private final String getPage = "login";
	private final String gotoPage = "redirect:/home.ht";

	@Autowired
	private HostDao hostDao;
	
	@Autowired
	private ServletContext application;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String login(@RequestParam(value="destination",required=false) String destination,
					HttpSession session) {
		
		if(destination != null) {
			if(destination.equals("addHouse")){
				
				session.setAttribute("destination", "addHouse.ht");
			}
		}
		
		return getPage;
	}

	@RequestMapping(value=command, method=RequestMethod.POST)
	public String login(@ModelAttribute("host") HostBean host,
			HttpServletResponse response,
			HttpSession session) {

		boolean check = hostDao.checkEmailPassword(host);
		if(check == false) {
			System.out.println("가입하지 않은 회원");
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter writer = response.getWriter();
				writer.println("<script>");
				writer.println("alert('가입하지 않은 회원입니다. \\n이메일과 비밀번호를 다시 입력해주세요.');");
				writer.println("</script>");

				writer.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return getPage;
		}
		else {
			System.out.println("가입한 회원");
			String destination = (String) session.getAttribute("destination");
			HostBean loginHost = hostDao.selectHostOne(host);

			session.setAttribute("hostInfo", loginHost);
			// 세션 유지시간 1시간 
			session.setMaxInactiveInterval(60*60) ;
			
			if(loginHost.getEmail().equals("admin@a")) { //관리자
				application.setAttribute("admin",loginHost);
				return "redirect:/home.ad";
			} 
			else{ //일반호스트
				//System.out.println("hostInfo:"+session.getAttribute("hostInfo"));
				if(destination != null) {
					return "redirect:/"+destination;
				}
				return gotoPage;
			}
		}
	}
}
