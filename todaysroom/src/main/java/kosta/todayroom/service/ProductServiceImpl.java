package kosta.todayroom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.todayroom.domain.StoreVO;
import kosta.todayroom.mapper.ProductMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {
	
	@Setter(onMethod_ = @Autowired)
	private ProductMapper productMapper;

	@Override
	public void ProductRegister(StoreVO store) {
		log.info("Product Register..........." + store);
		
		productMapper.ProductRegister(store);

	}

	@Override
	public StoreVO ProductRead(Long store_seq) {
		log.info("ProductRead..........." + store_seq);
		
		return productMapper.ProductRead(store_seq);
	}

	@Override
	public boolean ProductModify(StoreVO store) {
		
		log.info("Product Modify................." + store);
		
		return productMapper.ProductModify(store) == 1;


	}

	@Override
	public boolean ProductRemove(Long store_seq) {
		
		log.info("ProductRemove................." + store_seq);
		
		return productMapper.ProductRemove(store_seq) == 1;
	}

	@Override
	public List<StoreVO> ProductGetList() {
		
		log.info("ProductGetList.........");
		
		return productMapper.getList();
	}

}
