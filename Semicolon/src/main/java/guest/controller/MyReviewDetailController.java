package guest.controller;	

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import review.model.ReviewBean;
import review.model.ReviewDao;

@Controller
public class MyReviewDetailController {

	private final String command = "reviewDetail.gt";
	
	@Autowired
	private ReviewDao reviewDao;
	
	@RequestMapping(command)
	public void detail(@RequestParam("gno") int gno,
					   @RequestParam("pno") int pno,
					   HttpServletResponse response,
					   HttpServletRequest request,Model model) {
		
		System.out.println("myReviewDetailController");
		System.out.println("gno:"+gno);
		System.out.println("pno:"+pno);
		ReviewBean review = new ReviewBean();
		review.setGno(gno);
		review.setPno(pno);
		ReviewBean rb = reviewDao.selectReviewByPno(review);
		
		model.addAttribute("rb",rb);
		
		System.out.println("rb:"+rb);
		
		//String에 담아서 , , rb에 있는 것들을
		//그리고 그 String 넘기기
		String rbAll = "";
		
		if(rb != null) {
			System.out.println("rb"+rb);
			rbAll += rb.getReview_no() + "," +rb.getPno() + "," + rb.getGno() + "," + rb.getHouse_no() + "," + rb.getName() + "," + 
					rb.getCheckin() + "," + rb.getCheckout() + "," + rb.getTotal() + "," + rb.getText() + "," + rb.getReviewdate();
 		}
		
		try {
			PrintWriter writer = response.getWriter();
			writer.print(rbAll);
			writer.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		//return b;
		
	}
	
	
	
}
