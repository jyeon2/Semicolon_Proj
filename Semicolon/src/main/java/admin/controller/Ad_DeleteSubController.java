package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.SubThemeDao;

@Controller
public class Ad_DeleteSubController {

	public final String command="deleteSub.ad";
	public String gotoPage = "redirect:/subList.ad";
	
	@Autowired
	private SubThemeDao sdao;
	
	@RequestMapping(command)
	public String delete(@RequestParam("sno") String sno,
						Model model) {
		
		sdao.deleteSub(sno);
		
		
		return gotoPage;
	}
}
