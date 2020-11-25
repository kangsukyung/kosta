package kosta.todayroom.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class ContractorVO implements Serializable {
	private int contractor_seq;
	private String contractor_bname;
	private String contractor_name;
	private String contractor_address;
	private int member_seq;
	private int admin_seq;
}
