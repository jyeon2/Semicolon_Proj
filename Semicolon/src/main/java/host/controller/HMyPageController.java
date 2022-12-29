package host.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HMyPageController {

	private final String command = "mypage.ht";
	private final String getPage = "myPage";
	
	@RequestMapping(command)
	public String mypage() {
		return getPage;
	}
}
