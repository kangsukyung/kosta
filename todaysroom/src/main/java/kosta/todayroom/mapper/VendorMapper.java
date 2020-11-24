package kosta.todayroom.mapper;

import kosta.todayroom.domain.VendorVO;

public interface VendorMapper {
	public int register(VendorVO vo);
	public VendorVO read(int seq);
	public int delete(int seq);
}
