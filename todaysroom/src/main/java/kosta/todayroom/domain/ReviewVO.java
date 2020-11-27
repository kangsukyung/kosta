package kosta.todayroom.domain;

import lombok.Data;

@Data
public class ReviewVO {
	private int review_seq;
	private String review_date;
	private String review_rating;
	private String review_content;
	private String review_picture;
	private int shoporder_seq;
	private int member_seq;
	private int store_seq;
	private int product_seq;
	
	
	
}
