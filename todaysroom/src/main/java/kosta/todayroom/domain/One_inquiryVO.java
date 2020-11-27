package kosta.todayroom.domain;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class One_inquiryVO implements Serializable {
	private int oi_seq;
	private String oi_title;
	private String oi_content;
	private String oi_answer;
	private int member_seq;
	private int admin_seq;
	private Date oi_date;
	
}
