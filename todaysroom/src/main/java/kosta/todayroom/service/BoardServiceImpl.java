package kosta.todayroom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.todayroom.domain.BoardAttachVO;
import kosta.todayroom.domain.BoardVO;
import kosta.todayroom.domain.BoardCriteria;
import kosta.todayroom.domain.KnowhowVO;
import kosta.todayroom.domain.MemberVO;
import kosta.todayroom.domain.RoomwarmingVO;
import kosta.todayroom.mapper.BoardAttachMapper;
import kosta.todayroom.mapper.BoardMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BoardServiceImpl implements BoardService {
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private BoardAttachMapper attachMapper;

	@Transactional
	@Override
	public void register(BoardVO board) {
		log.info("======= REGISTER =======");
		log.info("보드" + board.getBoard_seq());
		mapper.register(board);

		if (board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}

		board.getAttachList().forEach(attach -> {
			log.info("보드 seq 입니다." + board.getBoard_seq());
			attach.setBoard_seq(board.getBoard_seq());
			attachMapper.insert(attach);
		});
	}

	@Override
	public void roomRegister(RoomwarmingVO room) {
		log.info("===== ROOM REGISTER =====");

		mapper.roomWarmingRegister(room);
	}

	@Override
	public void knowhowRegister(KnowhowVO know) {
		log.info("===== KNOWHOW REGISTER =====");

		mapper.knowhowRegister(know);
	}

	@Override
	public List<BoardVO> boardList(BoardCriteria cri) {

		log.info("getList..........");

		return mapper.ListPaging(cri);
	}

	@Override
	public BoardVO read(int board_seq) {

		log.info("read..........");

		return mapper.read(board_seq);
	}

	@Override
	public boolean modify(BoardVO board) {

		log.info("modify.........");

		return mapper.modify(board) == 1;
	}

	@Override
	public boolean remove(int board_seq) {

		log.info("remove..........");
		
		attachMapper.deleteAll(board_seq);
		
		return mapper.remove(board_seq) == 1;
	}

	@Override
	public boolean removeRoom(int board_seq) {
		return mapper.removeRoom(board_seq) == 1;
	}

	@Override
	public boolean removeKnowhow(int board_seq) {
		return mapper.removeKnowhow(board_seq) == 1;
	}

	@Override
	public List<MemberVO> memberList() {

		log.info("member list..........");

		return mapper.memberList();
	}

	@Override
	public int boardTotalCount(BoardCriteria cri) {

		log.info("boardTotalCount..........");

		return mapper.boardTotalCount(cri);
	}

	@Override
	public MemberVO member(int board_seq) {

		log.info("member..........");

		return mapper.member(board_seq);
	}

	@Override
	public RoomwarmingVO roomwarming(int board_seq) {
		return mapper.roomwarming(board_seq);
	}

	@Override
	public KnowhowVO knowhow(int board_seq) {
		return mapper.knowhow(board_seq);
	}

	@Override
	public List<BoardAttachVO> readAttachList(int board_seq) {
		
		log.info("read Attach List by board_seq : " + board_seq);
		
		return attachMapper.findByBoardSeq(board_seq);
	}

	@Override
	public BoardAttachVO readThumbnail(int board_seq, String fileName) {
		
		return attachMapper.readThumbnail(board_seq, fileName);
	}

}
