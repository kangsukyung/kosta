package kosta.todayroom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kosta.todayroom.domain.BoardAttachVO;
import kosta.todayroom.domain.BoardVO;
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
	public int update(@Param("member_id") String member_id, @Param("password") String member_password);
	public MemberVO idFound(@Param("member_name")String member_name, @Param("member_phone") String member_phone);
	public List<BoardVO> MyRoomList(int seq);
	public List<BoardVO> MyKnowhowList(int seq);
	public BoardAttachVO readThumbnail(@Param("board_seq")int board_seq, @Param("fileName")String fileName);
	public List<MemberVO> memberList();
}
