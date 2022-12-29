package guest.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import guest.model.GuestBean;
import guest.model.GuestDao;

@Controller
public class GuestUpdateController {

	private final String command = "update.gt";
	private final String getPage = "update";
	//private final String gotoPage = "redirect:/myProfile.gt";
	
	@Autowired
	private GuestDao guestDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String update(HttpSession session, Model model) {
		
		GuestBean guest = (GuestBean)session.getAttribute("guestInfo");
		
		//카카오와 일반 => 수정 form 다르게 하기
		if(guest.getKakao() == 1) {
			System.out.println("카카오 로그인한 사람");
			model.addAttribute("kakaoGuest",guest); 
		} else {
			System.out.println("일반 로그인한 사람");
			model.addAttribute("normalGuest",guest);
		}
		
		return getPage;
	}
	
	
	//일반 게스트가 변경하기 클릭했을때
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String update(@ModelAttribute("normalGuest") @Valid GuestBean guest,
						 BindingResult result,
						 @RequestParam("originalPassword") String originalPassword,
						 HttpSession session,
						 HttpServletResponse response,
						 Model model) {
		
		//System.out.println("GUC의 newPassword:"+newPassword);
		//System.out.println("GUC의 guest.getEmail:"+guest.getEmail().trim());
		//System.out.println("GUC의 guest.getPassword:"+guest.getPassword());
	
		
		String newPassword = guest.getPassword();
		guest.setEmail(guest.getEmail().trim());
		guest.setPassword(originalPassword);
		boolean check = guestDao.checkEmailPassword(guest);
		
		GuestBean normalGuest;
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		
		if(check == false) { //없음
			//현재 비밀번호가 맞지 않을때
			//System.out.println("현재 비밀번호가 맞지 않음");
			
			try {
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('현재 비밀번호가 일치하지 않습니다.')");
				out.println("</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			normalGuest = (GuestBean)session.getAttribute("guestInfo");
			model.addAttribute("normalGuest", normalGuest);
			return getPage;
			
		}
		else {
			//현재 비밀번호가 맞을때
			//System.out.println("현재 비밀번호가 맞음");
			
			if(result.hasErrors()) {
				System.out.println("에러");
				return getPage;
			}
			
			guest.setPassword(newPassword);
			guestDao.updateNormalGuest(guest);
			
			normalGuest = guestDao.selectNormalGuestOne(guest);
			session.setAttribute("guestInfo", normalGuest);
			
			try {
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('회원 정보가 수정되었습니다.')");
				out.println("location.href='myProfile.gt'");
				out.println("</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return null;
			
		}
		
	}
}
