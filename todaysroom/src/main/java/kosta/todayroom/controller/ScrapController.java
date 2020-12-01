package kosta.todayroom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		
//		model.addAttribute(scrapService.ScrapGetList());
		model.addAttribute("list", scrapService.ScrapGetList());
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
	
	
	
	

}
