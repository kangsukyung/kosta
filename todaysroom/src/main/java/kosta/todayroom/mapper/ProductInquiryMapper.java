package kosta.todayroom.mapper;

import java.util.List;

import kosta.todayroom.domain.ProductInquiryVO;
import kosta.todayroom.domain.ProductVO;

public interface ProductInquiryMapper {
	int register(ProductInquiryVO product_inquiryVO);
	ProductInquiryVO read(int pi_seq);
	List<ProductInquiryVO> list(int member_seq);
	int modify(ProductInquiryVO product_inquiryVO);
	int remove(int pi_seq);
	
	ProductVO productRead(int product_seq);
}
