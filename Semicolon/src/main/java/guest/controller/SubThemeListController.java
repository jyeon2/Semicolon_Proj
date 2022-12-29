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
public class SubThemeListController {
	
	private final String command = "subtheme.gt";
	private final String getPage = "subthemeForm";
	
	@Autowired
	private HouseDao hdao;
	
	@Autowired
	private WishDao wishDao;
	
	@RequestMapping(command)
	public String subtheme(@RequestParam("name") String name,
							Model model,
							HttpServletRequest request,
							HttpSession session) {

		List<AllBean> lists = hdao.getAllSubTheme_ByTno(name);
		String fullpath = request.getContextPath() + "/resources/house_images";

		model.addAttribute("subThemeList", lists);
		model.addAttribute("fullpath", fullpath);
		model.addAttribute("subthemeName",name);
		
		GuestBean gb = (GuestBean) session.getAttribute("guestInfo");
		if(gb != null) {
			List<WishBean> wishList = wishDao.selectWishByGno(gb.getGno());
			
			String houseNos = null;
			if(wishList != null) {
				houseNos = "";
				for(WishBean w : wishList) {
					houseNos += String.valueOf(w.getHouse_no()) + " ";
				}
				System.out.println("STLCÀÇ houseNos:"+houseNos);
				model.addAttribute("houseNos",houseNos);
			}
		}
		
		return getPage;

	}
}
