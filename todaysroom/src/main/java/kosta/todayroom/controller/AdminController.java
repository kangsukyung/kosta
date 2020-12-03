package kosta.todayroom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.todayroom.domain.MemberVO;
import kosta.todayroom.service.MemberService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminController {
	
	@Setter(onMethod_=@Autowired)
	private MemberService service;
	
	
	@GetMapping("/read")
	public void read(Model model){
		List<MemberVO> member=service.memberList();
		log.warn(member);
		model.addAttribute("member", member);
	};
}
