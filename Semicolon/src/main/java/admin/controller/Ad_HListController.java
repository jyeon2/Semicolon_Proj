package admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import host.model.AllBean;
import host.model.HouseDao;

@Controller
public class Ad_HListController {

	public final String command= "hlist.ad";
	public String gotoPage="h_list";
	
	@Autowired
	private HouseDao hdao;
	
	@RequestMapping(command)
	public String hlist(@RequestParam("hno") int hno,
						Model model) {
		
		
		List<AllBean> all_lists = hdao.getAllHouse_ByHno(hno);
		
		model.addAttribute("all_lists",all_lists);
		return gotoPage;
	}
}
