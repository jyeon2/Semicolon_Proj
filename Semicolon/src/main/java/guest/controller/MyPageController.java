package guest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {

	private final String command = "mypage.gt";
	private final String getPage = "myPage";
	
	@RequestMapping(command)
	public String mypage() {
		return getPage;
	}
}
