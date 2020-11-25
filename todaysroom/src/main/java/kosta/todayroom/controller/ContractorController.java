package kosta.todayroom.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.todayroom.domain.ContractorVO;
import kosta.todayroom.domain.CustomUser;
import kosta.todayroom.domain.MemberVO;
import kosta.todayroom.service.ContractorService;
import kosta.todayroom.service.MemberService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/contractor/*")
public class ContractorController {

	@Setter(onMethod_=@Autowired)
	private ContractorService service;
	@Setter(onMethod_=@Autowired)
	private MemberService memberservice;
	
	@GetMapping("/register")
	public void registerForm(){
	}
	
	@PostMapping("/register")
	public String register(ContractorVO vo){
		vo.setAdmin_seq(1);
		int num=service.register(vo);
		if(num>0){
			MemberVO mv=memberservice.Check(vo.getMember_seq());
			User user=new CustomUser(mv);
			Authentication auth = new UsernamePasswordAuthenticationToken(user,user.getPassword(),user.getAuthorities());
			SecurityContextHolder.getContext().setAuthentication(auth);
//			response.getWriter().print("<script>alert('전문가 신청 완료.'); location.href='/member/mypage'</script>");
			return "/member/mypage";
		}else{
//			response.setContentType("text/html; charset=UTF-8");
//			response.getWriter().print("<script>alert('전문가 신청 실패.'); location.href='/contractor/register'</script>");
			return "redirect:/contractor/register";
		}
		
	}
}
