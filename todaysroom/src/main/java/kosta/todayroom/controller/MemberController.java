package kosta.todayroom.controller;

import java.io.File;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kosta.todayroom.domain.CustomUser;
import kosta.todayroom.domain.MemberVO;
import kosta.todayroom.security.CustomUserDetailsService;
import kosta.todayroom.service.MemberService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
public class MemberController {

	@Setter(onMethod_ = @Autowired)
	private MemberService service;

	@Setter(onMethod_ = @Autowired)
	private HttpServletRequest request;

	
	@GetMapping("/register")
	public void getRegister() {
	}

	@PostMapping("/register")
	public String postRegister(MemberVO member, RedirectAttributes rttr) {

		log.info(member.getMember_address());
		int check = service.register(member);
		//
		// if(check<=0){
		// rttr.addFlashAttribute("member",member);
		// return "redirect:/member/register";
		// }

		return "/login";
	}

	@GetMapping("/mypage")
	public void mypage() {
	}
	
	@GetMapping("/users/{member_seq}")
	public String users(@PathVariable("member_seq") int member_seq ,Model model) {
		MemberVO user = service.Check(member_seq);
		
		model.addAttribute("user", user);
		
		return "/member/users";
	}

	@GetMapping("/modify")
	public void updateForm() {
	}

	@PostMapping("/modify")
	public String update(@RequestParam("profile") MultipartFile profile, MemberVO vo) {
//		log.info(profile.toString());
//		log.warn(profile.toString());
		String uploadFolder = "C:\\upload";
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		String proname = vo.getMember_profile();
		String voPath = vo.getMember_path();
		File file;

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		
		if (profile.getOriginalFilename().equals("")) {
			if (vo.getMember_path().equals("")&& vo.getMember_profile().equals("")) {
				vo.setMember_profile("");
				service.modify(vo);
			} else {
				vo.setMember_profile("");
				vo.setMember_path("");
				int num = service.modify(vo);
				if (num > 0) {
					try {
						file = new File("C:\\upload\\" + voPath + "\\" + URLDecoder.decode(proname, "UTF-8"));
						file.delete();
					} catch (Exception e) {
						log.error(e.getMessage());
					}
				}
			}
		} else {
			UUID uuid = UUID.randomUUID();
			String pro = uuid.toString() + "_" + profile.getOriginalFilename();

			vo.setMember_profile(pro);
			vo.setMember_path(uploadFolderPath);
			int num = service.modify(vo);

			if (num > 0) {
				File saveFile = new File(uploadPath, pro);

				try {
					 file=new File("C:\\upload\\"+voPath+"\\"+URLDecoder.decode(proname,"UTF-8"));
					 file.delete();
					profile.transferTo(saveFile);
				} catch (Exception e) {
					log.error(e.getMessage());
				}
			}
		}
		
//		Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); 
//		User user = (User) authentication.getPrincipal();
//		Authentication authentication=new UsernamePasswordAuthenticationToken(principal, credentials)
//		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
//		log.warn(auths.getAuthorities());
//		log.warn(SecurityContextHolder.getContext().getAuthentication());
//		log.warn(authorities);
		
		MemberVO mv=service.idCheck(vo.getMember_id());
		User user=new CustomUser(mv);
		Authentication auth = new UsernamePasswordAuthenticationToken(user,user.getPassword(),user.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(auth);
		
		return "redirect:/member/modify";
	}
	
	@GetMapping("/display")
	public ResponseEntity<byte[]> getFile(String fileId){
//		log.info(fileId);
//		log.warn(fileId);
		
		MemberVO member=service.idCheck(fileId);
		String fileName=member.getMember_path()+"\\"+member.getMember_profile();

		File file=new File("C:\\upload\\", fileName);
//		log.info("file:"+file);
		ResponseEntity<byte[]> result=null;
		
		try {
			HttpHeaders header=new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result=new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
//			log.info(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 날짜형식
		Date date = new Date();// 오늘날짜
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}

}
