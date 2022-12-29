package host.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HAdditionController {

	public final String command = "/addition.ht";
	public String gotoPage = "/additionForm";
	@RequestMapping(command)
	public String addition() {
		
		System.out.println("HAdditionController ¡¯¿‘");
		return gotoPage;
	}
}
