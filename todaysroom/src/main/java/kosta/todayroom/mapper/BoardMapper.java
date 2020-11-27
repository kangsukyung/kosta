package kosta.todayroom.mapper;

import java.util.List;

import kosta.todayroom.domain.BoardVO;
import kosta.todayroom.domain.BoardCriteria;
import kosta.todayroom.domain.KnowhowVO;
import kosta.todayroom.domain.MemberVO;
import kosta.todayroom.domain.RoomwarmingVO;

public interface BoardMapper {
	public List<BoardVO> List();
	public List<BoardVO> ListPaging(BoardCriteria cri);
	
	public RoomwarmingVO roomwarming(int board_seq);
	public KnowhowVO knowhow(int board_seq);
	
	public int register(BoardVO board);
	public int roomWarmingRegister(RoomwarmingVO room);
	public int knowhowRegister(KnowhowVO know);
	
	
	public BoardVO read(int board_seq);
	public int modify(BoardVO board);
//	public int updateRoom(RoomwarmingVO room);
//	public int updatekNowhow(KnowhowVO knowhow);
	
	public int remove(int board_seq);
	public int removeRoom(int board_seq);
	public int removeKnowhow(int board_seq);
	
	
	public List<MemberVO> memberList();
	public MemberVO member(int member_seq);
	
	public int boardTotalCount(BoardCriteria cri);
	
}
