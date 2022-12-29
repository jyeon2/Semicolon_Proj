package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.CouponDao;

@Controller
public class Ad_DeleteCouponController {

	public final String command = "deleteCoupon.ad";
	public String gotoPage = "redirect:/couponList.ad";
	
	@Autowired
	private CouponDao cdao;
	
	@RequestMapping(command)
	public String delete(@RequestParam("code") String code,
						Model model) {
		
		cdao.deleteCoupon(code);
		
		return gotoPage;
	}
}
