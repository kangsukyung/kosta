package kosta.todayroom.domain;

import lombok.Data;

@Data
public class ReviewAttachVO {

	private String fileName;
	private String uploadPath;
	private String uuid;
	private boolean image;


}
