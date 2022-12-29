package guest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SeasonTController {

	public final String command = "seasonT.gt";
	public String gotoPage = "seasonT_Form";
	
	@RequestMapping(command)
	public String command() {
		
		return gotoPage;
	}
}
