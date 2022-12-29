package order.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import guest.model.CouponBean;
import guest.model.CouponDao;
import guest.model.GuestBean;
import guest.model.GuestDao;
import guest.model.SeasonTBean;
import guest.model.SeasonTDao;
import order.model.MailService;
import order.model.PayforBean;
import order.model.PayforDao;

@Controller
public class PayforController {

	private final String command = "payfor.od";
	//private final String gotoPage = "redirect:/myReservation.gt";
	
	@Autowired
	private PayforDao payforDao;

	@Autowired
	private GuestDao guestDao;

	@Autowired
	private SeasonTDao seasonTDao;
	
	@Autowired
	@Qualifier("GCouponDao")
	private CouponDao couponDao;
	
	@Autowired
	private MailService mailService;
	
	@RequestMapping(command)
	public void payfor(@ModelAttribute("payfor") PayforBean payfor,
						 HttpServletResponse response,HttpSession session) {
		System.out.println("PayforController");
		System.out.println("gno:"+payfor.getGno());
		System.out.println("house_no:"+payfor.getHouse_no());
		System.out.println("wpay:"+payfor.getWpay());
		System.out.println("coupon_no:"+payfor.getCoupon_no());
		System.out.println("coupon_price:"+payfor.getCoupon_price());
		System.out.println("use_point:"+payfor.getUse_point()); 
		System.out.println("st_no:"+payfor.getSt_no()); 
		System.out.println("st_price:"+payfor.getSt_price()); 
		System.out.println("house_price:"+payfor.getHouse_price());
		System.out.println("extra_price:"+payfor.getExtra_price());
		System.out.println("discount_price:"+payfor.getDiscount_price()); //X
		System.out.println("totalPoint:"+payfor.getTotalPoint());
		System.out.println("totalPrice:"+payfor.getTotalPrice()); //X
		System.out.println("order_no:"+payfor.getOrder_no());
		
		//할인 금액, 총 결제금액 계산하기 -> form에서 못 넘어옴
		int discount = payfor.getCoupon_price() + payfor.getUse_point() + payfor.getSt_price();
		int total = payfor.getHouse_price()+payfor.getExtra_price()-discount;
		
		payfor.setDiscount_price(discount);
		payfor.setTotalPrice(total);
		payfor.setReview_use(0);
		
		//payfor 테이블에서 insert 하기
		payforDao.insertPayfor(payfor);
		
		//coupon 테이블에서 use 업데이트 하기 (사용했으면 0으로 하기)
		CouponBean coupon = couponDao.selectCouponByCouponNo(payfor.getCoupon_no());
		if(coupon != null) { //쿠폰이 있는 경우
			
			if(payfor.getCoupon_price() == 0) { //coupon_price가 0인 경우 => 사용했다고 하면 안됨
				coupon.setUse(1);
			}
			else { 
				//couponDao.deleteCoupon(coupon);
				coupon.setUse(0);
			}
			
			couponDao.updateUse(coupon);
			System.out.println("updateUse 성공");
			
		}
		
		//쿠폰 삭제
		GuestBean gbean = (GuestBean) session.getAttribute("guestInfo");
		CouponBean cbean = new CouponBean();
		cbean.setGno(gbean.getGno());
		cbean.setCoupon_no(payfor.getCoupon_no());
		couponDao.deleteCoupon_ByCouponNo(cbean);
		
		//guest 테이블에서 mypoint 업데이트 하기 (사용한 포인트 빼기/ 적립예정 포인트 더하기)
		GuestBean guest = guestDao.selectGuestByGno(payfor.getGno());
		int point = guest.getMypoint(); //원래 있던 포인트
		String email = guest.getEmail();//메일발송할 게스트 메일
		guest.setMypoint(point - payfor.getUse_point() + payfor.getTotalPoint());
		guestDao.updateMyPoint(guest);
		System.out.println("updateMyPoint 성공");
		
		//season_t 테이블에서 money 업데이트 하기 (사용한 금액 빼기)
		SeasonTBean stb = seasonTDao.selectSeasonTByStNo(payfor.getSt_no());
		if(stb != null) { //결제권이 있는 경우
			int money = stb.getMoney(); //원래 남은 금액
			stb.setMoney(money - payfor.getSt_price()); //남은금액에서 정기권으로 쓴 금액 빼기
			seasonTDao.updateSeasonTMoney(stb);
			System.out.println("updateSeasonTMoney 성공");
		}
		
		//메일에 발송할 숙소정보들 payfor + order_house 테이블에서 가져오기
		
		payfor = new PayforBean();
		GuestBean gb = (GuestBean)session.getAttribute("guestInfo");
		int gno = gb.getGno();
		System.out.println("gno"+gno);
		
		int pno = payforDao.selectMaxPno();
		payfor.setPno(pno);
		System.out.println("pno"+pno);
		
		payfor.setGno(gno);
		payfor.setPno(pno);
		PayforBean pb = (PayforBean)payforDao.selectPayforByPno(payfor);
		
		String addr = "rlaskrud98@gmail.com";
		String subject = "세미콜론-예약확인 메일입니다";
		String body ="저희 세미콜론 사이트를 이용해주셔서 감사합니다\r\n"
				+ "\r\n 고객님께서 결제하신 숙소 상세내역 입니다\r\n"
				+ "숙소이름 : "+pb.getName()+"\r\n 체크인 : "+pb.getCheckin()+"\r\n"+
				"체크아웃 : "+pb.getCheckout()+"\r\n 성인 : "+pb.getAdult()+"명 \r\n"+
				"유아 : "+pb.getKid()+"명 \r\n --------------------\r\n"+
				"결제방법 : "+pb.getWpay()+"\r\n 총결제금액 : "+pb.getTotalPrice()+"원"+
				"\r\n\r\n 더 자세한 예약내역을 보시려면 사이트를 방문해 주세요";
		
		mailService.sendEmail(email, addr, subject, body);

		response.setContentType("text/html; charset=utf-8");
		try {
			PrintWriter writer = response.getWriter();
			writer.println("<script>");
			writer.println("alert('결제가 완료되었습니다.\\n예약 내역은 메일과 마이페이지에서 확인하실 수 있습니다.')");
			writer.println("location.href='myReservation.gt'");
			writer.println("</script>");
			
			writer.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
}
