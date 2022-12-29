package guest.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class WishController {

	public final String command="wish.gt";
	public String gotoPage="redirect:/theme.gt";
	
	@RequestMapping(command)
	public String wish(@RequestParam("house_no") int house_no,
						Model model,HttpServletRequest request) {
		
		System.out.println("찜해서 넘어온 house_no : "+house_no);
		
		return gotoPage;
	}
}
