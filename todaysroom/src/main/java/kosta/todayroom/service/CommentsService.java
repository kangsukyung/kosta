package kosta.todayroom.service;

import java.util.List;

import kosta.todayroom.domain.CommentsVO;
import kosta.todayroom.domain.Criteria;
import kosta.todayroom.domain.CommentsPageVO;


public interface CommentsService {
	
	//댓글 작성
	public int commentsRegister(CommentsVO vo);
	
	//댓글 상세 디테일
	public CommentsVO commentsRead(int comments_seq);
	
	//댓글 수정
	public int commentsModify(CommentsVO vo);
	
	//댓글 삭제
	public int commentsRemove(int comments_seq);
	
	//댓글 목록
//	public List<CommentsVO> commentsList();
	
	//댓글 목록(+페이징)
	public List<CommentsVO> commentsList(Criteria cri, int board_seq);
	
	//댓글의 페이지 수..?
	public CommentsPageVO CommentsListPage(Criteria cri, int board_seq);
}
