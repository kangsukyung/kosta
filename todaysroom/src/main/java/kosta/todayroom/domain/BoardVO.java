package kosta.todayroom.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	private int board_seq;
	private int member_seq;
	private String board_title;
	private String board_content;
	private Date board_date;
	private String board_picture;
	private String board_thumbnail;
	private String board_classification;
	private String board_views;
	private String board_scraps;
	
	private List<BoardAttachVO> attachList;
}
