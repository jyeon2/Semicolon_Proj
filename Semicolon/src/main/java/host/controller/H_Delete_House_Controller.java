package host.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import host.model.AllBean;
import host.model.HouseDao;

@Controller
public class H_Delete_House_Controller {

	public final String command = "delete.ht";
	public String gotoPage="redirect:/hlist.ht";
	
	@Autowired
	private HouseDao hdao;
	
	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping(command)
	public String delete(@RequestParam("house_no") String house_no,
						Model model,HttpServletRequest request) {
		System.out.println("delete(house_no) :"+house_no);
		
		//이미지 화일을 지우려는 경로
		String deletePath = servletContext.getRealPath("/resources/house_images");
		//이미지 화일 이름을 가지고 오기
		AllBean allbean = hdao.selectHouse_ByNo(house_no);
		//이미지 화일 까지 삭제하기
		File delFile = new File(deletePath,allbean.getPhoto());
		delFile.delete();
		
		//데이터 완전  삭제하기
		hdao.deleteHouse(house_no);
		
		return gotoPage;
	}
}
