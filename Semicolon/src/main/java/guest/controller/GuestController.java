package guest.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.model.SubThemeBean;
import admin.model.SubThemeDao;
import admin.model.ThemeBean;
import admin.model.ThemeDao;
import host.model.AllBean;
import host.model.HouseDao;
import review.model.ReviewBean;
import review.model.ReviewDao;

@Controller
public class GuestController {

	private final String command = "home.gt";
	private final String getPage = "home";
	
	@Autowired
	private HouseDao hdao;
	
	@Autowired
	private ThemeDao tdao;
	
	@Autowired
	private SubThemeDao sdao;
	
	@Autowired
	private ServletContext application;
	
	@Autowired
	private ReviewDao reviewDao;
	
	@RequestMapping(command)
	public String home(HttpSession session,Model model,
						HttpServletRequest request) {
		
		System.out.println("GC의 guestInfo:"+session.getAttribute("guestInfo"));
		System.out.println("GC의 admin:"+application.getAttribute("admin"));
		
		ArrayList<ThemeBean> lists = (ArrayList<ThemeBean>)tdao.getAllTheme();
		//model.addAttribute("lists",lists);
		session.setAttribute("themeLists",lists);
		
		List<SubThemeBean> lists1 = sdao.getAllSub();
		//model.addAttribute("lists1",lists1);
		session.setAttribute("subthemeLists",lists1);
		
		List<AllBean> lists2 = hdao.getAllHouse();
		model.addAttribute("allhouseLists", lists2);
		
		String fullpath = request.getContextPath() + "/resources/house_images";
		model.addAttribute("fullpath", fullpath);
		
		//리뷰 불러오기
		List<ReviewBean> reviewList = reviewDao.getReview();
		model.addAttribute("reviewList",reviewList);
		
		return getPage;
	}
}
