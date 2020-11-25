package kosta.todayroom.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ProductVO {
	private int product_seq; 
	private int store_seq; 
	private String product_name; 
	private int product_price;
	private String product_fname;
}
