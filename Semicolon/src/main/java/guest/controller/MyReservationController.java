package guest.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import guest.model.GuestBean;
import order.model.PayforBean;
import order.model.PayforDao;

@Controller
public class MyReservationController {

	private final String command = "myReservation.gt";
	private final String getPage = "myReservation";
	
	@Autowired
	private PayforDao payforDao;
	
	@RequestMapping(command)
	public String reservation(HttpSession session,
							  Model model) {
		GuestBean guest = (GuestBean)session.getAttribute("guestInfo");
		ArrayList<PayforBean> list = (ArrayList<PayforBean>)payforDao.selectPayforByGno(guest.getGno());
		model.addAttribute("list",list);
		
		return getPage;
	}
	
}
