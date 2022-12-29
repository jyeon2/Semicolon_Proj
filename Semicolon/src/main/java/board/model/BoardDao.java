package board.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("ahboard")
public class BoardDao {
	
	private final String namespace="board.model.Board";
	
	@Autowired
	private  SqlSessionTemplate sqlSessionTemplate;

	public int getTotalCount(Map<String, String> map) {
		
		int totalCount = sqlSessionTemplate.selectOne(namespace+".GetTotalCount",map);
		System.out.println("ttc:"+totalCount);
		return totalCount;
	}

	public List<BoardBean> getBoardList(Map<String, String> map, Paging pageInfo) {
		
		//공간 만듬. 모든 조건 거친 필요한 정보만 가져오게 설정
		List<BoardBean> lists = new ArrayList<BoardBean>();
		RowBounds rowbd = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		System.out.println("lists.size():"+ lists.size());
		System.out.println("pageInfo.getOffset():"+ pageInfo.getOffset());
		System.out.println("pageInfo.getLimit():"+ pageInfo.getLimit());
		
		lists = sqlSessionTemplate.selectList(namespace+".GetBoardList",map,rowbd);
		return lists;
	}

	public BoardBean getOneRecord(String bno) {
		BoardBean board = sqlSessionTemplate.selectOne(namespace+".GetOneRecord",bno);
		System.out.println("board:"+board.getWriter());
		System.out.println("board:"+board.getContent());
		return board;
	}

	public void insertBoard(BoardBean bb) {
		bb.setRe_step(0);
		bb.setRe_level(0);
		System.out.println(bb.getWrite_date());
		int cnt = sqlSessionTemplate.insert(namespace+".InsertBoard",bb);
		System.out.println("인서트cnt: "+cnt);
	}

	public void deleteBoard(String bno) {
		int cnt = sqlSessionTemplate.delete(namespace+".DeleteBoard",bno);
		System.out.println("딜리트cnt: "+cnt);
	}

	public void updateBoard(BoardBean bb) {
		System.out.println(bb.getContent());
		System.out.println(bb.getRe_level());
		int cnt = sqlSessionTemplate.update(namespace+".UpdateBoard",bb);
		System.out.println("수정cnt: "+cnt);
	}

	public void reply_update_f(BoardBean bb) {
		System.out.println("bb.getRef():"+bb.getRef());
		System.out.println("bb.getRe_step():"+bb.getRe_step());
		System.out.println("bb.getRe_level():"+bb.getRe_level());
		
		int result =sqlSessionTemplate.update(namespace+".ReplyUpdatef",bb);
		
		System.out.println("re 증가 result:"+result);
		System.out.println("bb.getRef2:"+bb.getRef());
		System.out.println("bb.getRe_step2:"+bb.getRe_step());
		System.out.println("bb.getRe_level2:"+bb.getRe_level());
	}
	
	public void reply_insert(BoardBean bb) {
		sqlSessionTemplate.insert(namespace+".ReplyInsert",bb);
	}

	public void readCount(String bno) {
		sqlSessionTemplate.update(namespace+".ReadCount",bno);
	}

	
	
	
	
}
