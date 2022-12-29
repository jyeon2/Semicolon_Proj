package admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.model.CouponBean;
import admin.model.CouponDao;

@Controller
public class Ad_ListCouponeController {

	public final String command = "couponList.ad";
	public String gotoPage = "couponList";
	
	@Autowired
	private CouponDao cdao;
	
	@RequestMapping(command)
	public String list(Model model) {
		
		List<CouponBean> lists = cdao.getAllCoupon();
		
		model.addAttribute("lists",lists);
		return gotoPage;
	}
}
