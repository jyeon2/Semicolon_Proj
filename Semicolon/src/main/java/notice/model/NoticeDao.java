package notice.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("myNdao")
public class NoticeDao {
	
	private String namespace="notice.model.Notice";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int getNTotalCount(Map<String, String> map) {
		 int totalCount= sqlSessionTemplate.selectOne(namespace+".GetNTotalCount",map);
		System.out.println("nttc: "+totalCount);
		 return totalCount;
	}

	public List<NoticeBean> getAllNotice(Map<String, String> map, Paging pageInfo) {
		List<NoticeBean> lists = new ArrayList<NoticeBean>();	
		RowBounds rwbd = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		 lists = sqlSessionTemplate.selectList(namespace+".GetAllNotice",map,rwbd);
		return lists;
	}

	public void insertNotice(NoticeBean nb) {
		System.out.println("nb.getfile: "+nb.getNfile());
		int cnt = sqlSessionTemplate.insert(namespace+".InsertNotice",nb);
		System.out.println("n¿Œº≠∆Æ cnt: "+cnt);
	}
	
	public void insertNotice_NoImg(NoticeBean noticB) {
		
		sqlSessionTemplate.insert(namespace+".InsertNotice_NoImg",noticB);
		
	}

	public void readCount(String nno) {
		sqlSessionTemplate.update(namespace+".ReadCount",nno);
	}

	public NoticeBean getOneRecord(String nno) {
		NoticeBean notice = sqlSessionTemplate.selectOne(namespace+".GetOneRecord",nno);
		return notice;
	}

	public void deleteNotice(String nno) {
		int cnt = sqlSessionTemplate.delete(namespace+".DeleteNotice",nno);
		System.out.println("Delete cnt:"+ cnt);
	}

	public void updateNotice(NoticeBean nb) {
		 
		sqlSessionTemplate.update(namespace+".UpdateNotice",nb);
	}

	public void updateNotice_NoImg(NoticeBean nb) {
		
		sqlSessionTemplate.update(namespace+".UpdateNotice_NoImg",nb);
	}

}
