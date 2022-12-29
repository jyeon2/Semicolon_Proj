package host.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import notice.model.NoticeBean;
import notice.model.NoticeDao;
import utility.Paging;

@Controller
public class Host_NListController {
	private final String command="hnlist.ht";
	private final String getPage="NoticeList";
	
	@Autowired
	private NoticeDao noticeDao;
	
	@RequestMapping(command)
	public ModelAndView guestN(@RequestParam(value="whatColumn", required=false) String whatColumn, 
			 			@RequestParam(value="keyword",required=false) String keyword,
			 			@RequestParam(value="pageNumber",required=false) String pageNumber,
			 			HttpServletRequest request) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		//paging 
		int totalCount= noticeDao.getNTotalCount(map);
		System.out.println("ttc:" +totalCount);
		String url = request.getContextPath()+"/"+command;
		System.out.println("url:"+url);
		
		System.out.println("request.getContextPath(): "+request.getContextPath());
		Paging pageInfo = new Paging(pageNumber,null,totalCount,url,whatColumn,keyword,null);		 
		
		ModelAndView mav = new ModelAndView();
		List<NoticeBean> lists = noticeDao.getAllNotice(map,pageInfo);
		mav.addObject("lists",lists); 
		mav.addObject("pageInfo",pageInfo);
		
		mav.setViewName(getPage);
		return mav;
	}
}
