package guest.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import guest.model.GuestBean;
import host.model.AllBean;
import host.model.HouseDao;
import wish.model.WishBean;
import wish.model.WishDao;

@Controller
public class MyWishListController {

	private final String command = "myWishlist.gt";
	private final String getPage = "myWishlist";
	
	@Autowired
	private WishDao wishDao;
	
	
	
	@Autowired
	private HouseDao houseDao;
	
	@RequestMapping(command)
	public String profile(HttpSession session,
						  Model model,
						  HttpServletRequest request) {
		
		GuestBean guest = (GuestBean)session.getAttribute("guestInfo");
		ArrayList<WishBean> wishList = (ArrayList<WishBean>) wishDao.selectWishByGno(guest.getGno());
		
		ArrayList<AllBean> houseList = new ArrayList<AllBean>();
		for(WishBean wish : wishList) {
			AllBean house = houseDao.getHouseByHouse_no(wish.getHouse_no());
			houseList.add(house);
		}

		model.addAttribute("houseList", houseList);
		String fullpath = request.getContextPath()+"/resources/house_images/";
		model.addAttribute("fullpath", fullpath);
		System.out.println("MWLCÀÇ fullpath:"+fullpath);
		
		return getPage;
	}
}
