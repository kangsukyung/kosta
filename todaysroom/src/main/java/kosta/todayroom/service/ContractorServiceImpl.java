package kosta.todayroom.service;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.todayroom.domain.ContractorVO;
import kosta.todayroom.domain.Criteria;
import kosta.todayroom.domain.MemberVO;
import kosta.todayroom.domain.VendorVO;
import kosta.todayroom.mapper.BoardMapper;
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
	private BoardMapper boardMapper;
	
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

	@Override
	public LinkedHashMap<Integer, HashMap<String, String>> list(Criteria cri) {
		// TODO Auto-generated method stub
		List<ContractorVO> original_list = mapper.list(cri);
		HashMap<String, String> tempMap = null;
		ContractorVO tempVO = null;
		int member_seq;
		MemberVO member= null;
		LinkedHashMap<Integer, HashMap<String, String>> list = new LinkedHashMap<>();
		
		for(int i=0; i<original_list.size(); i++){
			tempVO=original_list.get(i);
			
			member_seq=tempVO.getMember_seq();
			member=mapper.readMemberVO(member_seq);
			
			
			tempMap = new HashMap<>();
			tempMap.put("contractor_bname", tempVO.getContractor_bname());
			tempMap.put("contractor_address", tempVO.getContractor_address());
			tempMap.put("member_profile", mapper.readMemberProfile(member_seq));
			tempMap.put("board_thumbnail", mapper.readBoardThumbnail(member_seq));
			tempMap.put("member_id", member.getMember_id());
			
			list.put(member_seq, tempMap);	//추후, i를 member_seq로 변경해줄 것.
		}
		
		return list;
	}

	@Override
	public int totalCount() {
		// TODO Auto-generated method stub
		return mapper.totalCount();
	}

}
