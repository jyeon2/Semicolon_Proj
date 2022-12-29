package order.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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

import guest.model.CouponBean;
import guest.model.CouponDao;
import guest.model.GuestBean;
import guest.model.GuestDao;
import guest.model.SeasonTBean;
import guest.model.SeasonTDao;
import host.model.AllBean;
import host.model.HouseDao;
import order.model.OrderBean;
import order.model.OrderDao;
import wish.model.WishDao;

@Controller
public class OrderController {

	private final String command = "order.od";
	private String getPage = "orderForm";
	private String gotoPage = "detailForm";
	
	@Autowired
	private GuestDao guestDao;
	
	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	@Qualifier("GCouponDao")
	private CouponDao couponDao;
	
	@Autowired
	private SeasonTDao seasonTDao;
	
	@Autowired
	private HouseDao houseDao;
	
	@Autowired
	private WishDao wishDao;
	
	
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String order(HttpServletRequest request, Model model,
						@ModelAttribute("order") @Valid OrderBean order,
						BindingResult result,
						@RequestParam("num") int num, //기준인원수
						@RequestParam("price") int price, //숙소 1박 가격
						@RequestParam("name") String name, //숙소 이름
						HttpSession session) {
		
		if(result.hasErrors()) {
			int house_no  = order.getHouse_no();
			AllBean hb = houseDao.selectHouse_ByNo(String.valueOf(house_no));
			String fullpath = request.getContextPath() + "/resources/house_images";
			int wishCount = wishDao.countWishByHouseNo(String.valueOf(house_no));
			
			ArrayList<String> numberList = new ArrayList<String>();
			int maxnum = Integer.parseInt(hb.getMaxnum());
			
			for(int i=1; i<=maxnum; i++) {
				numberList.add(String.valueOf(i));
			}
			
			model.addAttribute("numberList",numberList);
			model.addAttribute("hb", hb);
			model.addAttribute("fullpath", fullpath);
			model.addAttribute("wishCount", wishCount);
			return gotoPage;
		}
		
		int extra_price = 0;
		int adult = Integer.parseInt(order.getAdult());
		int kid = Integer.parseInt(order.getKid());
		if((adult+kid) <= num) { //기준 인원수에 맞음
			System.out.println("기준 인원 충족");
			
		}else { //기준 인원 초과 시
			if(adult == num) { //성인 = 기준인원
				System.out.println("성인 = 기준인원");
				extra_price = 10000 * kid;
				System.out.println("extra:"+extra_price);	
			}
			else if(adult < num) { //성인 < 기준인원
				System.out.println("성인 < 기준인원");
				num = num-adult; //유아의 기준인원
				System.out.println("num : "+num);
				if(kid > num) {
					extra_price = 10000*(kid-num);
				}
				System.out.println("extra:"+extra_price);	
			}
			else { //성인 > 기준인원
				System.out.println("성인 > 기준인원");
				extra_price = 20000*(adult-num);
				extra_price += 10000*kid;
				System.out.println("extra:"+extra_price);	
			}
			
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date checkin_date = null;
		Date checkout_date = null;
		try {
			checkin_date = sdf.parse(order.getCheckin());
			checkout_date = sdf.parse(order.getCheckout());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		//총 몇박인지
		long in_date = checkin_date.getTime();
		long out_date = checkout_date.getTime();
		  
		long diffSec = (out_date - in_date) / 1000; //초 차이
		long diffDays = diffSec / (24*60*60); //일자수 차이
		
		//몇박에 대한 가격
		int house_totalprice = (int) (price*diffDays);
		order.setHouse_price(house_totalprice);
		
		//몇박에 대한 포인트
		int totalPoint = (int) (house_totalprice*0.01);
		System.out.println("totalPoint:"+totalPoint);
		
		//할인금액 없는 총 가격
		int totalPrice = house_totalprice + extra_price;
		
		//게스트 정보
		GuestBean guest = (GuestBean)session.getAttribute("guestInfo");
		int gno = guest.getGno();
		System.out.println("gno : "+gno);
		order.setGno(gno);
		GuestBean gb = guestDao.selectGuestByGno(gno);
		
		//사진
		order.setPhoto(order.getPhoto());
		
		//int cnt = orderDao.countOrder(order);
		//order 테이블에 insert
		orderDao.insertOrder(order);
		
		//order 테이블에서 insert한거 가져오기 (=> 제일 마지막에 insert한 것은 order_no가 제일 큰거)
		int max = orderDao.maxOrderNo();
		order.setOrder_no(max);
		OrderBean orderbean = orderDao.selectOrder(order);
		
		String fullpath = request.getContextPath()+"/resources/house_images";
		
		model.addAttribute("fullpath",fullpath);
		model.addAttribute("oname",name);
		model.addAttribute("ob",orderbean);
		model.addAttribute("extra_price",extra_price);
		model.addAttribute("totalPrice",totalPrice);
		model.addAttribute("totalPoint",totalPoint);
		model.addAttribute("date",(int)diffDays);
		model.addAttribute("mypoint",gb.getMypoint());
		
		//내 쿠폰 리스트 가져오기
		ArrayList<CouponBean> couponList = (ArrayList<CouponBean>)couponDao.selectCouponByGno(gno);
		model.addAttribute("couponList",couponList);
		//System.out.println("period:"+couponList.get(0).getPeriod());
		
		//내 정기권 리스트 가져오기
		ArrayList<SeasonTBean> seasonTList = (ArrayList<SeasonTBean>)seasonTDao.selectSeasonTByGno(gno);
		model.addAttribute("seasonTList",seasonTList);
		System.out.println("seasonTList:"+seasonTList.size());
		
		return getPage;
				
	}
	
	
}
