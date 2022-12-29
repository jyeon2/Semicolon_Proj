package admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.model.SubThemeBean;
import admin.model.SubThemeDao;

@Controller
public class Ad_ListSubController {

	public final String command="subList.ad";
	public String gotoPage="/subListForm";
	
	@Autowired
	private SubThemeDao sdao;
	
	@RequestMapping(command)
	public String list(Model model) {
		
		List<SubThemeBean> lists = sdao.getAllSub();
		model.addAttribute("lists",lists);
		
		return gotoPage;
	}
}
