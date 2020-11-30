package kosta.todayroom.service;

import java.util.List;

import kosta.todayroom.domain.Criteria;
import kosta.todayroom.domain.ProductVO;
import kosta.todayroom.domain.StoreVO;

public interface StoreService {
	public List<StoreVO> StoreListForCategory();
	
	public List<StoreVO> StoreList(Criteria cri);
	
	public StoreVO StoreRead(int seq);
	
	public List<ProductVO> ProductList(int seq);
	
	public int getTotal(Criteria cri);
	
	public List<StoreVO> StoreListLcategory(String lcategory, Criteria cri);
	
	public List<StoreVO> StoreListScategory(String scategory, Criteria cri);	
}
