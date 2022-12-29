package admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.model.ThemeBean;
import admin.model.ThemeDao;

@Controller
public class Ad_ListThemeController {

	public final String command="themeList.ad";
	public String gotoPage="/themeList";
	
	@Autowired
	private ThemeDao tdao;
	
	@RequestMapping(command)
	public String list(Model model,HttpServletRequest request) {
		
		List<ThemeBean> lists = tdao.getAllTheme();
		
		String fullpath = request.getContextPath()+"/resources/theme_images";
		
		model.addAttribute("lists",lists);
		model.addAttribute("fullpath",fullpath);
		
		return gotoPage;
	}
}
