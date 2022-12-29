package notice.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import notice.model.NoticeBean;
import notice.model.NoticeDao;

@Controller
public class NoticeDetailController {
	private final String command="/ndetail.nt";
	private final String getPage="noticeDetailView";
	
	
	@Autowired
	private NoticeDao noticeDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String nview(@RequestParam("nno") String nno, @RequestParam("pageNumber")String pageNumber,
						Model model, HttpServletRequest request) {
		
		//readcount, list가져오기
		
		noticeDao.readCount(nno);
		NoticeBean notice = noticeDao.getOneRecord(nno);
		
		String loadingPath = request.getContextPath()+"/resources";
		System.out.println("loadingPath:"+loadingPath);
		
		System.out.println("notice.file:"+notice.getNfile());
		
		model.addAttribute("notice",notice);
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("loadingPath",loadingPath);

		return getPage;
	}

}
