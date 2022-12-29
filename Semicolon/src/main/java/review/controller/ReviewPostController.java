package review.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
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
import order.model.PayforBean;
import order.model.PayforDao;
import review.model.ReviewBean;
import review.model.ReviewDao;

@Controller
public class ReviewPostController {

	private final String command = "reviewpost.rv";
	private final String getPage = "reviewPostForm";
	private final String gotoPage = "redirect:/myReview.gt";
	
	@Autowired
	private PayforDao payforDao;
	
	@Autowired
	private ReviewDao reviewDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String review(@RequestParam("pno") int pno,
							Model model, HttpSession session,
							HttpServletResponse response) {
		
		System.out.println("pno:"+pno);
		
		GuestBean guest = (GuestBean)session.getAttribute("guestInfo");
		//dao 가져가는 payfor
		PayforBean payfor = new PayforBean();
		payfor.setGno(guest.getGno());
		payfor.setPno(pno);
		
		//jsp 가져가는 pb
		PayforBean pb = payforDao.selectPayforByNo(payfor);
		model.addAttribute("pb",pb);
		
		//System.out.println("pb:"+pb);
		
		return getPage;
		
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String review1(@ModelAttribute("review") @Valid ReviewBean rb,
			   			BindingResult result,@RequestParam("pno") int pno,
			   			HttpSession session,Model model,HttpServletResponse response) throws IOException {
		
		System.out.println("reviewpostcontroller");
		System.out.println("RPC의 post => pno : "+rb.getPno());
		
		if(result.hasErrors()) {
			GuestBean guest = (GuestBean)session.getAttribute("guestInfo");
			
			PayforBean payfor = new PayforBean();
			payfor.setGno(guest.getGno());
			payfor.setPno(pno);
			
			PayforBean pb = payforDao.selectPayforByNo(payfor);
			model.addAttribute("pb",pb);
			return getPage;
		}
		
		reviewDao.insertReview(rb);
		payforDao.updateReviewUse(pno);
		
					
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('리뷰 등록이 완료되었습니다.');");
		writer.println("location.href='myReview.gt'");
		writer.println("</script>");
		
		writer.flush();
	
		return gotoPage;
	
	}
}

