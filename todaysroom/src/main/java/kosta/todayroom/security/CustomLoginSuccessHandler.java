package kosta.todayroom.security;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import kosta.todayroom.domain.MemberVO;
import kosta.todayroom.service.MemberService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{
	
	@Setter(onMethod_=@Autowired)
	private MemberService service;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth) throws IOException, ServletException {
		response.setContentType("text/html; charset=UTF-8");
	
		log.warn("Login Success");
		log.warn(auth.getAuthorities());
		List<String> roleNames=new ArrayList<>();
		auth.getAuthorities().forEach(authority ->{
			roleNames.add(authority.getAuthority());
		});
		
		if(roleNames.contains("ROLE_4")){
			request.getSession().invalidate();
			response.getWriter().print("<script>alert('비활성계정입니다.'); location.href='/login?num=1'</script>");
		}else if(roleNames.contains("ROLE_0")){
			request.getSession().invalidate();
			response.getWriter().print("<script>alert('탈퇴한 회원입니다.'); location.href='/login?num=2'</script>");
		}else if(roleNames.contains("ROLE_100")){
			MemberVO member=service.idCheck(request.getParameter("username"));
			service.countUpdate(member.getMember_seq(), 0);
			response.getWriter().print("<script>alert('관리자 페이지로 이동합니다.'); location.href='/admin/read'</script>");
		}else{
			MemberVO member=service.idCheck(request.getParameter("username"));
			service.countUpdate(member.getMember_seq(), 0);
			response.getWriter().print("<script>alert('로그인에 성공하셨습니다.'); location.href='"+request.getSession().getAttribute("prevPage")+"'</script>");			
		}
		
	}	
}
