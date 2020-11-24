package kosta.todayroom.domain;

import lombok.Data;

@Data
public class CommentsVO {
	private int comments_seq;
	private String comments_content;
	private String comments_picture;
	private int board_seq;
	private int member_seq;
	private int admin_seq;
	
}
