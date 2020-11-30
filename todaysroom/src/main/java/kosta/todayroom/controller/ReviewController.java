package kosta.todayroom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kosta.todayroom.domain.Criteria;
import kosta.todayroom.domain.ReviewPageVO;
import kosta.todayroom.domain.ReviewVO;
import kosta.todayroom.service.ReviewService;
import kosta.todayroom.service.ReviewServiceImpl;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/review/")
public class ReviewController {
	@Setter(onMethod_=@Autowired)
	private ReviewServiceImpl service;
	
	//리뷰쓰기
	@PostMapping(value = "/register", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> reviewRegister(@RequestBody ReviewVO vo) {
		
		int insertCount = service.reviewRegister(vo);
		log.info("Reply INSERT COUNT: " + insertCount);

		return insertCount == 1 
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
		//목록
		@GetMapping(value = "/pages/{store_seq}/{page}",produces = {MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
		public ResponseEntity<ReviewPageVO> reviewList(@PathVariable("page") int page, @PathVariable("store_seq") int store_seq) {
			log.info("getList............");
			Criteria cri = new Criteria(page,10);
			log.info("cri : "+cri);
			log.info("page:::::::::::::"+page);
			log.info("store_seqqqqqqqqq : "+store_seq);
			return new ResponseEntity<>(service.ReviewListPage(cri, store_seq),HttpStatus.OK);
		}
		
		
		
		//상세
		@GetMapping(value="/{review_seq}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
		public ResponseEntity<ReviewVO> reviewRead(@PathVariable("review_seq") int review_seq){
			
			return new ResponseEntity<>(service.reviewRead(review_seq),HttpStatus.OK);
		}
		
		
		//삭제
		@DeleteMapping(value="/{review_seq}", produces = {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> reviewRemove(@PathVariable("review_seq") int review_seq){
			return service.reviewRemove(review_seq) == 1 
					? new ResponseEntity<>("success",HttpStatus.OK)
					: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		//수정
		@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
				value="/{review_seq}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> modify(@RequestBody ReviewVO vo, @PathVariable("review_seq") int review_seq){
			vo.setReview_seq(review_seq);
			
			log.info("modify:"+ vo);
			return service.reviewModify(vo) == 1 
					? new ResponseEntity<>("success",HttpStatus.OK)
					: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
}
