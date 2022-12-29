package admin.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.CouponBean;
import admin.model.CouponDao;

@Controller
public class Ad_UpdateCouponController {

	public final String command = "updateCoupon.ad";
	public String getPage = "updateCouponForm";
	public String gotoPage = "redirect:/couponList.ad";
	
	@Autowired
	@Qualifier("ACouponDao")
	private CouponDao cdao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String update(@RequestParam("code") String code,
							Model model) {
		
		CouponBean cbean = cdao.selectCoupon_ByCode(code);
		model.addAttribute("code",code);
		model.addAttribute("cb",cbean);
		
		return getPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String update(@ModelAttribute("coupon") @Valid CouponBean coupon,
						BindingResult result,Model model,
						@ModelAttribute("oldCode") String oldCode) {
		
		if(result.hasErrors()) {
			return getPage;
		}
			
		coupon.setOldCode(oldCode);
		cdao.updateCoupon(coupon);
		
		return gotoPage;
	}
}
