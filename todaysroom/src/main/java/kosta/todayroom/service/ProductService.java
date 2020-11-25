package kosta.todayroom.service;

import java.util.List;

import kosta.todayroom.domain.StoreVO;

public interface ProductService {
	
	public void ProductRegister(StoreVO store);
	
	public StoreVO ProductRead(Long store_seq);
	
	public boolean ProductModify(StoreVO store);
	
	public boolean ProductRemove(Long store_seq);
	
	public List<StoreVO> ProductGetList();
	

}
