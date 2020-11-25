package kosta.todayroom.service;

import java.util.List;

import kosta.todayroom.domain.BasketVO;

public interface BasketService {
	public List<BasketVO> list();
	
	public BasketVO read();
	
	public void register(List<BasketVO> list);
	
	public int update(BasketVO basket);
	
	public int delete(int seq);
}
