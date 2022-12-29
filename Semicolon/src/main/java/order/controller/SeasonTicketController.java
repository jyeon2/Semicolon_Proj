package order.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import guest.model.CouponBean;
import guest.model.SeasonTBean;
import guest.model.SeasonTDao;

@Controller
public class SeasonTicketController {
	
	private final String command = "seasonTicket.od";
	
	@Autowired
	private SeasonTDao seasonTDao;
	
	@RequestMapping(command)
	public void seasonT(@RequestParam("selectSeasonTNo") int st_no,
						@RequestParam("totalPrice") String totalPrice,
						HttpServletResponse response) {
		System.out.println("SeasonTicketController");
		System.out.println("selectSeasonTNo:"+st_no);
		
		SeasonTBean stb = seasonTDao.selectSeasonTByStNo(st_no);
		
		int money = stb.getMoney(); //남은 금액
		int total_price = Integer.valueOf(totalPrice.replace(",", "")); //최종 금액
		
		int payment = 0; //정기권으로 결제한 금액
		
		if(money >= total_price) {
			payment = total_price;
			money -= total_price;
			stb.setMoney(money);
			
		}
		else {
			payment = money;
			stb.setMoney(0);
		}
		
		System.out.println("stb.st_no:"+stb.getSt_no());
		System.out.println("stb.gno:"+stb.getGno());
		System.out.println("stb.t_c:"+stb.getTicket_choice());
		System.out.println("stb.money:"+stb.getMoney());
		//seasonTDao.updateSeasonTMoney(stb); //남은 금액 update -> 결제할때 해야함**
		
		System.out.println("payment:"+payment);
		
		try {
			PrintWriter out = response.getWriter();
			out.print(payment);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
}
