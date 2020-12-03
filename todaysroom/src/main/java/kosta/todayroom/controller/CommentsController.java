package kosta.todayroom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kosta.todayroom.domain.CommentsVO;
import kosta.todayroom.domain.Criteria;
import kosta.todayroom.domain.CommentsPageVO;
import kosta.todayroom.service.CommentsService;
import kosta.todayroom.service.CommentsServiceImpl;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/comments/")
public class CommentsController {
	@Setter(onMethod_=@Autowired)
	private CommentsServiceImpl service;
	
	/*@GetMapping("/list")
	public void CommentsList(Model model){
		model.addAttribute("list",service.commentsList());
	}*/
	
//	@PostMapping("/register")
//	public String CommentsRegister(CommentsVO vo, RedirectAttributes rttr){
//		service.commentsRegister(vo);
//		rttr.addFlashAttribute("result",vo.get)
//	}
	
	//댓글 추가
	@PostMapping(value = "/register", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> commentsRegister(@RequestBody CommentsVO vo) {

		log.info("commentsVO2222: " + vo);
		
		int insertCount = service.commentsRegister(vo);

		log.info("Reply INSERT COUNT: " + insertCount);

		return insertCount == 1 
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//댓글 목록
	@GetMapping(value = "/pages/{board_seq}/{page}",produces = {MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<CommentsPageVO> commentsList(@PathVariable("page") int page, @PathVariable("board_seq") int board_seq) {
		log.info("getList............");
		Criteria cri = new Criteria(page,5);
		log.info("cri : "+cri);
		
		return new ResponseEntity<>(service.CommentsListPage(cri, board_seq),HttpStatus.OK);
	}
	
	
	
	//댓글 상세
	@GetMapping(value="/{comments_seq}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<CommentsVO> commentsRead(@PathVariable("comments_seq") int comments_seq){
		
		log.info("comments_seq :::::::::: "+ comments_seq);
		
		return new ResponseEntity<>(service.commentsRead(comments_seq),HttpStatus.OK);
	}
	
	
	
	@DeleteMapping(value="/{comments_seq}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> commentsRemove(@PathVariable("comments_seq") int comments_seq){
		log.info("remove:"+ comments_seq);
		return service.commentsRemove(comments_seq) == 1 
				? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value="/{comments_seq}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody CommentsVO vo, @PathVariable("comments_seq") int comments_seq){
		vo.setComments_seq(comments_seq);
		log.info("comments_seq:"+comments_seq);
		
		log.info("modify:"+ vo);
		return service.commentsModify(vo) == 1 
				? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
