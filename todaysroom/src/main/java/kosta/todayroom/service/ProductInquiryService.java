package kosta.todayroom.service;

import java.util.Map;

import kosta.todayroom.domain.ProductInquiryVO;
import kosta.todayroom.domain.ProductVO;

public interface ProductInquiryService {
	int register(ProductInquiryVO product_inquiryVO);
	ProductInquiryVO read(int pi_seq);
	Map<ProductInquiryVO, ProductVO> list(int member_seq);
	int modify(ProductInquiryVO product_inquiryVO);
	int remove(int pi_seq);
}
