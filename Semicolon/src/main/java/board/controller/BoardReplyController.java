package board.controller;

import java.sql.Timestamp;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardBean;
import board.model.BoardDao;

@Controller
public class BoardReplyController {
	private final String command="breply.bo";
	private final String getPage="BoardReplyForm";
	private final String gotoPage="redirect:/blist.bo";
	
	@Autowired
	private BoardDao boardDao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String replyForm(@RequestParam("pageNumber")String pageNumber,
							@RequestParam("ref")String ref,
							@RequestParam("re_step")String re_step,
							@RequestParam("re_level")String re_level,
							Model model) {
		
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("ref",ref);
		model.addAttribute("re_step",re_step);
		model.addAttribute("re_level",re_level);
		return getPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public ModelAndView reply(@ModelAttribute("bee") @Valid BoardBean bb,
							BindingResult result,@RequestParam("pageNumber")String pageNumber) {
		ModelAndView mav = new ModelAndView();
		
		//System.out.println("BRC의 bb.ref:"+bb.getRef());
		//System.out.println("BRC의 bb.restep:"+bb.getRe_step());
		//System.out.println("BRC의 bb.relevel:"+bb.getRe_level());
		
		if(result.hasErrors()) {
			System.out.println("에러");
			mav.addObject("pageNumber",pageNumber);
			mav.addObject("ref",bb.getRef());
			mav.addObject("re_step",bb.getRe_step());
			mav.addObject("re_level",bb.getRe_level());
			mav.setViewName(getPage);
			return mav;
		}
		
		bb.setWrite_date(new Timestamp(System.currentTimeMillis()));
		//현재시간이 등록시간이 되도록.
		boardDao.reply_update_f(bb);
		boardDao.reply_insert(bb);
		
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName(gotoPage);
		return mav;
	}
	
}
