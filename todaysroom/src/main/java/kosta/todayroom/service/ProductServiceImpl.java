package kosta.todayroom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.todayroom.domain.ProductAttachVO;
import kosta.todayroom.domain.ProductVO;
import kosta.todayroom.domain.StoreVO;
import kosta.todayroom.mapper.ProductAttachMapper;
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
	
	@Setter(onMethod_ = @Autowired)
	private ProductAttachMapper productAttachMapper;
	

	
	@Transactional
	@Override
	public void ProductStoreRegister(StoreVO store) {
		
		log.info("ProductStore Register..........." + store);
		
		productMapper.ProductStoreRegister(store);
		
		
		
		if (store.getAttachList() == null || store.getAttachList().size() <= 0) {
			return;
		}

		store.getAttachList().forEach(attach -> {

			attach.setStore_seq(store.getStore_seq());
			productAttachMapper.ProductAttachRegister(attach); 
		});
	} //스토어, 파일 등록
	
	
	
	@Override
	public void ProductItemRegister(List<ProductVO> product) {
		
		log.info("ProductItem Register....."+product);
		
		productMapper.ProductItemRegister(product);
	
	} //상품등록
	
	@Override
	public List<StoreVO> ProductStoreGetList() {
		
		log.info("ProductGetList.........");
		
		return productMapper.ProductStoregetList();
	}
	
	@Override
	public List<ProductVO> ProductItemGetList(int member_seq) {
		
		log.info("Product Item List");
		
		return productMapper.ProductItemgetList(member_seq);
	}
	

	@Override
	public ProductVO ProductItemRead(int product_seq) {
		log.info("ProductRead..........." + product_seq);
		
		return productMapper.ProductItemRead(product_seq);
	}

	@Override
	public int ProductItemModify(ProductVO product) {
		
		log.warn("bbbbㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ");
		log.info("Product Modify................." + product);
		log.warn(product);
		
		return productMapper.ProductItemModify(product);
		


	}

	@Override
	public boolean ProductStoreRemove(Long store_seq) {
		
		log.info("ProductRemove................." + store_seq);
		
		return productMapper.ProductStoreRemove(store_seq) == 1;
	}


	

}
