package guest.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import guest.model.GuestBean;
import host.model.AllBean;
import host.model.HouseDao;
import wish.model.WishBean;
import wish.model.WishDao;

@Controller
public class ThemeListController {

	private final String command = "theme.gt";
	private final String getPage = "themeForm";

	@Autowired
	private HouseDao hdao;
	
	@Autowired
	private WishDao wishDao;

	@RequestMapping(command)
	public String theme(@RequestParam(value = "name", required = false) String name,
						Model model,
						HttpServletRequest request,
						HttpSession session) {

		
		if (name == null) { //테마 누르면 -> 전체상품나오기 
			List<AllBean> lists1 = hdao.getAllHouse();
			model.addAttribute("lists", lists1);
		} else {
			//테마이름 누르면 -> 해당 테마만 나오기
			List<AllBean> lists = hdao.getAllTheme_ByTname(name);
			model.addAttribute("lists", lists);
		}

		System.out.println("theme을 클릭했을 때 name : " + name);
		model.addAttribute("themeName",name);

		String fullpath = request.getContextPath() + "/resources/house_images";

		model.addAttribute("fullpath", fullpath);
		
		GuestBean gb = (GuestBean) session.getAttribute("guestInfo");
		if(gb != null) {
			List<WishBean> wishList = wishDao.selectWishByGno(gb.getGno());
			
			String houseNos = null;
			if(wishList != null) {
				houseNos = "";
				for(WishBean w : wishList) {
					houseNos += String.valueOf(w.getHouse_no()) + " ";
				}
				System.out.println("STLC의 houseNos:"+houseNos);
				model.addAttribute("houseNos",houseNos);
			}
		}

		return getPage;
		
	}
}