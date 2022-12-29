package board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardBean;
import board.model.BoardDao;
import utility.Paging;

@Controller
public class BoardListController {
	private final String command ="/blist.bo";
	private final String getPage ="BoardList";
	
	@Autowired
	private BoardDao boardDao;
	
	@RequestMapping(command)
	public ModelAndView boardList(@RequestParam(value="whatColumn", required=false) String whatColumn, 
								@RequestParam(value="keyword",required=false) String keyword,
								@RequestParam(value="pageNumber",required=false) String pageNumber,
								HttpServletRequest request) {
		
		//넘어온 map 설정
		Map<String,String> map = new HashMap<String,String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");

		//paging 

		int totalCount= boardDao.getTotalCount(map);
		String url = request.getContextPath()+"/"+command;
		System.out.println("request.getContextPath(): "+request.getContextPath());
		Paging pageInfo = new Paging(pageNumber,null,totalCount,url,whatColumn,keyword,null);		 

		

		// 목록 불러오기, JSP로 가져갈 것 챙기기.
		ModelAndView mav = new ModelAndView();
		List<BoardBean> lists = boardDao.getBoardList(map,pageInfo);
				//new ArrayList<BoardBean>();
		mav.addObject("lists",lists); 
		
		mav.addObject("pageInfo",pageInfo);
			   // pageNumber가 아닌이유 : 정보를 들고가야 다른 부분도 JSP에서 꺼낼 수 있다.
		
		mav.setViewName(getPage);
		return mav;
	}
	 
	
}
