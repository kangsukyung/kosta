package kosta.todayroom.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.todayroom.domain.MemberVO;
import kosta.todayroom.mapper.MemberMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{

	private HttpServletRequest request;
	private BCryptPasswordEncoder pwdEncoder;
	private MemberMapper mapper;
	
	@Override
	public MemberVO idCheck(String id) {
		return mapper.idCheck(id);
	}

	@Override
	public MemberVO nickNameCheck(String name) {
		return mapper.nickNameCheck(name);
	}

	@Transactional
	@Override
	public int register(MemberVO member) {
		String password=member.getMember_password();
		member.setMember_password(pwdEncoder.encode(password));
		return mapper.register(member);
	}

	@Transactional
	@Override
	public int update(MemberVO vo) {
		
		int check=mapper.update(vo);
		
		if(check>0){
			MemberVO member=mapper.read(vo.getMember_id());
			log.warn("서비스 멤버:"+member);
			request.getSession().removeAttribute("member");
			request.getSession().setAttribute("member", member);
		}
		return check;
	}

	@Override
	public MemberVO Check(int seq) {
		return mapper.Check(seq);
	}

}
