package kosta.todayroom.domain;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
public class StoreVO {
	private int store_seq;
	private int member_seq; 
	private String store_title;
	private String store_content;
	private String store_name;
	private int store_price;
	private Date store_date;
	private String store_lcategory;
	private String store_scategory;
	
	
	private List<ProductAttachVO> attachList;
	
	private List<ProductVO> productList;
	

}
