package com.semi.AskBoard;

import java.sql.Timestamp;

public class AskBoardVO {

	private int aNo;
	private String reply;
	private String aPublic;
	private Timestamp regdate;
	private int mno;
	private String title;
	private String content;
	
	public AskBoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AskBoardVO(int aNo, String reply, String aPublic, Timestamp regdate, int mno, String title, String content) {
		super();
		this.aNo = aNo;
		this.reply = reply;
		this.aPublic = aPublic;
		this.regdate = regdate;
		this.mno = mno;
		this.title = title;
		this.content = content;
	}

	public int getaNo() {
		return aNo;
	}

	public void setaNo(int aNo) {
		this.aNo = aNo;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public String getaPublic() {
		return aPublic;
	}

	public void setaPublic(String aPublic) {
		this.aPublic = aPublic;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "AskBoardVO [aNo=" + aNo + ", reply=" + reply + ", aPublic=" + aPublic + ", regdate=" + regdate
				+ ", mno=" + mno + ", title=" + title + ", content=" + content + "]";
	}
	
	
	

}
