package notice.controller;

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
public class NoticeListController {
	private final String command="/nlist.nt";
	private final String getPage="noticeList";
	
	@Autowired
	private NoticeDao noticeDao;
	
	@RequestMapping(command)
	public ModelAndView nlist(@RequestParam(value="whatColumn", required=false) String whatColumn, 
							 @RequestParam(value="keyword",required=false) String keyword,
						  	 @RequestParam(value="pageNumber",required=false) String pageNumber,
						 	 HttpServletRequest request) {
		
		//넘어온 map 설정
		Map<String,String> map = new HashMap<String,String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");

		//paging 
		int totalCount= noticeDao.getNTotalCount(map);
		String url = request.getContextPath()+"/"+command;
		System.out.println("request.getContextPath(): "+request.getContextPath());
		Paging pageInfo = new Paging(pageNumber,null,totalCount,url,whatColumn,keyword,null);		 

		

		// 목록 불러오기, JSP로 가져갈 것 챙기기.
		ModelAndView mav = new ModelAndView();
		List<NoticeBean> lists = noticeDao.getAllNotice(map,pageInfo);
		mav.addObject("lists",lists); 
		mav.addObject("pageInfo",pageInfo);
			   // pageNumber가 아닌이유 : 정보를 들고가야 다른 부분도 JSP에서 꺼낼 수 있다.
		//notice는 답글이나 댓글이 없음.
		mav.setViewName(getPage);
		return mav;
	}


}
