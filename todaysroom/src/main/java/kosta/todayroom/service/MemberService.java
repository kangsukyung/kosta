package kosta.todayroom.service;

import kosta.todayroom.domain.MemberVO;

public interface MemberService {
	public MemberVO idCheck(String id);
	public MemberVO nickNameCheck(String name);
	public int register(MemberVO member);
	public int modify(MemberVO member);
	public MemberVO Check(int seq);
}
