package kosta.todayroom.domain;

import java.util.ArrayList;
import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;
import lombok.extern.log4j.Log4j;

@Log4j
@Getter
public class CustomUser extends User{
	private static final long serialVesionUID=1L;
	private MemberVO member;
	
	private static Collection<? extends GrantedAuthority> authorities(String rating){
        Collection<SimpleGrantedAuthority> authorities = new ArrayList<>();
        if(rating.equals("1")){//일반유저
            authorities.add(new SimpleGrantedAuthority("ROLE_1"));
        }else if(rating.equals("2")){//판매자
            authorities.add(new SimpleGrantedAuthority("ROLE_2"));
        }else if(rating.equals("3")){//전문가
        	authorities.add(new SimpleGrantedAuthority("ROLE_3"));
        }else if(rating.equals("4")){//비활성화
        	
        }else if(rating.equals("0")){//탈퇴회원
        	
        }
        	
        return authorities;
    }
	
	public CustomUser(String username, String password,Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}


	public CustomUser(MemberVO vo) {
		super(vo.getMember_id(), vo.getMember_password(), (Collection<? extends GrantedAuthority>) authorities(vo.getMember_rating()));
		log.warn("WARN"+authorities(vo.getMember_rating()));
		this.member=vo;
	}

}
