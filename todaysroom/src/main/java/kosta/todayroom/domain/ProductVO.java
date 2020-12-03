package kosta.todayroom.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductVO {
	private int product_seq; 
	private int store_seq; 
	private String product_name; 
	private int product_price;
	private String product_fname;
	private String product_uuid;
	private String product_uploadpath;
	
	
	private StoreVO store;
	

	
	
}
