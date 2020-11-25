package kosta.todayroom.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.todayroom.domain.Criteria;
import kosta.todayroom.domain.MemberVO;
import kosta.todayroom.domain.One_inquiryVO;
import kosta.todayroom.domain.PageDTO;
import kosta.todayroom.service.MemberService;
import kosta.todayroom.service.OneInquiryService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/oneInquriy")
public class OneInquiryController {
	
	@Setter(onMethod_=@Autowired)
	private OneInquiryService service;
	
	@Setter(onMethod_=@Autowired)
	private MemberService memberservice;
	
	@GetMapping("/list")
	private void list(Principal principal,Model model,Criteria cri){
		MemberVO member=memberservice.idCheck(principal.getName());
		
		List<One_inquiryVO> list=service.read(cri.getPageNum(), cri.getAmount() , member.getMember_seq());
		int total=service.total(member.getMember_seq());
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/register")
	public void registerForm(){}
	
	@PostMapping("/register")
	public String register(One_inquiryVO vo, Principal principal, Model model){
		vo.setOi_answer("");
		vo.setAdmin_seq(1);
		
		int num=service.register(vo);

		return "redirect:/oneInquriy/list";
	}
	
}
