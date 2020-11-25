package kosta.todayroom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.todayroom.domain.ProductVO;
import kosta.todayroom.mapper.ProductItemMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;



@Log4j
@Service
@AllArgsConstructor
public class ProductItemServiceImpl implements ProductItemService {
	
	@Setter(onMethod_ = @Autowired)
	private ProductItemMapper productItemMapper; 

	@Override
	public void ProductItemRegister(ProductVO product) {
		log.info("ProductItemRegister..........." + product);
		
		productItemMapper.ProductItemRegister(product);

	}

	@Override
	public ProductVO ProductItemRead(Long product_seq) {
		log.info("ProductItemRead..........." + product_seq);
		
		return productItemMapper.ProductItemRead(product_seq);
	}

	@Override
	public boolean ProductItemModify(ProductVO product) {
		log.info("ProductItemModify..........." + product);

		
		return productItemMapper.ProductItemModify(product) == 1;

	}

	@Override
	public boolean ProductItemRemove(Long product_seq) {
		log.info("ProductItemRemove..........." + product_seq);

		
		return productItemMapper.ProductItemRemove(product_seq) == 1;
	}

	@Override
	public List<ProductVO> ProductItemGetList() {
		log.info("ProductItemGetList.........");
		
		return productItemMapper.ProductItemList();
	}

}
