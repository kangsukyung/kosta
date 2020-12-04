package kosta.todayroom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kosta.todayroom.domain.ProductInquiryCriteria;
import kosta.todayroom.domain.ProductInquiryPageDTO;
import kosta.todayroom.domain.ProductInquiryVO;
import kosta.todayroom.service.MemberService;
import kosta.todayroom.service.ProductInquiryReplyService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/productInquiry/*")
public class ProductInquiryReplyController {
	
	@Setter(onMethod_ = @Autowired)
	private ProductInquiryReplyService service;
	@Setter(onMethod_=@Autowired)
	private MemberService mService;
	
	@GetMapping("/replylist")
	public void replyList(ProductInquiryCriteria cri, Model model, @RequestParam(value="result", required=false) String result){
		
		log.info("reply list.....");
		
		int total = service.piTotalCount(cri);
		cri.setResult(result);
		
		model.addAttribute("replylist", service.list(cri));
		model.addAttribute("pageMaker", new ProductInquiryPageDTO(cri, total));
	}
	
	@GetMapping("/replyread")
	public void replyRead(@RequestParam("pi_seq") int pi_seq, Model model) {
		
		model.addAttribute("reply", service.read(pi_seq));
		
	}
	
	@PostMapping("/replyread")
	public String replyModify(ProductInquiryVO pi, RedirectAttributes rttr) {
		
		if (service.modify(pi)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/productInquiry/replylist";
	}
	
	
	
	
}
