package kosta.todayroom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kosta.todayroom.domain.Criteria;
import kosta.todayroom.domain.ReviewVO;

public interface ReviewMapper {
public List<ReviewVO> reviewList(@Param("cri") Criteria cri,@Param("store_seq") int store_seq);
	
	//댓글 작성
	public int reviewRegister(ReviewVO vo);
	
	//댓글 상세 디테일
	public ReviewVO reviewRead(int review_seq);
	
	//댓글 수정
	public int reviewModify(ReviewVO vo);
	
	//댓글 삭제
	public int reviewRemove(int review_seq);
	
	//글 하나에 대한 댓글의 수
	public int countByStore(int store_seq);
}
