package order.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import host.model.ReserveBean;

@Component("PayforDao")
public class PayforDao {

	private String namespace = "order.model.Order";

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void insertPayfor(PayforBean payfor) {
		sqlSessionTemplate.insert(namespace + ".InsertPayfor", payfor);
	}

	public List<PayforBean> selectPayforByGno(int gno) {
		List<PayforBean> list = null;
		list = sqlSessionTemplate.selectList(namespace + ".SelectPayforByGno", gno);
		return list;
	}

	public List<PayforBean> selectAllReserve(int h_no) {
		List<PayforBean> Rlist = sqlSessionTemplate.selectList(namespace + ".SelectAllReserve", h_no);
		System.out.println("Rlist °³¼ö: " + Rlist.size());
		return Rlist;
	}

	public PayforBean selectPayforByPno(PayforBean payfor) {
		PayforBean pb = null;
		pb = sqlSessionTemplate.selectOne(namespace + ".SelectPayforByPno", payfor);
		return pb;
	}

	public void insertPayfor_default0(int house_no) {

		sqlSessionTemplate.insert(namespace + ".InsertPayfor_default0", house_no);

	}

	public PayforBean selectPayforByNo(PayforBean payfor) {
		PayforBean pb = null;
		pb = sqlSessionTemplate.selectOne(namespace + ".SelectPayforByNo", payfor);
		return pb;
	}

	public int selectMaxPno() {
		int max_pno = sqlSessionTemplate.selectOne(namespace + ".SelectMaxPno");

		return max_pno;
	}

	public void updateReviewUse(int pno) {
		sqlSessionTemplate.update(namespace + ".UpdateReviewUse", pno);
	}

	public void updateReviewUse0(int pno) {
		sqlSessionTemplate.update(namespace + ".UpdateReviewUse0", pno);
	}
	
}
