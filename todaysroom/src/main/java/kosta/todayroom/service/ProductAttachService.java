package kosta.todayroom.service;

import java.util.List;

import kosta.todayroom.domain.ProductAttachVO;

public interface ProductAttachService {
	
	public List<ProductAttachVO> findBySno(int store_seq);

	public List<ProductAttachVO> ProductAttachList();
}
