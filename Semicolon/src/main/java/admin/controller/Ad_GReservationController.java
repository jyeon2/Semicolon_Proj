package admin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import host.model.HostBean;
import host.model.HostDao;
import host.model.HouseDao;
import host.model.ReserveBean;

@Controller
public class Ad_GReservationController {
	private final String command="allRGuest.ad";
	private final String getPage="allReservation_G";
	
	@Autowired
	private HouseDao hdao;
	@Autowired
	private HostDao hostDao;
	
	@RequestMapping(command)
	public String allGuestList(Model model ,HttpSession session) {
		System.out.println("도착2");
		List<ReserveBean> AGlist = new ArrayList<ReserveBean>();
		List<HostBean> hostb = hostDao.getHosts();
		for(HostBean hb : hostb) {
			 int hostno = hb.getHno();
			 System.out.println("hostno확인:" + hostno);
			 
			List<ReserveBean> lists =  hdao.AdminGPageReserve(hostno);
			AGlist.addAll(lists);
			 System.out.println("AGlist.size():"+AGlist.size());
			 //하나로 모든걸 조인
		}//for
			model.addAttribute("AGlist",AGlist);
			
		return getPage;
	}
}
