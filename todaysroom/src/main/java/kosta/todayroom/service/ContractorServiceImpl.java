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
@AllArgsConstructor
public class ContractorServiceImpl implements ContractorService{
	
	private ContractorMapper mapper;
	private MemberMapper memberMapper;
	private VendorMapper vendorMapper;
	
	@Transactional
	@Override
	public int register(ContractorVO vo) {
		int result=0;
		int num=3;
		int member=vo.getMember_seq();
		
		VendorVO ven=vendorMapper.read(member);
		log.warn(ven);
		int mr=memberMapper.ratingUpdate(member, num);
		
		if(mr>0){
			if(ven!=null){
				int del=vendorMapper.delete(member);
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
