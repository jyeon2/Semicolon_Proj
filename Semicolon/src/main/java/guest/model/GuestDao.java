package guest.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import admin.model.SubThemeBean;
import admin.model.ThemeBean;

@Component("GuestDao")
public class GuestDao {

	private String namespace = "guest.model.Guest";

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void insertGuest(GuestBean gb) {
		sqlSessionTemplate.insert(namespace + ".InsertGuest", gb);
	}

	public boolean checkEmailPassword(GuestBean guest) {
		GuestBean gb = null;
		gb = sqlSessionTemplate.selectOne(namespace + ".CheckEP", guest);
		if (gb == null) {
			return false; // 없음 -> 로그인X
		} else {
			return true; // 있음 -> 로그인O
		}
	}

	public GuestBean findId(GuestBean guest) {
		GuestBean gb = null;
		gb = sqlSessionTemplate.selectOne(namespace + ".FindId", guest);
		return gb;
	}

	public GuestBean findPw(GuestBean guest) {
		GuestBean gb = null;
		gb = sqlSessionTemplate.selectOne(namespace + ".FindPw", guest);
		return gb;
	}

	public void insertKakaoGuest(GuestBean gb) {
		sqlSessionTemplate.insert(namespace + ".InsertKakaoGuest", gb);
	}

	public GuestBean selectKakaoGuestOne(GuestBean guest) {
		GuestBean gb = null;
		gb = sqlSessionTemplate.selectOne(namespace + ".SelectKakaoGuest", guest);
		return gb;
	}

	public GuestBean selectNormalGuestOne(GuestBean guest) {
		GuestBean gb = null;
		gb = sqlSessionTemplate.selectOne(namespace + ".SelectNormalGuest", guest);
		return gb;
	}

	public GuestBean searchEmail(String useremail) {
		GuestBean gb = null;
		gb = sqlSessionTemplate.selectOne(namespace + ".SearchEmail", useremail);
		return gb;
	}

	public void updateNormalGuest(GuestBean guest) {
		sqlSessionTemplate.update(namespace + ".UpdateNormalGuest", guest);
	}

	public void updateKakaoGuest(GuestBean guest) {
		sqlSessionTemplate.update(namespace + ".UpdateKakaoGuest", guest);
	}

	public List<ThemeBean> getSearchThemeList(String keyword) {
		System.out.println(keyword);
		List<ThemeBean> Slists = sqlSessionTemplate.selectList(namespace + ".GetSearchThemeList", keyword);
		System.out.println("slists : " + Slists.size());
		return Slists;
	}

	public List<SubThemeBean> getSearchSubThemeList(String keyword) {
		System.out.println(keyword);
		List<SubThemeBean> Slists = sqlSessionTemplate.selectList(namespace + ".GetSearchSubThemeList",
				"%" + keyword + "%");
		System.out.println("slists : " + Slists.size());
		return Slists;
	}

	public GuestBean selectGuestByGno(int gno) {
		GuestBean gb = null;
		gb = sqlSessionTemplate.selectOne(namespace + ".SelectGuestByGno", gno);
		return gb;
	}

	public void updateMyPoint(GuestBean guest) {
		sqlSessionTemplate.update(namespace + ".UpdateMyPoint", guest);
	}

	public void deleteGuest(int gno) {
		sqlSessionTemplate.delete(namespace + ".DeleteGuest", gno);
	}

	public void updateCoupon_code(GuestBean gbean) {

		sqlSessionTemplate.insert(namespace + ".UpdateCoupon_code", gbean);

	}
	
	public List<GuestBean> yearMonthGuest(String start_date) {
		List<GuestBean> lists = sqlSessionTemplate.selectList(namespace + ".YearMonthGuest", start_date);
		return lists;
	}

	public int todayGuest() {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".TodayGuest");
		return cnt;
	}

	public int yesterdayGuest(String yesterday) {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".YesterdayGuest", yesterday);
		return cnt;
	}

}
