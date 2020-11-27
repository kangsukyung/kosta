package kosta.todayroom.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import kosta.todayroom.domain.MemberVO;
import kosta.todayroom.service.MemberService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RequestMapping("/members/*")
@RestController
@Log4j
public class MembersController {
	
	@Setter(onMethod_=@Autowired)
	private MemberService service;
	
	@GetMapping(value="/{id}", produces=MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> idCheck(@PathVariable("id") String id){
	
	MemberVO member=service.idCheck(id);
	return member==null?new ResponseEntity<>("0", HttpStatus.OK):
		new ResponseEntity<>("1", HttpStatus.OK);
		
	}
	
	@GetMapping(value="/nickNameCheck/{name}", produces=MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> nickNameCheck(@PathVariable("name") String name){
	
	MemberVO member=service.nickNameCheck(name);
	return member==null?new ResponseEntity<>("0", HttpStatus.OK):
		new ResponseEntity<>("1", HttpStatus.OK);
	}

}
