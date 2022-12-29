package host.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("HostDao")
public class HostDao {

	String namespace = "host.model.Host";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public HostBean hostfindId(HostBean host) {
		HostBean hb = null;
		hb = sqlSessionTemplate.selectOne(namespace + ".HostfindId", host);
		return hb;
	}

	public HostBean hostfindPw(HostBean host) {
		HostBean hb = null;
		hb = sqlSessionTemplate.selectOne(namespace + ".HostfindPw", host);
		return hb;
	}

	public boolean checkEmailPassword(HostBean host) {
		System.out.println("HD");
		System.out.println(host.getEmail());
		System.out.println(host.getPassword());
		HostBean hb = null;
		hb = sqlSessionTemplate.selectOne(namespace + ".CheckEP", host);
		if (hb == null) {
			System.out.println("없음");
			return false; // 없음 -> 로그인X
		} else {
			System.out.println("있음");
			return true; // 있음 -> 로그인O
		}
	}

	public void insertHost(HostBean hb) {
		sqlSessionTemplate.insert(namespace + ".InsertHost", hb);

	}

	public HostBean selectHostOne(HostBean host) {
		HostBean hb = null;
		hb = sqlSessionTemplate.selectOne(namespace + ".selectHostOne", host);
		return hb;
	}

	public HostBean searchEmail(String useremail) {
		HostBean hb = null;
		hb = sqlSessionTemplate.selectOne(namespace + ".SearchEmail", useremail);
		return hb;
	}

	public void updateHost(HostBean host) {
		sqlSessionTemplate.update(namespace + ".UpdateHost", host);
	}

	public List<HostBean> getHosts() {
		List<HostBean> hlist = sqlSessionTemplate.selectList(namespace + ".GetHosts");
		System.out.println("host lists : " + hlist.size());
		return hlist;
	}

	public List<HostBean> yearMonthHost(String start_date) {
		List<HostBean> lists = sqlSessionTemplate.selectList(namespace + ".YearMonthHost", start_date);
		return lists;
	}

	public int todayHost() {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".TodayHost");
		return cnt;
	}

	public int yesterdayHost(String yesterday) {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".YesterdayHost", yesterday);
		return cnt;
	}

}
