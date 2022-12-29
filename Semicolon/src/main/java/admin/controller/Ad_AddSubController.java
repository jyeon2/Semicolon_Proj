package admin.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import admin.model.SubThemeBean;
import admin.model.SubThemeDao;
import admin.model.ThemeBean;
import admin.model.ThemeDao;

@Controller
public class Ad_AddSubController {

	public final String command= "addSubTheme.ad";
	public String getPage = "/addSubForm";
	public String gotoPage = "redirect:/subList.ad";
	
	@Autowired
	private SubThemeDao sdao;
	
	@Autowired
	private ThemeDao tdao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String addSub(Model model) {
		
		List<ThemeBean> lists = tdao.getThemeCate();
		model.addAttribute("lists",lists);
		
		return getPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String addSub(@ModelAttribute("subth") @Valid SubThemeBean subth,
						BindingResult result,Model model) {
		System.out.println("addSub ¡¯¿‘");
		if(result .hasErrors()) {
			
			List<ThemeBean> lists = tdao.getThemeCate();
			model.addAttribute("lists",lists);
			
			return getPage;
		}
		
		sdao.insertSubTh(subth);
		
		return gotoPage;
	}
}
