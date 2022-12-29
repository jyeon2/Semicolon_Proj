package admin.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("ThemeDao")
public class ThemeDao {

	private String namespace="admin.model.Admin";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public void insertTheme(ThemeBean theme) {
		
		sqlSessionTemplate.insert(namespace+".InsertTheme",theme);
		
	}

	public List<ThemeBean> getAllTheme() {
		
		List<ThemeBean> lists = new ArrayList<ThemeBean>();
		lists = 
		sqlSessionTemplate.selectList(namespace+".GetAllTheme");
		
		return lists;
	}

	public void deleteTheme(String tno) {
		
		sqlSessionTemplate.delete(namespace+".DeleteTheme",tno);
		
	}

	public ThemeBean selectByTno(String tno) {
		
		ThemeBean theme =
		sqlSessionTemplate.selectOne(namespace+".SelectByTno",tno);
		
		return theme;
	}

	public void updateTheme(ThemeBean theme) {
		
		sqlSessionTemplate.update(namespace+".UpdateTheme",theme);
		
	}

	public List<ThemeBean> getThemeCate() {
		
		List<ThemeBean> lists = new ArrayList<ThemeBean>();
		lists =
		sqlSessionTemplate.selectList(namespace+".GetThemeCate");
		
		return lists;
		
	}
	
	
}
