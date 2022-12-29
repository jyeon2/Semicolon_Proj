package guest.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("mySeasonT")
public class SeasonTDao {

	private String namespace="guest.model.Guest";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public void insertSeasonT(SeasonTBean stb) {
		
		sqlSessionTemplate.insert(namespace+".InsertSeasonT",stb);
		
	}
	
	public List<SeasonTBean> selectSeasonTByGno(int gno) {
		List<SeasonTBean> list = null;
		list = sqlSessionTemplate.selectList(namespace+".SelectSeasonTByGno",gno);
		return list;
	}
	
	public SeasonTBean selectSeasonTByStNo(int st_no) {
		SeasonTBean stb = null;
		stb = sqlSessionTemplate.selectOne(namespace+".SelectSeasonTByStNo",st_no);
		return stb;
	}
	
	public void updateSeasonTMoney(SeasonTBean stb) {
		int cnt = sqlSessionTemplate.update(namespace+".UpdateSeasonTMoney",stb);
		System.out.println("STDÀÇ updateSeasonTMoney cnt:"+cnt);
	}
	
}
