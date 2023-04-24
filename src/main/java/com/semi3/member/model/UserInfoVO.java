package com.semi3.member.model;

public class UserInfoVO {
	private int wno;
	private int mno;
	private String id;
	private String nickName;
	
	
	public UserInfoVO() {
		super();
	}

	public UserInfoVO(int wno, int mno, String id, String nickName) {
		super();
		this.wno = wno;
		this.mno = mno;
		this.id = id;
		this.nickName = nickName;
	}

	public int getWno() {
		return wno;
	}

	public void setWno(int wno) {
		this.wno = wno;
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

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "UserInfoVO [wno=" + wno + ", mno=" + mno + ", id=" + id + ", nickName=" + nickName + "]";
	}
	
	

	
}
