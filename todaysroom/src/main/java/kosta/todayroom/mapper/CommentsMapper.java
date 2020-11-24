package kosta.todayroom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kosta.todayroom.domain.CommentsVO;
import kosta.todayroom.domain.Criteria;


public interface CommentsMapper {
	
	//댓글 목록
//	public List<CommentsVO> commentsList();
	
	//댓글 목록(+페이징)
	public List<CommentsVO> commentsList(@Param("cri") Criteria cri,@Param("board_seq") int board_seq);
	
	//댓글 작성
	public int commentsRegister(CommentsVO vo);
	
	//댓글 상세 디테일
	public CommentsVO commentsRead(int comments_seq);
	
	//댓글 수정
	public int commentsModify(CommentsVO vo);
	
	//댓글 삭제
	public int commentsRemove(int comments_seq);
	
	//글 하나에 대한 댓글의 수
	public int countByBoard(int board_seq);
	
}
