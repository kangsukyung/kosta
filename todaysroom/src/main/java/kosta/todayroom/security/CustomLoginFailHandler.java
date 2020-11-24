package kosta.todayroom.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import kosta.todayroom.domain.MemberVO;
import kosta.todayroom.service.MemberService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginFailHandler implements AuthenticationFailureHandler{

	@Setter(onMethod_=@Autowired)
	private MemberService service;
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException auth) throws IOException, ServletException {
			log.warn("실패!!!!!!!!!");
			MemberVO member=service.idCheck(request.getParameter("username"));
			if(member.getMember_count()>=5){
				log.info("gggggg"+ member.getMember_seq());
			}
		response.sendRedirect("/login");
	}

}
