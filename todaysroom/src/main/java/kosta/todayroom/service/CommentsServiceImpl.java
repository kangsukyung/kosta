package kosta.todayroom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.todayroom.domain.CommentsVO;
import kosta.todayroom.domain.Criteria;
import kosta.todayroom.domain.CommentsPageVO;
import kosta.todayroom.mapper.CommentsMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
public class CommentsServiceImpl implements CommentsService{

	@Setter(onMethod_ = @Autowired)
	private CommentsMapper commentsMapper;
	
	/*@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;*/
	
	//댓글 작성
	@Override
	public int commentsRegister(CommentsVO vo) {
		log.info("register...........");
		
		log.info("register................"+vo);
		
		//boardMapper.updateCommentsCount(vo.getBoard_seq(),1);
		
		return commentsMapper.commentsRegister(vo);
		
	}
	
	//댓글 목록
//	@Override
//	public List<CommentsVO> commentsList() {
//		log.info("getList.............");
//		return mapper.commentsList();
//	}
	
	//댓글 상세
	@Override
	public CommentsVO commentsRead(int comments_seq) {
		log.info("get........."+comments_seq);
		
		return commentsMapper.commentsRead(comments_seq);
	}

	//댓글 수정
	@Override
	public int commentsModify(CommentsVO vo) {
		
		log.info("modify......"+vo);
		
		return commentsMapper.commentsModify(vo);
	}
	
	//댓글 삭제
	@Override
	public int commentsRemove(int comments_seq) {
		
		log.info("remove......"+comments_seq);
		
//		boardMapper.updateCommentsCount(vo.getBoard_seq(),-1);
		
		return commentsMapper.commentsRemove(comments_seq);
	}

	@Override
	public List<CommentsVO> commentsList(Criteria cri, int board_seq) {
		
		return commentsMapper.commentsList(cri, board_seq);
	}

	@Override
	public CommentsPageVO CommentsListPage(Criteria cri, int board_seq) {
		
		return new CommentsPageVO(commentsMapper.countByBoard(board_seq), commentsMapper.commentsList(cri, board_seq));
	}


}
