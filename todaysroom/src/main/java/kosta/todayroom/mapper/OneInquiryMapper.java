package kosta.todayroom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kosta.todayroom.domain.One_inquiryVO;
import lombok.extern.log4j.Log4j;

public interface OneInquiryMapper {
	public int register(One_inquiryVO vo);
	public List<One_inquiryVO> read(
			@Param("pageNum") int pageNum,
			@Param("amount") int amount, 
			@Param("seq") int seq
	);
	public List<One_inquiryVO> adminread(
			@Param("pageNum") int pageNum,
			@Param("amount") int amount 
			);
	public int total(int seq);
	public One_inquiryVO getRead(int seq);
	public int delete(int seq);
	public int modify(One_inquiryVO vo);
	public List<One_inquiryVO> oneList();
	public int updateOne(One_inquiryVO vo);
}
