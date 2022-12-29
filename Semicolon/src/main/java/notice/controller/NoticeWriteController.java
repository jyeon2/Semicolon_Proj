package notice.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import admin.model.CouponBean;
import admin.model.CouponDao;
import notice.model.NoticeBean;
import notice.model.NoticeDao;

@Controller
public class NoticeWriteController {
	private final String command="/nwrite.nt";
	private final String selectCate="selectCate.nt";
	private final String selectedCoupon="selectedCoupon.nt";
	private final String getPage="noticeWriteForm";
	private final String gotoPage="redirect:/nlist.nt";

	@Autowired
	private ServletContext sev;
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private CouponDao cdao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String noticewrite() {
		
		return getPage;
	}
	
	@RequestMapping(value=selectCate,method=RequestMethod.GET)
	public String selectCate(@RequestParam("c_selValue") String c_selValue,
							Model model) {
		
		if(c_selValue.equals("쿠폰")) {
			
			List<CouponBean> lists = cdao.getAllCoupon();
			model.addAttribute("lists",lists);
			
			model.addAttribute("c_selValue",c_selValue);
			
			return getPage;
		}
		
		model.addAttribute("c_selValue",c_selValue);
		
		return getPage;
	}
	
	@RequestMapping(value=selectedCoupon,method=RequestMethod.GET)
	public String selectedCoupon(
								@RequestParam("cou_selValue") String cou_selValue,
								@RequestParam("c_selValue") String c_selValue,
								Model model) {
		
		
			
		String code = cdao.getCoupon_ByName(cou_selValue);
		
		List<CouponBean> lists = cdao.getAllCoupon();
		model.addAttribute("lists",lists);
		
		model.addAttribute("code",code);
		
		model.addAttribute("c_selValue",c_selValue);
		model.addAttribute("cou_selValue",cou_selValue);
			
			
		return getPage;
	}
	

	@RequestMapping(value=command,method=RequestMethod.POST)
	public ModelAndView notice(@ModelAttribute("notice")@Valid NoticeBean nb,
								BindingResult result,
								Model model) {
		ModelAndView mav = new ModelAndView();
		
		if(result.hasErrors()) {
			
			mav.setViewName(getPage);
			return mav;
		}
		
		if(nb.getUpload()!=null) {
			
		MultipartFile multi = nb.getUpload(); //3. 여기에 내가 선택한 파일명★이 올라옴.
		System.out.println("multi.getName()"+multi.getName());
		
		String uploadPath= sev.getRealPath("/resources");
		System.out.println("uploadPath: "+ sev.getRealPath("/resources"));
		
		//5.
		File file = new File(uploadPath +"/"+ multi.getOriginalFilename());
		try {
			multi.transferTo(file); // 진짜파일을 올리는 작업
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
			nb.setNt_date(new Timestamp(System.currentTimeMillis()));
			
			noticeDao.insertNotice(nb);//4.경로지정 
			//nb.setNfile(multi.getOriginalFilename());
		}
		
		if(nb.getUpload()==null) {
			
			NoticeBean noticB = new NoticeBean(0,nb.getTitle(),nb.getContent(),nb.getCate(),nb.getCoupon());
			
			noticB.setNt_date(new Timestamp(System.currentTimeMillis()));
			
			noticeDao.insertNotice_NoImg(noticB);
		}
		
		mav.setViewName(gotoPage);
		return mav;
	}
}
