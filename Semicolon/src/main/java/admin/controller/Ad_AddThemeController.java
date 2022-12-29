package admin.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import admin.model.ThemeBean;
import admin.model.ThemeDao;

@Controller
public class Ad_AddThemeController {

	private final String command = "addTheme.ad";
	private String getPage = "/addThemeForm";
	public String gotoPage = "redirect:/themeList.ad";
	
	@Autowired
	private ThemeDao tdao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String addTheme() {
		
		return getPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String addTheme(@ModelAttribute("theme")@Valid ThemeBean theme,
						   BindingResult result,Model model) {
		
		if(result.hasErrors()) {
			
			return getPage;
		}
		
		MultipartFile multi = theme.getUpload();
		System.out.println("multi.getName() : "+multi.getName());
		System.out.println("multi.getOriginalFilename() : "+multi.getOriginalFilename()); 
		System.out.println("product.getImage() : "+theme.getImg());
		
		tdao.insertTheme(theme);
		
		String uploadPath = servletContext.getRealPath("/resources/theme_images");
		System.out.println("uploadPath : "+uploadPath );
		
		File file = new File(uploadPath + "/"+ multi.getOriginalFilename());
		try {
			multi.transferTo(file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return gotoPage;
	}
}
