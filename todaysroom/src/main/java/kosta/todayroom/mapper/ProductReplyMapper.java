package kosta.todayroom.mapper;

import java.util.List;

import kosta.todayroom.domain.ProductInquiryCriteria;
import kosta.todayroom.domain.ProductInquiryVO;

public interface ProductReplyMapper {
	
	public List<ProductInquiryVO> list(ProductInquiryCriteria cri);
	public ProductInquiryVO read(int pi_seq);
	
	public int piTotalCount(ProductInquiryCriteria cri);
	
	public int modify(ProductInquiryVO pi);
	
	public int remove(int pi_seq);
	
}
