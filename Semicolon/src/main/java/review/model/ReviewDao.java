package review.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import order.model.PayforBean;

@Component("ReviewDao")
public class ReviewDao {
	
	private String namespace = "review.model.Review";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void insertReview(ReviewBean rb) {
		int cnt = sqlSessionTemplate.insert(namespace+".InsertReview", rb);
		
	}

	public List<ReviewBean> selectReview(int gno) {
		List<ReviewBean> list = null;
		list = sqlSessionTemplate.selectList(namespace+".SelectReview", gno);
		return list;
	}

	public ReviewBean getReviewByNo(String review_no) {
		ReviewBean rb = sqlSessionTemplate.selectOne(namespace+".getReviewByNo",review_no);
		return rb;
	}

	public void reviewDelete(String review_no) {
		sqlSessionTemplate.delete(namespace+".ReviewDelete",review_no);
		
	}

	public int updateReview(ReviewBean rb) {
		System.out.println("*rb.getText"+rb.getText());
		System.out.println("*rb.getTotal"+rb.getTotal());
		int cnt= sqlSessionTemplate.update(namespace+".UpdateReview",rb);
		System.out.println("*cnt:"+cnt);
		return cnt;
		
	}

	public ReviewBean selectReviewByPno(ReviewBean review) {
		ReviewBean rb = null;
	      rb = sqlSessionTemplate.selectOne(namespace+".SelectReviewByPno",review);
	      return rb;
	}

	public List<ReviewBean> getReview() {
		List<ReviewBean> list = sqlSessionTemplate.selectList(namespace+".GetReview");
		return list;
	}

	public List<ReviewBean> getReviewByHouseno(String house_no) {
		List<ReviewBean> list = sqlSessionTemplate.selectList(namespace+".GetReviewByHouseno",house_no);
		return list;
	}
	public ReviewBean reviewAvg(String house_no) {
	      ReviewBean rb = sqlSessionTemplate.selectOne(namespace+".ReviewAvg",house_no);
	      return rb;
	      
	   }
	public ReviewBean selectReviewByReviewNo(int review_no) {
	      ReviewBean rb = sqlSessionTemplate.selectOne(namespace+".SelectReviewByReviewNo", review_no);
	      return rb;
	   }
}
