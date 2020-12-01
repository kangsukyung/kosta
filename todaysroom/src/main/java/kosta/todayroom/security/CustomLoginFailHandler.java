package kosta.todayroom.security;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import kosta.todayroom.domain.MemberVO;
import kosta.todayroom.service.MemberService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginFailHandler implements AuthenticationFailureHandler {

	@Setter(onMethod_ = @Autowired)
	private MemberService service;

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException auth) throws IOException, ServletException {
		response.setContentType("text/html; charset=UTF-8");
		MemberVO member = null;
		try {
			member = service.idCheck(request.getParameter("username"));
			if (member == null) {
				response.getWriter().print("<script>alert('로그인에 실패하셧습니다'); location.href='/login'; </script>");
				//"+"passfound"+".click();
			}
		} catch (Exception e) {
			log.error(e);
		}
		int count=member.getMember_count()+1;
		if(member.getMember_count()<5){
			service.countUpdate(member.getMember_seq(), count);
		}
		
		member=service.idCheck(member.getMember_id());
		
		
		if (member.getMember_count() >= 5) {
			service.ratingUpdate(member.getMember_seq(), 4);
			response.getWriter().print("<script>alert('비활성계정입니다.'); location.href='/login?num=1'</script>");
		} else {
			response.getWriter().print("<script>alert('비밀번호가 일치하지 않습니다. 틀린횟수: " + member.getMember_count()
					+ "번'); location.href='/login'</script>");
		}

	}
}