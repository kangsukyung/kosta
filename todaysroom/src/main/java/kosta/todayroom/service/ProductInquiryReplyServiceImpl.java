package kosta.todayroom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.todayroom.domain.ProductInquiryCriteria;
import kosta.todayroom.domain.ProductInquiryVO;
import kosta.todayroom.mapper.ProductReplyMapper;
import lombok.Setter;

@Service
public class ProductInquiryReplyServiceImpl implements ProductInquiryReplyService {
	
	@Setter(onMethod_ = @Autowired)
	private ProductReplyMapper pi_mapper;
	
	@Override
	public List<ProductInquiryVO> list(ProductInquiryCriteria cri) {
		return pi_mapper.list(cri);
	}

	@Override
	public ProductInquiryVO read(int pi_seq) {
		return pi_mapper.read(pi_seq);
	}

	@Override
	public boolean modify(ProductInquiryVO pi) {
		return pi_mapper.modify(pi) == 1;
	}

	@Override
	public boolean remove(int pi_seq) {
		return pi_mapper.remove(pi_seq) == 1;
	}

	@Override
	public int piTotalCount(ProductInquiryCriteria cri) {
		return pi_mapper.piTotalCount(cri);
	}

}
