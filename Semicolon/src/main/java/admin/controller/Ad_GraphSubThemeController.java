package admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import host.model.AllBean;
import host.model.HouseDao;

@Controller
public class Ad_GraphSubThemeController {

	private final String command = "graphSubTheme.ad";
	
	@Autowired
	private HouseDao houseDao;
	
	@RequestMapping(value = command, method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody Map<String, Object> graph(@RequestParam("theme") String theme) {

		System.out.println("theme:"+theme);
		
		HashMap<String, Object> map = new HashMap<String, Object>();

		ArrayList<AllBean> list = (ArrayList<AllBean>) houseDao.graphBySubTheme(theme);
		map.put("list", list);

		return map;
	}
	
}
