package admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Ad_CouponController {

	public final String command = "coupon.ad";
	public String getPage = "/couponForm";
	
	
	@RequestMapping(command)
	public String addST() {
		
		return getPage;
	}
}
