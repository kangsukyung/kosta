package kosta.todayroom.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import kosta.todayroom.domain.ProductInquiryVO;
import kosta.todayroom.domain.ProductVO;
import kosta.todayroom.mapper.ProductInquiryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProductInquiryServiceImpl implements ProductInquiryService {
	
	@Setter(onMethod_=@Autowired)
	ProductInquiryMapper mapper;

	@Override
	public int register(ProductInquiryVO product_inquiryVO) {
		// TODO Auto-generated method stub
		return mapper.register(product_inquiryVO);
	}

	@Override
	public ProductInquiryVO read(int pi_seq) {
		// TODO Auto-generated method stub
		return mapper.read(pi_seq);
	}

	@Override
	public Map<ProductInquiryVO, ProductVO> list(int member_seq) {
		// TODO Auto-generated method stub
		List<ProductInquiryVO> inquiryList = mapper.list(member_seq);
		
		Map<ProductInquiryVO, ProductVO> list = new LinkedHashMap<ProductInquiryVO, ProductVO>();
		
		ProductVO product = null;
		ProductInquiryVO inquiry = null;
		
		for(int i=0; i<inquiryList.size(); i++) {
			inquiry = inquiryList.get(i);
			
			product = mapper.productRead(inquiry.getProduct_seq());
			
			list.put(inquiry, product);
		}
		
		return list;
	}

	@Override
	public int modify(ProductInquiryVO product_inquiryVO) {
		// TODO Auto-generated method stub
		return mapper.modify(product_inquiryVO);
	}

	@Override
	public int remove(int pi_seq) {
		// TODO Auto-generated method stub
		return mapper.remove(pi_seq);
	}

}
