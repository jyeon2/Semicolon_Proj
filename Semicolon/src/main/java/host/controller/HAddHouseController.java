package host.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import admin.model.SubThemeBean;
import admin.model.SubThemeDao;
import admin.model.ThemeBean;
import admin.model.ThemeDao;
import host.model.AddressBean;
import host.model.AllBean;
import host.model.ContentBean;
import host.model.HostBean;
import host.model.HouseBean;
import host.model.HouseDao;
import order.model.PayforDao;

@Controller
public class HAddHouseController {

	public final String command = "/addHouse.ht";
	public final String selectSub = "selectSubTheme.ht";
	public String getPage = "/addHouseForm";

	@Autowired
	private ThemeDao tdao;

	@Autowired
	private SubThemeDao sdao;

	@Autowired
	private HouseDao housedao;

	@Autowired
	private PayforDao pdao;

	@Autowired
	ServletContext servletContext;

	@Autowired
	ServletContext application;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String add(Model model) {

		List<ThemeBean> tlists = tdao.getThemeCate();
		model.addAttribute("tlists", tlists);

		return getPage;
	}

	@RequestMapping(value=selectSub, method=RequestMethod.POST, produces="application/json; charset=utf-8")
	public @ResponseBody Map<String, Object> selectSubTheme(@RequestParam("t_selValue") String keyword) {
		System.out.println("selectsub 진입");
		System.out.println("t_selValue : " + keyword);

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		
		List<ThemeBean> tlists = tdao.getThemeCate();
		map.put("tlists", tlists);

		map.put("keyword", keyword);
		
		List<SubThemeBean> slists = sdao.getAllSub_ByKeyword(keyword);
		map.put("slists", slists);

		return map;
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public String add(@RequestParam(required = false) MultipartFile[] Insert_images,
			@ModelAttribute("all") @Valid AllBean all, BindingResult result, Model model, HttpSession session,
			HttpServletRequest request, HttpServletResponse response, @RequestParam("t_selValue") String keyword)
			throws IOException {

		if (Insert_images != null) {

			for (MultipartFile multipartFile : Insert_images) {

				String uploadFolder = application.getRealPath("/resources/house_images");

				String uploadFileName = multipartFile.getOriginalFilename();

				System.out.println("uploadFileName:" + uploadFileName);

				uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);

				File saveFile = new File(uploadFolder, uploadFileName);

				try {
					multipartFile.transferTo(saveFile);
				} catch (Exception e) {
					/* log.error(e.getMessage()); */
				}
			}

			String names = "";

			for (MultipartFile multipartFile : Insert_images) {
				for (int i = 0; i < Insert_images.length; i++) {
					System.out.println(multipartFile.getOriginalFilename());
					names += multipartFile.getOriginalFilename();
					System.out.println("i:" + i);
					if (i + 1 != Insert_images.length) {
						names += ","; // 몰라
						break;
					}
				}
			}

			all.setPhoto(names);
		}

		System.out.println("add메서드(POST) 진입");
		if (result.hasErrors()) {

			System.out.println("오류");
			List<ThemeBean> tlists = tdao.getThemeCate();
			model.addAttribute("tlists", tlists);

			model.addAttribute("keyword", keyword);

			List<SubThemeBean> slists = sdao.getAllSub_ByKeyword(keyword);
			model.addAttribute("slists", slists);

			model.addAttribute("all", all);
			return getPage;
		}

		// MultipartFile multi = all.getUpload();
		// 호스트번호 불러오기
		HostBean hbean = (HostBean) session.getAttribute("hostInfo");
		if (hbean == null) {

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요한 항목입니다')");
			out.println("location.href='login.ht?destination=addHouse'");
			out.println("</script>");
		}

		int hno = hbean.getHno();

		// 포인트 = 가격 *0.1
		int point = (int) (Integer.parseInt(all.getPrice()) * 0.01);

		// house DB에 넣기
		HouseBean house = new HouseBean(0, hno, all.getTname(), all.getSname(), all.getName(), all.getFacility(),
				all.getNum(), all.getMaxnum(), all.getPrice(), point, null, all.getPhoto());

		// 이미지 화일 명을 DB에 넣는 작업
		housedao.insertHouse(house);

		// address DB에 넣기
		AddressBean address = new AddressBean(0, 0, all.getAddress(), all.getDetailed());

		housedao.insertAddress(address);

		// content DB에 넣기
		ContentBean content = new ContentBean(0, 0, all.getCon1(), all.getCon2(), all.getCon3(), all.getNotice(),
				all.getRule(), all.getCheckinTime(), all.getCheckoutTime());
		housedao.insertContent(content);

		// 제일 높은 house_no가져오기
		int max_houseno = housedao.selectMax_HouseNo();
		System.out.println("max_houseno : " + max_houseno);

		// payfor에 디폴트 0넣기
		pdao.insertPayfor_default0(max_houseno);

		request.setAttribute("msg", "성공적으로 숙소를 등록하였습니다");
		request.setAttribute("url", "hlist.ht");

		return "/alert";
	}
}