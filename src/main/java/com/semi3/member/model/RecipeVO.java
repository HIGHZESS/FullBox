package com.semi3.member.model;

import java.sql.Timestamp;

public class RecipeVO {
	private int wNo;         
	private String title;  
	private String content; 
	private String rLevel;   
	private int rView;         
	private int star;         
	private int stCount;       
	private Timestamp regdate;           
	private String fName;  
	private long fSize;           
	private String fOname; 
	private int mNo;   
	
	public RecipeVO() {
		super();
	}


	public RecipeVO(int wNo, String title, String content, String rLevel, int rView, int star, int stCount,
			Timestamp regdate, String fName, long fSize, String fOname, int mNo) {
		super();
		this.wNo = wNo;
		this.title = title;
		this.content = content;
		this.rLevel = rLevel;
		this.rView = rView;
		this.star = star;
		this.stCount = stCount;
		this.regdate = regdate;
		this.fName = fName;
		this.fSize = fSize;
		this.fOname = fOname;
		this.mNo = mNo;
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

	public String getrLevel() {
		return rLevel;
	}

	public void setrLevel(String rLevel) {
		this.rLevel = rLevel;
	}

	public int getrView() {
		return rView;
	}

	public void setrView(int rView) {
		this.rView = rView;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public int getStCount() {
		return stCount;
	}

	public void setStCount(int stCount) {
		this.stCount = stCount;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	
	public Timestamp getRegdate() {
		return regdate;
	}


	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}


	public String getfName() {
		return fName;
	}


	public void setfName(String fName) {
		this.fName = fName;
	}


	public long getfSize() {
		return fSize;
	}


	public void setfSize(long fSize) {
		this.fSize = fSize;
	}


	public String getfOname() {
		return fOname;
	}


	public void setfOname(String fOname) {
		this.fOname = fOname;
	}


	@Override
	public String toString() {
		return "RecipeVO [wNo=" + wNo + ", title=" + title + ", content=" + content + ", rLevel=" + rLevel + ", rView="
				+ rView + ", star=" + star + ", stCount=" + stCount + ", regdate=" + regdate + ", fName=" + fName
				+ ", fSize=" + fSize + ", fOname=" + fOname + ", mNo=" + mNo + "]";
	}



	
	
}
