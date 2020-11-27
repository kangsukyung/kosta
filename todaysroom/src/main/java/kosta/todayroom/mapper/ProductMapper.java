package kosta.todayroom.mapper;

import java.util.List;

import kosta.todayroom.domain.ProductVO;
import kosta.todayroom.domain.StoreVO;

public interface ProductMapper {
	
	//@Select("select * from product")
	public List<StoreVO> ProductStoregetList();
	public List<ProductVO> ProductItemgetList();
	
	
	public void ProductStoreRegister(StoreVO store);
	public void ProductItemRegister(List<ProductVO> product);
	
	
	
	
	public void ProductStoreRegisterSelectKey(StoreVO store);
	
	public StoreVO ProductStoreRead(Long store_seq);
	
	public int ProductStoreRemove(Long store_seq);
	
	public int ProductStoreModify(StoreVO store);

}
