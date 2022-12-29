package guest.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import host.model.AllBean;
import host.model.HouseDao;
import review.model.ReviewBean;
import review.model.ReviewDao;
import wish.model.WishDao;

@Controller
public class DetailViewController {

	private final String command = "detail.gt";
	private final String getPage = "detailForm";

	@Autowired
	private HouseDao houseDao;

	@Autowired
	private WishDao wishDao;
	
	@Autowired
	private ReviewDao reviewDao;
	
	@RequestMapping(command)
	public ModelAndView detail(@RequestParam("house_no") String house_no, 
								HttpServletRequest request) {

		AllBean hb = houseDao.selectHouse_ByNo(house_no);
		ModelAndView mav = new ModelAndView();

		String fullpath = request.getContextPath() + "/resources/house_images";
		
		//찜 개수 세기
		int wishCount = wishDao.countWishByHouseNo(house_no);
		
		//최대인원 리스트 만들기
		System.out.println(hb.getMaxnum());
		ArrayList<String> numberList = new ArrayList<String>();
		int maxnum = Integer.parseInt(hb.getMaxnum());
		
		for(int i=1; i<=maxnum; i++) {
			numberList.add(String.valueOf(i));
		}
		
		//오늘 날짜 계산
		LocalDate now = LocalDate.now();
		System.out.println("now:"+now);
		
		// 리뷰 불러오기
		List<ReviewBean> reviewList = reviewDao.getReviewByHouseno(house_no);
		ReviewBean rb = reviewDao.reviewAvg(house_no); //리뷰 별점 평균
		
		mav.addObject("rb",rb);
		mav.addObject("reviewList", reviewList);
		mav.addObject("numberList",numberList);
		mav.addObject("hb", hb);
		mav.addObject("fullpath", fullpath);
		mav.addObject("wishCount", wishCount);
		mav.addObject("now", now);
		mav.setViewName(getPage);
		return mav;

	}
}
