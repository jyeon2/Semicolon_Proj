package order.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import guest.model.CouponBean;
import guest.model.CouponDao;
import guest.model.GuestBean;

@Controller
public class CouponController {

	private final String command = "coupon.od";
	
	@Autowired
	@Qualifier("GCouponDao")
	private CouponDao couponDao;
	
	@RequestMapping(command)
	public void coupon(@RequestParam("selectCouponNo") int coupon_no,
					   @RequestParam("housePrice") String housePrice,
					   HttpServletResponse response,
					   HttpSession session) {
		System.out.println("CouponController");
		System.out.println("selectCouponNo:"+coupon_no);
		
		/*
		GuestBean gbean = (GuestBean) session.getAttribute("guestInfo");
		CouponBean cbean = new CouponBean();
		cbean.setGno(gbean.getGno());
		cbean.setCoupon_no(coupon_no);
		*/
		
		CouponBean coupon = couponDao.selectCouponByCouponNo(coupon_no);
		//couponDao.deleteCoupon_ByCouponNo(cbean);
		
		int percent = coupon.getPercent(); //퍼센트 할인
		int price = coupon.getSale(); //금액 할인
		System.out.println("percent:"+coupon.getPercent()); 
		System.out.println("sale:"+coupon.getSale()); 
		
		double couponPrice = 0; //쿠폰 할인 금액
		
		int total_price = Integer.valueOf(housePrice.replace(",",""));
		
		if(percent != 0) {
			couponPrice = (double) total_price * (percent * 0.01); 
		}
		
		if(price != 0) {
			couponPrice = price;
		}
		
		System.out.println("couponPrice:"+couponPrice);
		
		//쿠폰 할인 금액 (int)
		int result = (int)couponPrice;
		
		System.out.println("result:"+result);
		
		try {
			PrintWriter out = response.getWriter();
			out.print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
}
