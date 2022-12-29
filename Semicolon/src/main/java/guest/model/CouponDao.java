package guest.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("GCouponDao")
public class CouponDao {

	private String namespace = "guest.model.Guest";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<CouponBean> selectCouponByGno(int gno) {
		System.out.println("GCouponDao");
		List<CouponBean> list = null;
		list = sqlSessionTemplate.selectList(namespace + ".SelectCouponByGno", gno);
		return list;
	}

	public CouponBean selectCouponByCouponNo(int coupon_no) {
		CouponBean coupon = null;
		coupon = sqlSessionTemplate.selectOne(namespace + ".SelectCouponByCouponNo", coupon_no);
		return coupon;
	}

	public void insertCoupon(CouponBean coupon) {
		sqlSessionTemplate.insert(namespace + ".InsertCoupon", coupon);
	}

	public void updateUse(CouponBean coupon) {
		sqlSessionTemplate.update(namespace + ".UpdateUse", coupon);
	}

	public void douwnLoadC_insertCoupon(CouponBean g_cbean) {

		sqlSessionTemplate.insert(namespace + ".DouwnLoadC_insertCoupon", g_cbean);

	}

	public void deleteCoupon_ByCouponNo(CouponBean cbean) {

		sqlSessionTemplate.delete(namespace + ".DeleteCoupon_ByCouponNo", cbean);

	}
}
