package kosta.todayroom.mapper;

import kosta.todayroom.domain.MemberVO;

public interface MemberMapper {
	public MemberVO idCheck(String id);
	public MemberVO nickNameCheck(String name);
	public int register(MemberVO member);
	public MemberVO read(String id);
	public int update(MemberVO member);
}
