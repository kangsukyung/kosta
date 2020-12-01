package kosta.todayroom.mapper;

import java.util.List;

import kosta.todayroom.domain.ProductAttachVO;


public interface ProductAttachMapper {
	
	public void ProductAttachRegister(ProductAttachVO productAttach);

	public void ProductAttachRemove(String uuid);

	public List<ProductAttachVO> findBySno(Long store_seq);
	
	public void ProductAttachRemoveAll(Long store_seq);

}
