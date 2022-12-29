package notice.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
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
public class NoticeUpdateController {
	private final String command ="nupdate.nt";
	private final String updateCate="updateCate.nt";
	private final String updateCoupon="updateCoupon.nt";
	private final String getPage ="noticeUpdateForm";
	private final String gotoPage ="redirect:/nlist.nt";
	
	@Autowired
	ServletContext serv;
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private CouponDao cdao;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String updateNotice(@RequestParam("nno") String nno,
							   @RequestParam("pageNumber") String pageNumber,
							   HttpServletRequest request,
							   Model model) {
		//한줄 가져옴
		NoticeBean notice = noticeDao.getOneRecord(nno);
		
		System.out.println("처음진입getNfile"+notice.getNfile());
		System.out.println("처음진입getUpload"+notice.getUpload());
		
		String loadingPath = request.getContextPath()+"/resources";
		System.out.println("loadingPath:"+loadingPath);
		
		List<CouponBean> lists = cdao.getAllCoupon();
		model.addAttribute("lists",lists);
		
		String c_selValue = notice.getCate();
		String content = notice.getContent();
		model.addAttribute("notice",notice); //객체를 보내줘야 업데이트 폼에서 이용 가능.
		model.addAttribute("c_selValue",c_selValue); //카테고리
		model.addAttribute("content",content); //내용
		model.addAttribute("loadingPath",loadingPath);
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("nno",nno);

		return getPage;
	}
	
	@RequestMapping(value=updateCate,method=RequestMethod.GET)
	public String selectCate(@RequestParam("c_selValue") String c_selValue,
							Model model,
							@RequestParam("nno")String nno) {
		
		//한줄 가져옴
		NoticeBean notice = noticeDao.getOneRecord(nno);
		
		if(c_selValue.equals("쿠폰")) {
			
			List<CouponBean> lists = cdao.getAllCoupon();
			model.addAttribute("lists",lists);
			
			model.addAttribute("c_selValue",c_selValue);
			model.addAttribute("notice",notice);
			
			return getPage;
		}
		
		model.addAttribute("c_selValue",c_selValue);
		model.addAttribute("notice",notice);
		
		return getPage;
	}
	
	@RequestMapping(value=updateCoupon,method=RequestMethod.GET)
	public String selectedCoupon(
								@RequestParam("cou_selValue") String cou_selValue,
								@RequestParam("c_selValue") String c_selValue,
								@RequestParam("nno")String nno,
								Model model) {
		
		NoticeBean notice = noticeDao.getOneRecord(nno);
			
		String code = cdao.getCoupon_ByName(cou_selValue);
		model.addAttribute("notice",notice);
		
		List<CouponBean> lists = cdao.getAllCoupon();
		model.addAttribute("lists",lists);
		
		model.addAttribute("code",code);
		
		model.addAttribute("c_selValue",c_selValue);
		model.addAttribute("cou_selValue",cou_selValue);
			
			
		return getPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public ModelAndView updateN(@ModelAttribute("notice") @Valid NoticeBean nb,
								BindingResult result, @RequestParam("originalImg") String originalImg) {
	
		ModelAndView mav = new ModelAndView();
		
		if(result.hasErrors()) {
			System.out.println("에러");
			System.out.println("에러getNfile"+nb.getNfile());
			System.out.println("에러getNno"+nb.getNno());
			System.out.println("에러getTitle"+nb.getTitle());
			System.out.println("에러getContent"+nb.getContent());
			System.out.println("에러getCate"+nb.getCate());
			System.out.println("에러getCoupon"+nb.getCoupon());
			System.out.println("에러getNt_date"+nb.getNt_date());
			System.out.println("에러getN_readcount"+nb.getN_readcount());
			System.out.println("에러getUpload"+nb.getUpload());
			mav.setViewName(getPage);
			return mav;
		}
		

		System.out.println("에러벗어남getUpload"+nb.getUpload());
		if(nb.getUpload()!=null) {
		//1. 이미지 삭제 후 새 이미지 선택시 업로드
		//2. DB에 Update 
		
		System.out.println("오류 아님/이미지 있음 - 성공");
		//이미지 파일도 삭제 기존파일 경로, 기존파일이름
		String uploadPath=serv.getRealPath("/resources");
		File deleteFile= new File(uploadPath,originalImg);
		Boolean de  = deleteFile.delete();
		System.out.println("de"+de);
		
		
		
		System.out.println("getTitle: "+nb.getTitle());
		System.out.println("getCate: "+nb.getCate());
		//새로 선택한 이미지 파일을 담기.
		MultipartFile mul = nb.getUpload();
		System.out.println("mul"+nb.getUpload());
		
		//이미지 올리기
		File file = new File(uploadPath +"/"+ mul.getOriginalFilename());
		System.out.println("44");
		try {
			System.out.println("55");
			mul.transferTo(file); // 진짜파일을 올리는 작업
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		noticeDao.updateNotice(nb);
		
		mav.setViewName(gotoPage);
		return mav;
		
		}
		
		System.out.println("오류 아님/이미지 없음");
		noticeDao.updateNotice_NoImg(nb);
		mav.setViewName(gotoPage);
		return mav;
	}
	
}
