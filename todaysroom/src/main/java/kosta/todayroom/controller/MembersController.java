package kosta.todayroom.controller;



import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kosta.todayroom.domain.MemberVO;
import kosta.todayroom.service.MemberService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@RequestMapping("/members/*")
@RestController
@Log4j
public class MembersController {

	@Setter(onMethod_ = @Autowired)
	private MemberService service;

	@GetMapping(value = "/{id}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> idCheck(@PathVariable("id") String id) {

		MemberVO member = service.idCheck(id);
		return member == null ? new ResponseEntity<>("0", HttpStatus.OK) : new ResponseEntity<>("1", HttpStatus.OK);

	}

	@GetMapping(value = "/nickNameCheck/{name}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> nickNameCheck(@PathVariable("name") String name) {

		MemberVO member = service.nickNameCheck(name);
		return member == null ? new ResponseEntity<>("0", HttpStatus.OK) : new ResponseEntity<>("1", HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value = "/sendSms", method = RequestMethod.GET)
	public String sendSms(HttpServletRequest request) throws Exception {
		 Random rand  = new Random();
		 String numStr = "";
	        for(int i=0; i<6; i++) {
	            String ran = Integer.toString(rand.nextInt(10));
	            numStr+=ran;
	        }
	        
//		String api_key = "NCSOTVDQJYTSJA4L";
//		String api_secret = "B9KVBAWY3OW51XAGN0F46REDTXWH9KN0";
//		Message coolsms = new Message(api_key, api_secret);

//		HashMap<String, String> set = new HashMap<String, String>();
//
//		log.warn(request.getParameter("phoneb"));
//		set.put("to", (String) request.getParameter("phoneb")); // 받는 사람
//		set.put("from", (String) request.getParameter("phoneb")); // 발신번호
//		set.put("text", "안녕하세요 인증번호는 ["+numStr+"]입니다"); // 문자내용
//		set.put("type", "sms"); // 문자 타입
//		try {
//			JSONObject result = coolsms.send(set); // 보내기&전송결과받기
//			System.out.println(result.toString());
//		} catch (CoolsmsException e) {
//			System.out.println(e.getMessage());
//			System.out.println(e.getCode());
//		}
		
		return numStr;
	}


}
