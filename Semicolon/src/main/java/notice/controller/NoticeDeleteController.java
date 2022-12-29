package notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import notice.model.NoticeDao;

@Controller
public class NoticeDeleteController {
	private final String command="ndelete.nt";
	private final String gotoPage="redirect:/nlist.nt";
	
	@Autowired
	private NoticeDao noticeDao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String deleteNotice(@RequestParam("nno")String nno, 
							   @RequestParam("pageNumber") String pageNumber,
								Model model) {
		
		
		noticeDao.deleteNotice(nno);
		model.addAttribute("pageNumber",pageNumber);	
		return gotoPage;
	}

}
