package kosta.todayroom.mapper;

import java.util.List;

import kosta.todayroom.domain.ContractorVO;
import kosta.todayroom.domain.Criteria;

public interface ContractorMapper {
	public int register(ContractorVO vo);
	public ContractorVO read(int seq);
	public int delete(int seq);
	public List<ContractorVO> list(Criteria cri);
	
	public String readMemberProfile(int member_seq);
	public String readBoardThumbnail(int member_seq);
}
