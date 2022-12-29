package admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Ad_AdditionController {

	
	private final String command = "addition.ad";
	private String getPage = "/additionForm";
	
	@RequestMapping(command)
	public String theme() {
		
		return getPage;
	}
}
