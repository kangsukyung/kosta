package kosta.todayroom.domain;

import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class BasketVO {
	private int basket_seq;
	private int basket_quantity;
	private int product_seq;
	private int member_seq;
	
	private ProductVO productvo;
}
