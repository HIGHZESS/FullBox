package com.ReviewBoard;

import java.sql.Timestamp;

public class ReviewVO {
	private int wNo;
	private String title;
	private String content;
	private int rview;
	private String type;
	private int rec;
	private int mno;
	private Timestamp regdate;
	private String FNAME;
	private Long FSIZE;      
	private String FONAME;


	public ReviewVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public ReviewVO(int wNo, String title, String content, int rview, String type, int rec, int mno, Timestamp regdate,
			String fNAME, Long fSIZE, String fONAME) {
		super();
		this.wNo = wNo;
		this.title = title;
		this.content = content;
		this.rview = rview;
		this.type = type;
		this.rec = rec;
		this.mno = mno;
		this.regdate = regdate;
		this.FNAME = fNAME;
		this.FSIZE = fSIZE;
		this.FONAME = fONAME;
	}


	public int getwNo() {
		return wNo;
	}
	public void setwNo(int wNo) {
		this.wNo = wNo;
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
	
	public int getRview() {
		return rview;
	}
	public void setRview(int rview) {
		this.rview = rview;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getRec() {
		return rec;
	}
	public void setRec(int rec) {
		this.rec = rec;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getFNAME() {
		return FNAME;
	}
	public void setFNAME(String fNAME) {
		FNAME = fNAME;
	}
	public Long getFSIZE() {
		return FSIZE;
	}
	public void setFSIZE(Long fSIZE) {
		FSIZE = fSIZE;
	}
	public String getFONAME() {
		return FONAME;
	}
	public void setFONAME(String fONAME) {
		FONAME = fONAME;
	}

	@Override
	public String toString() {
		return "ReviewVO [wNo=" + wNo + ", title=" + title + ", content=" + content + ", rview=" + rview + ", type="
				+ type + ", rec=" + rec + ", mno=" + mno + ", regdate=" + regdate + ", FNAME=" + FNAME + ", FSIZE="
				+ FSIZE + ", FONAME=" + FONAME + "]";
	}
	
	
	
	
	
	
}
