package guest.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import guest.model.GuestBean;
import review.model.ReviewBean;
import review.model.ReviewDao;

@Controller
public class MyReviewController {
	
	private final String command = "myReview.gt";
	private final String getPage = "myReview";
	
	@Autowired
	private ReviewDao reviewDao;
	
	@RequestMapping(command)
	public String review(HttpSession session, Model model) {
		
		GuestBean guest = (GuestBean)session.getAttribute("guestInfo");
		List<ReviewBean> reviewList = reviewDao.selectReview(guest.getGno());
		
		model.addAttribute("reviewList",reviewList);
		return getPage;
		
	}
}
