package guest.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import guest.model.CouponBean;
import guest.model.CouponDao;
import guest.model.GuestBean;
import guest.model.GuestDao;
import guest.model.SeasonTBean;
import guest.model.SeasonTDao;

@Controller
public class MyProfileController {

	private final String command = "myProfile.gt";
	private final String getPage = "myProfile";
	
	@Autowired
	private GuestDao guestDao;
	
	@Autowired
	@Qualifier("GCouponDao")
	private CouponDao couponDao;
	
	@Autowired
	private SeasonTDao seasonTDao;
	
	@RequestMapping(command)
	public String profile(Model model,
						  HttpSession session) {
		
		GuestBean gb = (GuestBean) session.getAttribute("guestInfo");
		GuestBean guest = guestDao.selectGuestByGno(gb.getGno());
		model.addAttribute("guest",guest);
		
		//내 쿠폰 리스트 가져오기
		ArrayList<CouponBean> couponList = (ArrayList<CouponBean>)couponDao.selectCouponByGno(guest.getGno());
		model.addAttribute("couponList",couponList);
		
		//내 정기권 리스트 가져오기
		ArrayList<SeasonTBean> seasonTList = (ArrayList<SeasonTBean>)seasonTDao.selectSeasonTByGno(guest.getGno());
		model.addAttribute("seasonTList",seasonTList);
		
		return getPage;
	}
	
}
