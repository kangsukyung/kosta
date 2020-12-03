package kosta.todayroom.mapper;

import java.util.List;

import kosta.todayroom.domain.Criteria;
import kosta.todayroom.domain.ProductVO;
import kosta.todayroom.domain.StoreVO;

public interface ProductMapper {
	
	//@Select("select * from product")
	public List<StoreVO> ProductStoregetList();
	public List<ProductVO> ProductItemgetList(int member_seq);
	
	
	//페이징
	public List<ProductVO> ProductItemgetListPaging(int member_seq, Criteria cri);
	
	
	public void ProductStoreRegister(StoreVO store);
	public void ProductItemRegister(List<ProductVO> product);
	

	//상품수정
	public int ProductItemModify(ProductVO product);
	
	
	public void ProductStoreRegisterSelectKey(StoreVO store);
	
	public ProductVO ProductItemRead(int product_seq);
	
	public int ProductStoreRemove(Long store_seq);
	

}
