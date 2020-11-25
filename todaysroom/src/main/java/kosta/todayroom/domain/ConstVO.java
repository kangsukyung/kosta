package kosta.todayroom.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("Const")
public class ConstVO {
	private int const_seq;
	private String const_space;
	private String const_style;
	private String const_color;
	private String const_budget;
	private int member_seq;
	private String const_type;
}
