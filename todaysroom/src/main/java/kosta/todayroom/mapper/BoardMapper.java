package kosta.todayroom.mapper;

import java.util.List;

import kosta.todayroom.domain.BoardVO;
import kosta.todayroom.domain.Criteria;
import kosta.todayroom.domain.KnowhowVO;
import kosta.todayroom.domain.MemberVO;
import kosta.todayroom.domain.RoomwarmingVO;

public interface BoardMapper {
	public List<BoardVO> List();
	public List<BoardVO> ListPaging(Criteria cri);
	
	public RoomwarmingVO roomwarming(int board_seq);
	public KnowhowVO knowhow(int board_seq);
	
	public int insert(BoardVO board);
	public int roomWarmingInsert(RoomwarmingVO room);
	public int knowhowInsert(KnowhowVO know);
	
	
	public BoardVO read(int board_seq);
	public int update(BoardVO board);
//	public int updateRoom(RoomwarmingVO room);
//	public int updatekNowhow(KnowhowVO knowhow);
	
	public int delete(int board_seq);
	public int deleteRoom(int board_seq);
	public int deleteKnowhow(int board_seq);
	
	
	public List<MemberVO> memberList();
	public MemberVO member(int member_seq);
	
	public int boardTotalCount(Criteria cri);
	
}
