package review.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import order.model.PayforDao;
import review.model.ReviewBean;
import review.model.ReviewDao;

@Controller
public class ReviewDeleteController {
   
   private final String command = "reviewdelete.rv";
   private final String gotoPage = "redirect:/myReview.gt";
   
   @Autowired
   private ReviewDao reviewDao;
   
   @Autowired
   private PayforDao payforDao;

   @RequestMapping(command)
   public String update(@RequestParam("review_no") String review_no,
                  HttpServletResponse response) throws IOException {

      ReviewBean review = reviewDao.selectReviewByReviewNo(Integer.valueOf(review_no));
      payforDao.updateReviewUse0(review.getPno());
      reviewDao.reviewDelete(review_no);
      
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter writer = response.getWriter();
      writer.println("<script>");
      writer.println("alert('리뷰 삭제가 완료되었습니다.');");
      writer.println("location.href='myReview.gt'");
      writer.println("</script>");
      
      writer.flush();
      
      return gotoPage;
      
   }
}