package wish.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
public class WishInsertController {
	private final String command = "insertHeart.wi";
	
	@Autowired
	private WishDao wishDao;
	
	@RequestMapping(command)
	public void insert(@RequestParam("houseNo") int no,
						HttpSession session,
						HttpServletResponse response) {
		
		System.out.println("WishInsertController");
		
		GuestBean gb = (GuestBean) session.getAttribute("guestInfo");
		WishBean wish = new WishBean();
		wish.setGno(gb.getGno());
		wish.setHouse_no(no);
		
		int result = 0;
		result = wishDao.insertWish(wish);
		System.out.println("insertWish");
		
	}
}
