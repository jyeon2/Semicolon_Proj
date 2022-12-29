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
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.SubThemeBean;
import admin.model.SubThemeDao;
import admin.model.ThemeBean;
import admin.model.ThemeDao;
import host.model.HouseBean;
import host.model.HouseDao;

@Controller
public class Ad_UpdateSubController {

	public final String command="updateSub.ad";
	public String getPage = "/updateSubForm";
	public String gotoPage = "redirect:/subList.ad";
	
	@Autowired
	private SubThemeDao sdao;
	
	@Autowired
	private ThemeDao tdao;
	
	@Autowired
	private HouseDao houseDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String update(@RequestParam("sno") String sno,
						Model model) {
		
		List<ThemeBean> lists = tdao.getThemeCate();
		
		
		SubThemeBean sbean = sdao.selectSubBySno(sno);
		model.addAttribute("original_name",sbean.getName());
		
		model.addAttribute("lists",lists);
		model.addAttribute("sb",sbean);
		
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String update(@ModelAttribute("subth") @Valid SubThemeBean subth,
						BindingResult result, Model model,
						@RequestParam("originalSname") String original_name) {
		
		if(result.hasErrors()) {
			
			List<ThemeBean> lists = tdao.getThemeCate();
			model.addAttribute("lists",lists);
			model.addAttribute("original_name",original_name);
			return getPage;
		}
		
		sdao.updateSub(subth);
		
		//서브테마이름 변경시 => 숙소에서도 서브테마이름 변경
		HouseBean hb = new HouseBean();
		hb.setSname(subth.getName());
		hb.setOriginal_name(original_name);
		houseDao.updateHouseSubTheme(hb);
		
		return gotoPage;
	}
}
