package kosta.todayroom.service;

import org.apache.ibatis.annotations.Param;

import kosta.todayroom.domain.MemberVO;

public interface MemberService {
	public MemberVO idCheck(String id);
	public MemberVO nickNameCheck(String name);
	public int register(MemberVO member);
	public int modify(MemberVO member);
	public MemberVO Check(int seq);
	public int countUpdate(int seq , int num);
	public int ratingUpdate(int member, int num);
	public MemberVO passwordFound(String member_id, String member_phone);
	public int update(String member_id, String member_password);
	public MemberVO idFound(String member_name, String member_phone);

}
