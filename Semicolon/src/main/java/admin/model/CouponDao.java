package admin.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("ACouponDao")
public class CouponDao {

	private String namespace = "admin.model.Admin";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public void insertCoupon(CouponBean coupon) {
		
		sqlSessionTemplate.insert(namespace+".InsertCoupon",coupon);
		
	}
	

	public List<CouponBean> getAllCoupon() {
		
		List<CouponBean> lists= 
		sqlSessionTemplate.selectList(namespace+".GetAllCoupon");
		
		return lists;
	}


	public CouponBean selectCoupon_ByCode(String code) {
		
		CouponBean cbean=
		sqlSessionTemplate.selectOne(namespace+".SelectCoupon_ByCode",code);
		
		return cbean;
	}


	public void updateCoupon(CouponBean coupon) {
		
		sqlSessionTemplate.update(namespace+".UpdateCoupon",coupon);
		
	}


	public void deleteCoupon(String code) {
		
		sqlSessionTemplate.delete(namespace+".DeleteCoupon",code);
		
	}


	public String getCoupon_ByName(String cou_selValue) {
		
			String code = sqlSessionTemplate.selectOne(namespace+".GetCoupon_ByName",cou_selValue);
			
		return code;
	}

	
	
}
