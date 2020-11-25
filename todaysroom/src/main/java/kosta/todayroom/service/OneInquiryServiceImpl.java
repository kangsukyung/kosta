package kosta.todayroom.service;

import org.springframework.stereotype.Service;

import kosta.todayroom.domain.One_inquiryVO;
import kosta.todayroom.mapper.OneInquiryMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
@AllArgsConstructor
public class OneInquiryServiceImpl implements OneInquiryService{
	
	private OneInquiryMapper mapper;
	
	@Override
	public int register(One_inquiryVO vo) {
		return mapper.register(vo);
	}

}
