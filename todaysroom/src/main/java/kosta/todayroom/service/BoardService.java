package kosta.todayroom.service;

import java.util.List;


import kosta.todayroom.domain.BoardAttachVO;
import kosta.todayroom.domain.BoardVO;
import kosta.todayroom.domain.BoardCriteria;
import kosta.todayroom.domain.KnowhowVO;
import kosta.todayroom.domain.MemberVO;
import kosta.todayroom.domain.RoomwarmingVO;

public interface BoardService {
	public List<BoardVO> boardList(BoardCriteria cri);
	public RoomwarmingVO roomwarming(int board_seq);
	public KnowhowVO knowhow(int board_seq);
	
	public void register(BoardVO board);
	public void roomRegister(RoomwarmingVO room);
	public void knowhowRegister(KnowhowVO know);
	
	public BoardVO read(int board_seq);
	public List<BoardAttachVO> readAttachList(int board_seq);

	public boolean modify(BoardVO board);
	
	public boolean remove(int board_seq);
	public boolean removeRoom(int board_seq);
	public boolean removeKnowhow(int board_seq);
	
	public BoardAttachVO readThumbnail(int board_seq, String fileName);
	
	
	public List<MemberVO> memberList();
	public MemberVO member(int board_seq);
	
	public int boardTotalCount(BoardCriteria cri);
	
	public int viewModify(int board_seq);
	
}