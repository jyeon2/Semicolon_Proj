package guest.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import guest.model.GuestBean;
import guest.model.GuestDao;

@Controller
public class KakaoUpdateController {

	private final String command = "kakaoUpdate.gt";
	//private final String gotoPage = "redirect:/myProfile.gt";
	
	@Autowired
	private GuestDao guestDao;
	
	//카카오 게스트가 변경하기 클릭했을 때
	@RequestMapping(value=command, method=RequestMethod.POST)
	public void update(@ModelAttribute("guest") GuestBean guest,
					   HttpServletResponse response,
					   HttpSession session) {
		
		guest.setEmail(guest.getEmail().trim());
		guestDao.updateKakaoGuest(guest);
		
		GuestBean kakaoGuest = guestDao.selectKakaoGuestOne(guest);
		session.setAttribute("guestInfo", kakaoGuest);
		
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원 정보가 수정되었습니다')");
			out.println("location.href='myProfile.gt'");
			out.println("</script>");
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}
