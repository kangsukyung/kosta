package kosta.todayroom.mapper;

import java.util.List;

import kosta.todayroom.domain.BoardAttachVO;

public interface BoardAttachMapper {

	public void insert(BoardAttachVO vo);

	public void delete(String uuid);

	public List<BoardAttachVO> findByBoardSeq(int board_seq);

	public void deleteAll(int board_seq);
	
	public BoardAttachVO readThumbnail(int board_seq, String fileName);
	
	public List<BoardAttachVO> getOldFiles();

}