package admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import host.model.HostBean;
import host.model.HostDao;

@Controller
public class Ad_AllReservation_Controller {
	
	public final String command = "allRHost.ad";
	public String getPage = "allReservation_H";

	@Autowired
	private HostDao hostDao;
	
	
	@RequestMapping(command)
	public String allHostList(Model model) {
		System.out.println("µµÂø");
	
		List<HostBean> hostb = hostDao.getHosts();
		
		model.addAttribute("hostb",hostb);
		return getPage;
	}
	
}
