package host.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import host.model.AllBean;
import host.model.HostBean;
import host.model.HouseDao;

@Controller
public class H_List_House_Controller {

	public final String command = "hlist.ht";
	public String gotoPage = "/houseList";
	
	@Autowired
	private HouseDao hdao;
	
	@RequestMapping(command)
	public String list(Model model,HttpSession session) {
		
		HostBean host_Bean = (HostBean)session.getAttribute("hostInfo");
		int hno = host_Bean.getHno();
		System.out.println("h_List(hno) : "+hno);
		
		List<AllBean> all_lists = hdao.getAllHouse_ByHno(hno);
		System.out.println("all_lists.size() : "+all_lists.size());
		
		model.addAttribute("all_lists",all_lists);
		
		return gotoPage;
	}
}
