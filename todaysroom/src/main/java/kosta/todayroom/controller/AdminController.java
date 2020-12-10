package kosta.todayroom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kosta.todayroom.domain.Criteria;
import kosta.todayroom.domain.MemberVO;
import kosta.todayroom.domain.One_inquiryVO;
import kosta.todayroom.domain.PageDTO;
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
	
	@GetMapping("/memberRead")
	public void read(Model model, Criteria cri){
		List<MemberVO> members=mService.memberList();
		List<MemberVO> member=mService.adminread(cri.getPageNum(), cri.getAmount());
		int total=members.size();
		model.addAttribute("member", member);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	};
	
	@GetMapping("/oneRead")
	public void oneRead(Model model, Criteria cri){
		List<One_inquiryVO> oneSize=oService.oneList();
		List<One_inquiryVO> one=oService.adminread(cri.getPageNum(), cri.getAmount());
		int total=oneSize.size();
		model.addAttribute("one", one);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	};
	
	@GetMapping("/oneReadModify")
	public void modifyForm(@RequestParam("seq") int seq, Model model){
		One_inquiryVO one=oService.getRead(seq);
		log.warn(one);
		model.addAttribute("one", one);
	};
	
	@PostMapping("/oneReadModify")
	public String modify(One_inquiryVO vo){
		int num=oService.updateOne(vo);
		
		if(num>0){
			log.warn("성공");
		}
		
		return "redirect:/admin/oneRead";
	};
}
