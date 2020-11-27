package kosta.todayroom.service;

import java.util.List;

import kosta.todayroom.domain.ProductVO;
import kosta.todayroom.domain.StoreVO;

public interface StoreService {
	public List<StoreVO> StoreList();
	
	public StoreVO StoreRead(int seq);
	
	public List<ProductVO> ProductList(int seq); 
}
