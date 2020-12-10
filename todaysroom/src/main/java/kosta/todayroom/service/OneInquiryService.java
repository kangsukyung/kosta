package kosta.todayroom.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kosta.todayroom.domain.Criteria;
import kosta.todayroom.domain.One_inquiryVO;

public interface OneInquiryService {
	public int register(One_inquiryVO vo);
	public List<One_inquiryVO> read(int pageNum, int amount , int seq);
	public int total(int seq);
	public One_inquiryVO getRead(int seq);
	public int delete(int seq);
	public int modify(One_inquiryVO vo);
	public List<One_inquiryVO> oneList();
	public int updateOne(One_inquiryVO vo);
	public List<One_inquiryVO> adminread(int pageNum, int amount);
}
