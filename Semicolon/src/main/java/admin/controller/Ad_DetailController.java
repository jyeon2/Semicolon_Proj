package admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import order.model.PayforBean;
import order.model.PayforDao;

@Controller
public class Ad_DetailController {
	private final String command = "detailModal.ad";
	
	@Autowired
	private PayforDao payforDao;
	
	@RequestMapping(command)
	public void detail(@RequestParam("gno") int gno,
					   @RequestParam("pno") int pno,
					   HttpServletResponse response,
					   HttpServletRequest request) {
		
		System.out.println("detailModal");
		System.out.println("gno:"+gno);
		System.out.println("pno:"+pno);
		PayforBean payfor = new PayforBean();
		payfor.setGno(gno);
		payfor.setPno(pno);
		PayforBean pb = (PayforBean)payforDao.selectPayforByPno(payfor);
		
		System.out.println("pb:"+pb);
		
		//String에 담아서 , , pb에 있는 것들을
		//그리고 그 String 넘기기
		String pbAll = "";
		
		if(pb != null) {
			System.out.println("pb"+pb);
			pbAll += pb.getPno() + "," + pb.getGno() + "," + pb.getHouse_no() + "," + pb.getWpay() + "," + 
					 pb.getCoupon_no() + "," + pb.getCoupon_price() + "," + pb.getUse_point() + "," + pb.getSt_no() + "," + pb.getSt_price();
			pbAll += "," + pb.getHouse_price() + "," + pb.getExtra_price() + "," + pb.getDiscount_price() + "," + pb.getTotalPoint() + "," + pb.getTotalPrice() + "," + pb.getOrder_no();
			
			String fullpath = request.getContextPath() + "/resources/house_images/";
			pbAll += "," + fullpath+pb.getPhoto() + "," + pb.getCheckin() + "," + pb.getCheckout() + "," + pb.getAdult() + "," + pb.getKid() + "," + pb.getName();
 		}
		
		try {
			PrintWriter writer = response.getWriter();
			writer.print(pbAll);
			writer.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		//return pb;
		
	}
}
