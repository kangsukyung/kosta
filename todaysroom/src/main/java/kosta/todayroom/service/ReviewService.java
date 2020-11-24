package kosta.todayroom.service;

import java.util.List;

import kosta.todayroom.domain.Criteria;
import kosta.todayroom.domain.ReviewPageVO;
import kosta.todayroom.domain.ReviewVO;

public interface ReviewService {
		//리뷰 작성
		public int reviewRegister(ReviewVO vo);
		
		//리뷰 상세 디테일
		public ReviewVO reviewRead(int review_seq);
		
		//리뷰 수정
		public int reviewModify(ReviewVO vo);
		
		//리뷰 삭제
		public int reviewRemove(int review_seq);
		
		//리뷰 목록
//		public List<ReviewVO> reviewList();
		
		//리뷰 목록(+페이징)
		public List<ReviewVO> reviewList(Criteria cri, int store_seq);
		
		
		public ReviewPageVO ReviewListPage(Criteria cri, int store_seq);
	}
