package guest.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.SubThemeBean;
import admin.model.ThemeBean;
import guest.model.GuestBean;
import guest.model.GuestDao;
import host.model.AllBean;
import host.model.HouseDao;
import wish.model.WishBean;
import wish.model.WishDao;

@Controller
public class SearchController {
	private final String command="search.gt";
	private final String getPage="SearchList";
	
	@Autowired
	private GuestDao gdao;
	
	@Autowired
	private HouseDao hdao;
	
	@Autowired
	private WishDao wishDao;

	
	@RequestMapping(command)
	public String search_keyword(@RequestParam(value="keyword", required=false)String keyword,
								 @RequestParam(value = "name", required = false) String name,
								 HttpServletRequest request, Model model,
								 HttpSession session) {
		
		if(keyword.equals("")) { //키워드에 값이 없을때
	         return "redirect:/theme.gt";
	      }
		
		List<ThemeBean> slists1 = gdao.getSearchThemeList("%"+keyword+"%"); //tname
		List<SubThemeBean> slists2 = gdao.getSearchSubThemeList("%"+keyword+"%"); //sname

		List<AllBean> lists = new ArrayList<AllBean>(); //전체 최종 숙소
		
		List<AllBean> lists1 = null;
		List<AllBean> lists2 = null;
		boolean flag = false;
	
		for(ThemeBean tb : slists1) {
			System.out.println("들어옴");
			lists1 = hdao.getAllTheme_ByTname(tb.getName());
			System.out.println("lists1: "+ lists1.size());
			if(lists1 != null){
				lists.addAll(lists1);
			}
		
			
		} 
		for(SubThemeBean stb : slists2) {
			System.out.println("들어옴");
			lists2 = hdao.getAllSubTheme_ByTno(stb.getName());
			System.out.println("lists2: "+lists2.size());
			if(lists2 !=null) {
				lists.addAll(lists2);
			}
			
		}
		
		System.out.println("최종숙소개수:"+lists.size());
		
		//이미지불러오기
		String fullpath = request.getContextPath() + "/resources/house_images";
		model.addAttribute("fullpath", fullpath);
		model.addAttribute("slists",lists);
		
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
