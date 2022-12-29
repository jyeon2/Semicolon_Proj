package order.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import host.model.HouseBean;

@Component("OrderDao")
public class OrderDao {

	private String namespace = "order.model.Order";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void insertOrder(OrderBean order) {
		
		sqlSessionTemplate.insert(namespace+".InsertOrder",order);
		
	}

	public OrderBean selectOrder(OrderBean order) {
		
		OrderBean orderbean = 
		sqlSessionTemplate.selectOne(namespace+".SelectOrder",order);
		
		return orderbean;
	}
	
	public int countOrder(OrderBean order) {
		int count = -1;
		count = sqlSessionTemplate.selectOne(namespace+".CountOrder",order);
		return count;
	}
	
	public void updateOrder(OrderBean order) {
		sqlSessionTemplate.update(namespace+".UpdateOrder",order);
	}

	public int maxOrderNo() {
	      int max = -1;
	      max = sqlSessionTemplate.selectOne(namespace+".MaxOrderNo");
	      return max;
	   }

}
