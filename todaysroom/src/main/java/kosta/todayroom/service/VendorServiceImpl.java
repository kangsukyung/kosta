package kosta.todayroom.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.todayroom.domain.ContractorVO;
import kosta.todayroom.domain.VendorVO;
import kosta.todayroom.mapper.ContractorMapper;
import kosta.todayroom.mapper.MemberMapper;
import kosta.todayroom.mapper.VendorMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@Transactional
@AllArgsConstructor
public class VendorServiceImpl implements VendorService{
	
	private VendorMapper mapper;
	private MemberMapper memberMapper;
	private ContractorMapper contractorMapper;
	
	@Transactional
	@Override
	public int register(VendorVO vo) {
		int result=-1;
		int num=2;
		int member=vo.getMember_seq();
		
		ContractorVO con=contractorMapper.read(member);
		
		log.warn(con);
		
		int mr=memberMapper.ratingUpdate(member, num);
		if(mr>0){
			if(con!=null){
				int del=contractorMapper.delete(member);
				if(del>0){
					result=mapper.register(vo);
				}
			}else{
				result=mapper.register(vo);
			}
		}
		
		return result;
	}
	
}
