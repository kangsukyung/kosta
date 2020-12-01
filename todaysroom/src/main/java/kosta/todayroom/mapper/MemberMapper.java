package kosta.todayroom.mapper;

import org.apache.ibatis.annotations.Param;

import kosta.todayroom.domain.MemberVO;

public interface MemberMapper {
	public MemberVO idCheck(String id);
	public MemberVO nickNameCheck(String name);
	public int register(MemberVO member);
	public MemberVO read(String id);
	public int modify(MemberVO member);
	public int ratingUpdate(@Param("member") int member , @Param("num") int num);
	public MemberVO Check(int seq);
	public int countUpdate(@Param("seq") int seq , @Param("num") int num);
	public MemberVO passwordFound(@Param("member_id")String member_id, @Param("member_phone") String member_phone);
}
