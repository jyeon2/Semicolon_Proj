package admin.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("SubThemeDao")
public class SubThemeDao {
	
	public String namespace = "admin.model.Admin";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public void insertSubTh(SubThemeBean subth) {
		
		sqlSessionTemplate.insert(namespace+".InsertSubTh",subth);
		
	}

	public List<SubThemeBean> getAllSub() {
		
		List<SubThemeBean> lists = new ArrayList<SubThemeBean>();
		
		lists = sqlSessionTemplate.selectList(namespace+".GetAllSub");
		
		return lists;
	}
	
	public List<SubThemeBean> getAllSub_ByKeyword(String keyword) {
		
		List<SubThemeBean> lists = new ArrayList<SubThemeBean>();
		
		lists = sqlSessionTemplate.selectList(namespace+".GetAllSub_ByKeyword",keyword);
		
		return lists;
	}

	public SubThemeBean selectSubBySno(String sno) {
		
		SubThemeBean sb=
		sqlSessionTemplate.selectOne(namespace+".SelectSubBySno",sno);
		
		
		return sb;
	}

	public void deleteSub(String sno) {

		sqlSessionTemplate.delete(namespace+".DeleteSub",sno);
	
		
	}

	public void updateSub(SubThemeBean sbean) {
		
		sqlSessionTemplate.update(namespace+".UpdateSub",sbean);
		
	}

	//테마이름 변경
	public void updateSubTheme(SubThemeBean stb) {
		System.out.println("stb:"+stb.getTheme_cate()+"/"+stb.getName());
		sqlSessionTemplate.update(namespace+".UpdateSubTheme",stb);
	}

	
}
