package review.controller;

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
import review.model.ReviewBean;
import review.model.ReviewDao;

@Controller
public class ReviewUpdateController {

	private final String command = "reviewupdate.rv";
	private final String getPage = "reviewUpdateForm";
	private final String gotoPage = "redirect:/myReview.gt";
	
	@Autowired
	private ReviewDao reviewDao;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String update(@RequestParam("review_no") String review_no,
						Model model,HttpSession session) {
		
		GuestBean guest = (GuestBean)session.getAttribute("guestInfo");
		
		ReviewBean rb = reviewDao.getReviewByNo(review_no);
		model.addAttribute("rb",rb);
		return getPage;
		
	}
	@RequestMapping(value=command,method = RequestMethod.POST)
	public String update1(@ModelAttribute("review") @Valid ReviewBean rb,
   						BindingResult result,@RequestParam("review_no") String review_no,
   						Model model,HttpSession session,HttpServletResponse response) throws IOException {
		
		//System.out.println("rb.gno"+rb.getGno());
		//System.out.println("rb.pno"+rb.getPno());
		
		if(result.hasErrors()) {
			GuestBean guest = (GuestBean)session.getAttribute("guestInfo");
			
			ReviewBean rb1 = reviewDao.getReviewByNo(review_no);
			model.addAttribute("rb",rb1);
			
			return getPage;
		}
		
		int cnt = reviewDao.updateReview(rb);
		System.out.println("cnt:"+cnt);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('리뷰 수정이 완료되었습니다.');");
		writer.println("location.href='myReview.gt'");
		writer.println("</script>");
		
		writer.flush();
		
		return gotoPage;
	}
}
