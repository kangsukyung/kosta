package kosta.todayroom.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import kosta.todayroom.domain.MemberVO;
import kosta.todayroom.domain.ScrapVO;
import kosta.todayroom.service.MemberService;
import kosta.todayroom.service.ScrapService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/scrap/*")
@AllArgsConstructor
public class ScrapController {
	
	private ScrapService scrapService;
	private MemberService service;
	
	
	@GetMapping("/list")
	public void list(Model model, Principal principal) {
		MemberVO member=service.idCheck(principal.getName());
		log.info("CONTROLLER SCRAP ALL LIST");
		
		//글썸네일
		log.info("CONTROLLER SCRAP ALL LIST");
		model.addAttribute("list", scrapService.ScrapAttachGetList(member.getMember_seq()));
		System.out.println(scrapService.ScrapAttachGetList(member.getMember_seq()));
		
		//글제목
		model.addAttribute(scrapService.ScrapGetList(member.getMember_seq()));
		model.addAttribute("list2", scrapService.ScrapGetList(member.getMember_seq()));
		System.out.println(scrapService.ScrapGetList(member.getMember_seq()));
		
		/*List<ScrapVO> list1 = scrapService.ScrapAttachGetList();
		List<ScrapVO> list2 = scrapService.ScrapGetList();
		
		LinkedHashMap<ScrapVO, ScrapVO> trueList = new LinkedHashMap<>();
		
		for(int i=0; i<list1.size(); i++){
			ScrapVO temp1 = list1.get(i);
			ScrapVO temp2 = list2.get(i);
			
			trueList.put(temp1, temp2);
		}
		
		model.addAttribute("list", trueList);*/
		
		
	} //end list
	
	
	
	
	@GetMapping("/listBang")
	public void listBang(Model model, Principal principal) {
		MemberVO member=service.idCheck(principal.getName());
		log.info("CONTROLLER SCRAP Bang LIST");
		
		//글썸네일
		log.info("CONTROLLER SCRAP ALL LIST");
		model.addAttribute("list", scrapService.ScrapAttachGetList(member.getMember_seq()));
		//System.out.println(scrapService.ScrapAttachGetList(member.getMember_seq()));
		
		//글제목
		model.addAttribute(scrapService.ScrapBangList(member.getMember_seq()));
		model.addAttribute("list2", scrapService.ScrapBangList(member.getMember_seq()));
		//System.out.println(scrapService.ScrapBangList(member.getMember_seq()));
		
		
		
	} //end list
	
	@GetMapping("/knowBang")
	public void knowBang(Model model, Principal principal) {
		MemberVO member=service.idCheck(principal.getName());
		log.info("CONTROLLER SCRAP knowBang LIST");
		
		//글썸네일
		log.info("CONTROLLER SCRAP knowBang LIST");
		model.addAttribute("list", scrapService.ScrapAttachGetList(member.getMember_seq()));
		//System.out.println(scrapService.ScrapAttachGetList(member.getMember_seq()));
		
		//글제목
		model.addAttribute(scrapService.ScrapKnowList(member.getMember_seq()));
		model.addAttribute("list2", scrapService.ScrapKnowList(member.getMember_seq()));
		//System.out.println(scrapService.ScrapBangList(member.getMember_seq()));
		
		
		
	} //end list
	
	

	
	@GetMapping("/register")
	public void ScrapRegister(){
		
	}
	
	
	@PostMapping("/register")
	public String ScrapRegister(@RequestParam("board_seq") Long board_seq, ScrapVO scrap, RedirectAttributes rttr) {
		

		scrapService.ScrapRegister(scrap);
		
		rttr.addFlashAttribute("result", scrap.getScrap_seq());
		

		return "redirect:/board/read?board_seq="+board_seq;

	}
	
	
	@GetMapping("/remove")
	public String ScrapRemove(@RequestParam("scrap_seq") Long scrap_seq, RedirectAttributes rttr){
		
		return "redirect:/scrap/remove?scrap_seq="+scrap_seq;
	}
	
	
	
	@PostMapping("/remove")
	public String remove(@RequestParam("scrap_seq") Long scrap_seq, RedirectAttributes rttr) {

		log.info("remove............." + scrap_seq);

		
		if(scrapService.ScrapRemove(scrap_seq)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/scrap/list";
	}
	
	
	

}
