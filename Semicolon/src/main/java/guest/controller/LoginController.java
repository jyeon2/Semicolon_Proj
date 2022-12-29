package guest.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import guest.model.GuestBean;
import guest.model.GuestDao;

@Controller
public class LoginController {

	private final String command = "login.gt";
	private final String getPage = "login";
	private final String gotoPage = "redirect:/home.gt";
	
	@Autowired
	private GuestDao guestDao;
	
	@Autowired
	private ServletContext application;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String login(@RequestParam(value="destination", required=false) String destination,
						@RequestParam(value="name", required=false) String name,
						@RequestParam(value="house_no", required=false) String house_no,
						HttpSession session) {
		
		//String destination = (String) session.getAttribute("destination");
		System.out.println("LC의 destination:" + destination); //목적지
		System.out.println("LC의 name:" + name); //theme, subtheme의 이름
		System.out.println("LC의 house_no"+house_no);
		

		if(destination != null) {
			
			if(destination.equals("theme") || destination.equals("subtheme")) {
				session.setAttribute("destination",destination+".gt");
				session.setAttribute("name",name);
			}
			else if(destination.equals("detail")) {
				
				session.setAttribute("destination",destination+".gt");
				session.setAttribute("house_no",house_no);
			}
			else if(destination.equals("buyTicket")) {
	               
	               session.setAttribute("destination","seasonT.gt");
	        }
		}
		
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String login(@ModelAttribute("guest") GuestBean guest,
						HttpServletResponse response,
						HttpSession session,
						Model model) {
		
		//System.out.println("LC");
		
		boolean check = guestDao.checkEmailPassword(guest);
		if(check == false) {
			System.out.println("가입하지 않은 회원");
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter writer = response.getWriter();
				writer.println("<script>");
				writer.println("alert('가입하지 않은 회원입니다.\\n이메일과 비밀번호를 다시 입력해주세요.');");
				writer.println("location.href='login.gt'");
				writer.println("</script>");
				
				writer.flush(); //script태그 작성한거 내보내기
			} catch (IOException e) {
				e.printStackTrace();
			}
			return getPage;
		}
		else {
			System.out.println("가입한 회원");
			GuestBean normalGuest = guestDao.selectNormalGuestOne(guest);

			session.setAttribute("guestInfo", normalGuest);
			// 세션 유지시간 1시간 
			session.setMaxInactiveInterval(60*60) ;
			
			if(normalGuest.getEmail().equals("admin@a")) { //관리자
				application.setAttribute("admin",normalGuest);
				return "redirect:/home.ad";
			} 
			else { //일반회원
				String destination = (String) session.getAttribute("destination");
				String name = (String) session.getAttribute("name");
				String house_no = (String) session.getAttribute("house_no");
				
				System.out.println("LC의 로그인 후 destination:"+destination);
				System.out.println("LC의 로그인 후 name:"+name);
				System.out.println("LC의 로그인 후 house_no:"+house_no);
				
				
				
				if(destination != null) {
					model.addAttribute("name",name);
					model.addAttribute("house_no",house_no);
					return "redirect:/"+destination;
				}
				
				return gotoPage;
			}
		}
	}
}
