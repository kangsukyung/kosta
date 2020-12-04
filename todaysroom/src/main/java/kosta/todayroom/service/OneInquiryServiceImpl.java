package kosta.todayroom.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.todayroom.domain.Criteria;
import kosta.todayroom.domain.One_inquiryVO;
import kosta.todayroom.mapper.OneInquiryMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
@AllArgsConstructor
public class OneInquiryServiceImpl implements OneInquiryService{
	
	private OneInquiryMapper mapper;
	
	@Transactional
	@Override
	public int register(One_inquiryVO vo) {
		return mapper.register(vo);
	}

	@Override
	public List<One_inquiryVO> read(int pageNum, int amount, int seq) {
		return mapper.read(pageNum, amount ,seq);
	}

	@Override
	public int total(int seq) {
		return mapper.total(seq);
	}

	@Override
	public One_inquiryVO getRead(int seq) {
		return mapper.getRead(seq);
	}

	@Transactional
	@Override
	public int delete(int seq) {
		return mapper.delete(seq);
	}

	@Transactional
	@Override
	public int modify(One_inquiryVO vo) {
		return mapper.modify(vo);
	}

	@Override
	public List<One_inquiryVO> oneList() {
		return mapper.oneList();
	}

	@Transactional
	@Override
	public int updateOne(One_inquiryVO vo) {
		return mapper.updateOne(vo);
	}
	
	
	

}
