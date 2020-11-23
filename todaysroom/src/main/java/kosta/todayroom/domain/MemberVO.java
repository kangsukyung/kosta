package kosta.todayroom.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class MemberVO implements Serializable{
	private long member_seq;
	private String member_id;
	private String member_nickname;
	private String member_name;
	private String member_address;
	private String member_phone;
	private String member_email;
	private String member_rating;
	private String member_password;
	private String member_follows;
	private String member_profile;
	private long member_count;
	private String member_path;
}

