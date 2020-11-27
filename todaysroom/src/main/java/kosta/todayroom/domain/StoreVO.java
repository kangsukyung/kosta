package kosta.todayroom.domain;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Setter;

@Component
@Data
public class StoreVO {
	private int store_seq;
	private int member_seq; 
	private String store_title;
	private String store_content;
	private String store_name;
	private Date store_date;
	private String store_picture;
	private String store_lcategory;
	private String store_scategory;
	
	
	private List<ProductVO> store_productlist;

	
}