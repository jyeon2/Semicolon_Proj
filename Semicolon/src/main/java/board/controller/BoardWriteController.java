package board.controller;

import java.sql.Timestamp;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardBean;
import board.model.BoardDao;

@Controller
public class BoardWriteController {
	private final String command ="/bwrite.bo";
	private final String getPage ="BoardWriteForm";
	private final String gotoPage ="redirect:/blist.bo";
	
	@Autowired
	private BoardDao boardDao;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String write() {
		return getPage;
	}
	
	
	
	@RequestMapping(value=command,method = RequestMethod.POST)
	public ModelAndView write(@ModelAttribute("bee") @Valid BoardBean bb,
								BindingResult result) {
		ModelAndView mav = new ModelAndView();
		
		if(result.hasErrors()) {
			mav.setViewName(getPage);
			return mav;
		}
		
		System.out.println("bb.writer"+bb.getWriter());
		System.out.println("bb.email"+bb.getEmail());
		System.out.println("bb.pw"+bb.getPw());
		
		
		bb.setWrite_date(new Timestamp(System.currentTimeMillis()));
		//날짜 제대로 표시하려고. : submit 하는 시간에 자동으로 등록된다.
		boardDao.insertBoard(bb);
		mav.setViewName(gotoPage);
		
		return mav;
	}
}