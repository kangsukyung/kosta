package kosta.todayroom.domain;

import lombok.Data;

@Data
public class RoomwarmingVO{
	private int board_seq;
	private String roomwarming_type;
	private String roomwarming_classification;
	private String roomwarming_space;
	private String roomwarming_style;
	private String roomwarming_color;
	private String roomwarming_budget;
}
