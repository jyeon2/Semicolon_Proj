package guest.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import guest.model.CouponBean;
import guest.model.CouponDao;
import guest.model.GuestBean;
import guest.model.GuestDao;

@Controller
public class JoinController {

	private final String command = "join.gt";
	private final String getPage = "join";
	//private final String gotoPage = "redirect:/login.gt";
	
	@Autowired
	private GuestDao guestDao;
	
	@Autowired
	@Qualifier("GCouponDao")
	private CouponDao couponDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String join() {
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String join(@ModelAttribute("guest") @Valid GuestBean gb,
					   BindingResult result,
					   HttpServletResponse response) {
		//System.out.println("JC");
		
		if(result.hasErrors()) {
			return getPage;
		}
		
		guestDao.insertGuest(gb);
		
		//insert한 게스트
		GuestBean guest = guestDao.selectNormalGuestOne(gb);
		
		CouponBean coupon = new CouponBean();
		coupon.setGno(guest.getGno());
		coupon.setCode("welcome");
		coupon.setUse(1);
		
		String joindate = guest.getJoindate();
		System.out.println("JC의 joindate:"+joindate);
		
		String monthDate = null;
		
		//쿠폰의 유효기간을 가입한 시점으로 1달 안에 사용 가능하게끔
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			//String -> Date
			Date date = sdf.parse(joindate);
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(date); 
			
			cal.add(Calendar.MONTH, 1); //1달 더하기
			
			monthDate = sdf.format(cal.getTime());
			
			System.out.println("JC의 cal:"+monthDate);
			
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		
		
		coupon.setPeriod(monthDate);
		
		couponDao.insertCoupon(coupon);
		
		response.setContentType("text/html charset=utf-8");
		try {
			PrintWriter writer = response.getWriter();
			writer.println("<script>");
			writer.println("alert('회원가입을 축하합니다. \\n\\n가입축하쿠폰이 발급되었습니다. \\n(로그인 후 마이페이지에서 쿠폰을 확인할 수 있습니다.)')");
			writer.println("location.href='login.gt'");
			writer.println("</script>");
			
			writer.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
