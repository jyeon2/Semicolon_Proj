package host.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myhouseDao")
public class HouseDao {

	public String namespace = "host.model.Host";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public void insertHouse(HouseBean house) {
		int result = -1;

		result = sqlSessionTemplate.insert(namespace + ".InsertHouse", house);

		System.out.println("insertHouse 성공 : " + result);
	}

	public void insertAddress(AddressBean address) {
		int result = -1;

		result = sqlSessionTemplate.insert(namespace + ".InsertAddress", address);

		System.out.println("insertAddress 성공 : " + result);
	}

	public void insertContent(ContentBean content) {
		int result = -1;

		result = sqlSessionTemplate.insert(namespace + ".InsertContent", content);

		System.out.println("insertContent 성공 : " + result);
	}

	public List<AllBean> getAllHouse_ByHno(int hno) {// 예약 건수 가져올때

		List<AllBean> all_lists = new ArrayList<AllBean>();

		all_lists = sqlSessionTemplate.selectList(namespace + ".GetAllHouse_ByHno", hno);

		return all_lists;
	}

	public void deleteHouse(String house_no) {

		sqlSessionTemplate.delete(namespace + ".DeleteHouse", house_no);

	}

	public AllBean selectHouse_ByNo(String house_no) {

		AllBean allbean = sqlSessionTemplate.selectOne(namespace + ".SelectHouse_ByNo", house_no);

		return allbean;
	}

	public void updateHouse(HouseBean house) {

		sqlSessionTemplate.update(namespace + ".UpdateHouse", house);

	}

	public void updateAddress(AddressBean address) {

		sqlSessionTemplate.update(namespace + ".UpdateAddress", address);

	}

	public void updateContent(ContentBean content) {

		sqlSessionTemplate.update(namespace + ".UpdateContent", content);

	}

	public List<AllBean> getAllHouse() {

		List<AllBean> lists = new ArrayList<AllBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".GetAllHouse");
		return lists;
	}

	public List<AllBean> getAllTheme_ByTname(String name) {

		List<AllBean> lists = new ArrayList<AllBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".GetAllTheme_ByTname", name);

		return lists;
	}

	public List<AllBean> getAllSubTheme_ByTno(String name) {

		List<AllBean> lists = new ArrayList<AllBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".GetAllSubTheme_ByTno", name);

		return lists;
	}

	public HouseBean getHouseByhouse_no(String house_no) {
		HouseBean hb = sqlSessionTemplate.selectOne(namespace + ".GetHouseByhouse_no", house_no);
		return hb;
	}

	public AllBean getHouseByHouse_no(int no) {
		AllBean house = null;
		house = sqlSessionTemplate.selectOne(namespace + ".GetHouseByHouse_no", no);
		return house;
	}

	public List<ReserveBean> hostPageReserve(int hostno) {
		List<ReserveBean> RHlist = sqlSessionTemplate.selectList(namespace + ".HostPageReserve", hostno);
		System.out.println("호스트 예약정보 : " + RHlist);
		return RHlist;
	}

	public int selectMax_HouseNo() {
		int max_houseno = sqlSessionTemplate.selectOne(namespace + ".SelectMax_HouseNo");

		return max_houseno;
	}

	public List<ReserveBean> AdminGPageReserve(int hostno) {
		List<ReserveBean> AGlist = sqlSessionTemplate.selectList(namespace + ".AdminGPageReserve", hostno);
		System.out.println("게스트 예약정보 : " + AGlist);
		return AGlist;
	}

	public List<HouseBean> getOrderList(int hno) {

		List<HouseBean> lists = sqlSessionTemplate.selectList(namespace + ".GetOrderList", hno);
		System.out.println("호스트예약정보Bean: " + lists.size());
		return lists;
	}

	// 그래프
	public List<AllBean> graphByTheme() {
		List<AllBean> list = sqlSessionTemplate.selectList(namespace+".GraphByTheme");
		return list;
	}
	
	public List<AllBean> graphBySubTheme(String theme) {
		List<AllBean> list = sqlSessionTemplate.selectList(namespace+".GraphBySubTheme", theme);
		return list;
	}

	public int todayHouse() {
		int cnt = sqlSessionTemplate.selectOne(namespace+".TodayHouse");
		return cnt;
	}

	public int yesterdayHouse(String yesterday) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".YesterdayHouse", yesterday);
		return cnt;
	}

	public int minHouse() {
		int min = sqlSessionTemplate.selectOne(namespace+".MinHouse");
		return min;
	}
	
	public int maxHouse() {
		int max = sqlSessionTemplate.selectOne(namespace+".MaxHouse");
		return max;
	}

	//테마이름 변경
	public void updateHouseTheme(HouseBean hb) {
		sqlSessionTemplate.update(namespace+".UpdateHouseTheme",hb);
	}

	//서브테마이름 변경
	public void updateHouseSubTheme(HouseBean hb) {
		sqlSessionTemplate.update(namespace+".UpdateHouseSubTheme",hb);
	}
}
