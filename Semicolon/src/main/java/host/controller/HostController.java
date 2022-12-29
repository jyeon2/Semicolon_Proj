package host.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.model.SubThemeBean;
import admin.model.SubThemeDao;
import admin.model.ThemeBean;
import admin.model.ThemeDao;

@Controller
public class HostController {

	private final String command = "/home.ht";
	private final String getPage = "/home";
	
	@Autowired
	private ThemeDao tdao;
	
	@Autowired
	private SubThemeDao sdao;
	
	@Autowired
	private ServletContext application;
	
	@RequestMapping(command)
	public String home(Model model, HttpSession session) {
		
		List<ThemeBean> tlists = tdao.getThemeCate();
		List<SubThemeBean> slists = sdao.getAllSub();
		
		model.addAttribute("tlists",tlists);
		model.addAttribute("slists",slists);
		
		System.out.println("HCÀÇ hostInfo:"+session.getAttribute("hostInfo"));
		System.out.println("HCÀÇ admin:"+application.getAttribute("admin"));
		
		return getPage;
	}
}
