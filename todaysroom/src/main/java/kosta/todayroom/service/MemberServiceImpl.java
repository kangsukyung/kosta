package kosta.todayroom.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.todayroom.domain.MemberVO;
import kosta.todayroom.mapper.MemberMapper;
import lombok.AllArgsConstructor;
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
	public int modify(MemberVO vo) {
		MemberVO member=mapper.idCheck(vo.getMember_id());
		int check=0;
		if(member.getMember_password().equals(vo.getMember_password())){
			log.warn("성공");
			check=mapper.modify(vo);
		}else{
			log.warn("실패");
			String password=vo.getMember_password();
			vo.setMember_password(pwdEncoder.encode(password));
			check=mapper.modify(vo);
		}
		
		return check;
	}

	@Override
	public MemberVO Check(int seq) {
		return mapper.Check(seq);
	}

	@Override
	public int countUpdate(int seq, int num) {
		return mapper.countUpdate(seq, num);
	}

	@Override
	public int ratingUpdate(int member, int num) {
		return mapper.ratingUpdate(member, num);
	}

	@Override
	public MemberVO passwordFound(String member_id, String member_phone) {
		return mapper.passwordFound(member_id, member_phone);
	}

	@Transactional
	@Override
	public int update(String member_id, String member_password) {
		String password=pwdEncoder.encode(member_password);
		return mapper.update(member_id, password);
	}

}
