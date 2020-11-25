package kosta.todayroom.mapper;

import java.util.List;

import kosta.todayroom.domain.ProductVO;
import kosta.todayroom.domain.StoreVO;

public interface StoreMapper {
	public List<StoreVO> StoreList();
	
	public StoreVO StoreRead(int seq);
	
	public List<ProductVO> ProductList(int seq);
}
