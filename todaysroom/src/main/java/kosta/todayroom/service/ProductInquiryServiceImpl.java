package kosta.todayroom.service;

import java.util.List;

import kosta.todayroom.domain.ProductInquiryVO;
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
	
//	@Setter(onMethod_=@Autowired)
//	ProductMapper productMapper;

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
	public List<ProductInquiryVO> list() {
		// TODO Auto-generated method stub
//		List<ProductInquiryVO> inquiryList = mapper.list();
//		List<Product> productList = productMapper.list();
//		
//		Map<ProductVO, ProductInquiryVO> list = new LinkedHashMap<ProductVO, ProductInquiryVO>();
//		
//		ProductVO product = null;
//		ProductInquiryVO inquiry = null;
//		
//		for(int i=0; i<inquiryList.size(); i++) {
//			inquiry = inquiryList.get(i);
//			
//			product = productMapper.detailProductService(inquiry.getProduct_seq());
//			
//			System.out.println(inquiry);
//			
//			list.put(product, inquiry);
//		}
		
		return mapper.list();
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
