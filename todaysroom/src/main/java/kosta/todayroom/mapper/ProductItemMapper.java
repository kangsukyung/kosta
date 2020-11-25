package kosta.todayroom.mapper;

import java.util.List;

import kosta.todayroom.domain.ProductVO;
import kosta.todayroom.domain.StoreVO;

public interface ProductItemMapper {
	
	public List<ProductVO> ProductItemList();
	
	public void ProductItemRegister(ProductVO product);

	public ProductVO ProductItemRead(Long product_seq);
	
	public int ProductItemRemove(Long product_seq);

	public int ProductItemModify(ProductVO product);
	
	public int productRegister(StoreVO store);
		
}
