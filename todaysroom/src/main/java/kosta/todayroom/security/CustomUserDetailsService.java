package kosta.todayroom.security;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kosta.todayroom.domain.CustomUser;
import kosta.todayroom.domain.MemberVO;
import kosta.todayroom.mapper.MemberMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
public class CustomUserDetailsService implements UserDetailsService{
	@Setter(onMethod_=@Autowired)
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.warn("Load User By userName: "+ username);
		
		MemberVO vo=memberMapper.read(username);
		log.warn(vo);
		log.warn("111");
//		ArrayList<SimpleGrantedAuthority> auth=new ArrayList<>();
//		auth.add(new SimpleGrantedAuthority(vo.getMember_rating()));
		

		
		log.warn("queried by member mapper: "+ vo);
		
		return vo==null? null: new CustomUser(vo);
	}

}
