package admin.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import admin.model.CouponBean;
import admin.model.CouponDao;

@Controller
public class Ad_AddCouponeController {

	public final String command= "addCoupon.ad";
	public String getPage = "addCouponForm";
	public String gotoPage = "redirect:/couponList.ad";
	
	@Autowired
	private CouponDao cdao;
	
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String addCoupone() {
		
		return getPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String addCoupone(@ModelAttribute("coupon") @Valid CouponBean coupon,
							BindingResult result) {
		
		if(result.hasErrors()) {
			System.out.println("¿À·ù");
			return getPage;
		}
		
		cdao.insertCoupon(coupon);
		
		return gotoPage;
	}
}
