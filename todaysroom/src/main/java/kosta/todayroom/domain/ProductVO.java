package kosta.todayroom.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ProductVO {
	private int product_seq;
	private String product_name;
	private int product_price;
	private String product_lcategory;
	private String product_scategory;
	private int product_dlvchr;
	private int store_seq;
	private String product_fname;
}
