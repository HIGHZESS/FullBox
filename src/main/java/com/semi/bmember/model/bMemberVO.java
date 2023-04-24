package com.semi.bmember.model;

import java.sql.Timestamp;

public class bMemberVO {
	private int mno;
	private String id;
	private String pwd;
	private String name;
	private String address;
	private String zipcode;
	private String addressDetail;
	private String email;
	private String nickname;
	private Timestamp regdate ;
	private String sub ;
	public bMemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public bMemberVO(int mno, String id, String pwd, String name, String address, String zipcode, String addressDetail,
			String email, String nickname, Timestamp regdate, String sub) {
		super();
		this.mno = mno;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.address = address;
		this.zipcode = zipcode;
		this.addressDetail = addressDetail;
		this.email = email;
		this.nickname = nickname;
		this.regdate = regdate;
		this.sub = sub;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getSub() {
		return sub;
	}
	public void setSub(String sub) {
		this.sub = sub;
	}
	@Override
	public String toString() {
		return "bMemberVO [mno=" + mno + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", address=" + address
				+ ", zipcode=" + zipcode + ", addressDetail=" + addressDetail + ", email=" + email + ", nickname="
				+ nickname + ", regdate=" + regdate + ", sub=" + sub + "]";
	}
	
	


	
	
	
	
}
