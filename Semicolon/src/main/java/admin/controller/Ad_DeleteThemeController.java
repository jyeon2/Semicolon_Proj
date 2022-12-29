package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.ThemeDao;

@Controller
public class Ad_DeleteThemeController {

	public final String command = "deleteTheme.ad";
	public String gotoPage = "redirect:/themeList.ad";
	
	@Autowired
	private ThemeDao tdao;
	
	@RequestMapping(command)
	public String delete(@RequestParam("tno") String tno,
						Model model) {
		
		tdao.deleteTheme(tno);
		
		return gotoPage;
	}
}
