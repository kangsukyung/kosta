package kosta.todayroom.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class VendorVO implements Serializable {
	private int vendor_seq;
	private String vendor_name;
	private String vendor_license;
	private String vendor_category;
	private String vendor_address;
	private int member_seq;
	private int admin_seq;
}
