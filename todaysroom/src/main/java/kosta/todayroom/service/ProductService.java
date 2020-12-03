package kosta.todayroom.service;

import java.util.List;

import kosta.todayroom.domain.ProductAttachVO;
import kosta.todayroom.domain.ProductVO;
import kosta.todayroom.domain.StoreVO;

public interface ProductService {
	
	
//  ---등록 : 스토어 글 등록, 파일등록, 상품등록
	public void ProductStoreRegister(StoreVO store);	
	public void ProductItemRegister(List<ProductVO> product);
	
//  -- 리스트 	: 스토어리스트, 상품리스트

	public List<StoreVO> ProductStoreGetList();
	public List<ProductVO> ProductItemGetList(int member_seq);
	
//	상품수정	
	public boolean ProductItemModify(ProductVO product);
	
	
	
	public ProductVO ProductItemRead(int product_seq);
	
	
	public boolean ProductStoreRemove(Long store_seq);
	
	
	
	

}
