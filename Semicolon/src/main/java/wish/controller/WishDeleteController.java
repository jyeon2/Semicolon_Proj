package wish.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import guest.model.GuestBean;
import wish.model.WishBean;
import wish.model.WishDao;

@Controller
public class WishDeleteController {

	private final String command = "deleteHeart.wi";

	@Autowired
	private WishDao wishDao;
	
	@RequestMapping(command)
	public void insert(@RequestParam("houseNo") int no,
						HttpSession session,
						HttpServletResponse response) {
		
		System.out.println("WishDeleteController");
		
		GuestBean gb = (GuestBean) session.getAttribute("guestInfo");
		WishBean wish = new WishBean();
		wish.setGno(gb.getGno());
		wish.setHouse_no(no);
		
		wishDao.deleteWish(wish);
		System.out.println("deleteWish");
		
	}
}
