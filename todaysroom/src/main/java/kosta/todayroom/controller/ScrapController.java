package kosta.todayroom.controller;

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

import kosta.todayroom.domain.BoardAttachVO;
import kosta.todayroom.domain.BoardVO;
import kosta.todayroom.domain.ScrapVO;
import kosta.todayroom.service.ScrapService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/scrap/*")
@AllArgsConstructor
public class ScrapController {
	
	private ScrapService scrapService;
	
	@GetMapping("/list")
	public void list(Model model) {
		log.info("CONTROLLER SCRAP ALL LIST");
		
		//글썸네일
		log.info("CONTROLLER SCRAP ALL LIST");
		model.addAttribute("list", scrapService.ScrapAttachGetList());
		System.out.println(scrapService.ScrapAttachGetList());
		
		//글제목
		model.addAttribute(scrapService.ScrapGetList());
		model.addAttribute("list2", scrapService.ScrapGetList());
		System.out.println(scrapService.ScrapGetList());
		
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
	
	
	
	@GetMapping("/register")
	public void ScrapRegister(){
		
	}
	
	
	@PostMapping("/register")
	public String ScrapRegister(ScrapVO scrap, RedirectAttributes rttr) {
		
		scrapService.ScrapRegister(scrap);
		
		rttr.addFlashAttribute("result", scrap.getScrap_seq());

		return "redirect:/board/list";

	}
	
	
	@GetMapping("/remove")
	public void ScrapRemove(){
		
	}
	
	@PostMapping("/remove")
	public String ScrapRemove(@RequestParam("scrap_seq") Long scrap_seq, RedirectAttributes rttr){
		
		log.info("remove............." + scrap_seq);
		
		if(scrapService.ScrapRemove(scrap_seq)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/scrap/list";
	}
	
	
	
	

}
