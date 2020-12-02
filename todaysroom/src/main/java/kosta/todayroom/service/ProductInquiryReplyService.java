package kosta.todayroom.service;

import java.util.List;

import kosta.todayroom.domain.ProductInquiryCriteria;
import kosta.todayroom.domain.ProductInquiryVO;

public interface ProductInquiryReplyService {
	
	public List<ProductInquiryVO> list(ProductInquiryCriteria cri);
	public ProductInquiryVO read(int pi_seq);
	
	public int piTotalCount(ProductInquiryCriteria cri);
	
	public boolean modify(ProductInquiryVO pi);
	
	public boolean remove(int pi_seq);
	
}
