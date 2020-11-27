package kosta.todayroom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.todayroom.domain.Criteria;
import kosta.todayroom.domain.ReviewPageVO;
import kosta.todayroom.domain.ReviewVO;
import kosta.todayroom.mapper.ReviewMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Setter(onMethod_ = @Autowired)
	private ReviewMapper reviewMapper;
	
	@Override
	public int reviewRegister(ReviewVO vo) {
		log.info("register...........");
		System.out.println("serviceimpl : "+vo);
		return reviewMapper.reviewRegister(vo);
	}

	@Override
	public ReviewVO reviewRead(int review_seq) {
		log.info("read----------"+review_seq);
		return reviewMapper.reviewRead(review_seq);
	}

	@Override
	public int reviewModify(ReviewVO vo) {
		log.info("modify-------------"+vo);
		return reviewMapper.reviewModify(vo);
	}

	@Override
	public int reviewRemove(int review_seq) {
		log.info("remove-----------"+review_seq);
		return reviewMapper.reviewRemove(review_seq);
	}

	@Override
	public List<ReviewVO> reviewList(Criteria cri, int store_seq) {
		log.info("list-----------"+store_seq);
		return reviewMapper.reviewList(cri, store_seq);
	}

	@Override
	public ReviewPageVO ReviewListPage(Criteria cri, int store_seq) {
		System.out.println("reviewServiceImpl:cri   :  "+cri);
		return new ReviewPageVO(reviewMapper.countByStore(store_seq), reviewMapper.reviewList(cri, store_seq));
		
	}
	
}
