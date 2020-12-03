package kosta.todayroom.domain;

import java.util.List;

import lombok.Data;

@Data
public class ScrapVO {
	
	private int scrap_seq;
	private int board_seq;
	private int member_seq;
	
	private BoardVO board;
	private List<BoardAttachVO> boardAttachList;

}
