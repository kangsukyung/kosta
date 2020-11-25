package kosta.todayroom.service;

import java.util.List;

import kosta.todayroom.domain.ProductVO;



public interface ProductItemService {
	
	public void ProductItemRegister(ProductVO product);
	
	public ProductVO ProductItemRead(Long product_seq);
	
	public boolean ProductItemModify(ProductVO product);
	
	public boolean ProductItemRemove(Long product_seq);
	
	public List<ProductVO> ProductItemGetList();

}
