package kosta.todayroom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.todayroom.domain.MemberVO;
import kosta.todayroom.domain.One_inquiryVO;
import kosta.todayroom.service.MemberService;
import kosta.todayroom.service.OneInquiryService;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
@AllArgsConstructor
public class AdminController {
	
	private MemberService mService;
	private OneInquiryService oService;
	
	@GetMapping("/read")
	public void read(Model model){
		List<MemberVO> member=mService.memberList();
		log.warn(member);
		model.addAttribute("member", member);
	};
	
	@GetMapping("/oneRead")
	public void oneRead(Model model){
		List<One_inquiryVO> one=oService.oneList();
		model.addAttribute("one", one);
	};
}
