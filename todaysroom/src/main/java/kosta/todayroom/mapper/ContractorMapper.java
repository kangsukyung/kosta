package kosta.todayroom.mapper;

import kosta.todayroom.domain.ContractorVO;

public interface ContractorMapper {
	public int register(ContractorVO vo);
	public ContractorVO read(int seq);
	public int delete(int seq);
}
