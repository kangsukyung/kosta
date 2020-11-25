package kosta.todayroom.mapper;

import java.util.List;

import kosta.todayroom.domain.BasketVO;

public interface BasketMapper {
	public List<BasketVO> list();
	
	public BasketVO read();
	
	public void register(List<BasketVO> list);
	
	public int update(BasketVO basket);
	
	public int delete(int seq);
}
