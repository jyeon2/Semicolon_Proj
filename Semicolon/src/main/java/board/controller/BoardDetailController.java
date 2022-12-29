package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;

@Controller
public class BoardDetailController {
	private final String command ="/detail.bo";
	private final String getPage ="BoardDetailView";
	
	@Autowired
	private BoardDao boardDao;
	
	@RequestMapping(command)
	public String detailView(@RequestParam("bno")String bno, 
							@RequestParam("pageNumber")String pageNumber,
							Model model) {
		
		//detailview 클릭시 readcount 올리고 list가져오기.
		
		boardDao.readCount(bno);
		BoardBean bee = boardDao.getOneRecord(bno);
		
		model.addAttribute("bee",bee);
		model.addAttribute("pageNumber",pageNumber);
		return getPage;
	}
		
	
	
}
