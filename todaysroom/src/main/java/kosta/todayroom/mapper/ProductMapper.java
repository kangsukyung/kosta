package kosta.todayroom.mapper;

import java.util.List;



import kosta.todayroom.domain.StoreVO;

public interface ProductMapper {
	
	//@Select("select * from product")
	public List<StoreVO> getList();
	
	public void ProductRegister(StoreVO store);
	
	public void ProductRegisterSelectKey(StoreVO store);
	
	public StoreVO ProductRead(Long store_seq);
	
	public int ProductRemove(Long store_seq);
	
	public int ProductModify(StoreVO store);

}
