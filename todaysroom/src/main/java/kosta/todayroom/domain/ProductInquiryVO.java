package kosta.todayroom.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("ProductInquiry")
public class ProductInquiryVO{
	private int pi_seq;
	private String pi_type;
	private String pi_content;
	private String pi_answer;
	private int product_seq;
	private int member_seq;
}
