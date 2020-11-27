package kosta.todayroom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kosta.todayroom.domain.Criteria;
import kosta.todayroom.domain.ProductVO;
import kosta.todayroom.domain.StoreVO;

public interface StoreMapper {
	public List<StoreVO> StoreList();
	
	public StoreVO StoreRead(int seq);
	
	public List<ProductVO> ProductList(int seq);
	
	public List<StoreVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public List<StoreVO> StoreListLcategory(@Param("store_lcategory") String lcategory, @Param("cri") Criteria cri);
	
	public List<StoreVO> StoreListScategory(@Param("store_scategory") String scategory, @Param("cri") Criteria cri);
}
