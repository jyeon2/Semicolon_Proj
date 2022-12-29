package wish.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("WishDao")
public class WishDao {

	private String namespace = "wish.model.Wish";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<WishBean> selectWishByGno(int gno) {
		List<WishBean> list = null;
		list = sqlSessionTemplate.selectList(namespace+".SelectWishByGno", gno);
		return list;
	}
	
	public int insertWish(WishBean wish) {
		System.out.println(wish.getGno());
		System.out.println(wish.getHouse_no());
		int cnt = sqlSessionTemplate.insert(namespace+".InsertWish", wish);
		System.out.println("insert °³¼ö:"+cnt);
		return cnt;
	}
	
	public void deleteWish(WishBean wish) {
		sqlSessionTemplate.delete(namespace+".DeleteWish", wish);
	}
	
	public int countWishByHouseNo(String houseNo) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".CountWishByHouseNo", houseNo);
		return cnt;
	}
}
