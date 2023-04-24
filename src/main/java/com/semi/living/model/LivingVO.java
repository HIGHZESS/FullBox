package com.semi.living.model;

import java.sql.Timestamp;

public class LivingVO {
	private int wNo;/* 글번호 */
	private String title;/* 제목 */
	private String content; /* 내용 */
	private int lView;/* 조회수 */
	private int rec;/* 추천수 */
	
    private Timestamp regdate; /* 등록일 */
	private String fName; /* 파일이름 */
	private long fSize; /* 파일크기 */
	private String fOname; /* 파일원래이름 */
	
	private int mNo;/* 회원번호 */
	
	public LivingVO() {
		super();
	}

	public LivingVO(int wNo, String title, String content, int lView, int rec, Timestamp regdate, String fName,
			long fSize, String fOname, int mNo) {
		super();
		this.wNo = wNo;
		this.title = title;
		this.content = content;
		this.lView = lView;
		this.rec = rec;
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

	public int getlView() {
		return lView;
	}

	public void setlView(int lView) {
		this.lView = lView;
	}

	public int getRec() {
		return rec;
	}

	public void setRec(int rec) {
		this.rec = rec;
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

	public String getfOname() {
		return fOname;
	}

	public void setfOname(String fOname) {
		this.fOname = fOname;
	}

	public long getfSize() {
		return fSize;
	}

	public void setfSize(long fSize) {
		this.fSize = fSize;
	}

	@Override
	public String toString() {
		return "LivingDTO [wNo=" + wNo + ", title=" + title + ", content=" + content + ", lView=" + lView + ", rec="
				+ rec + ", mNo=" + mNo + ", regdate=" + regdate + ", fName=" + fName + ", fOname=" + fOname + ", fSize="
				+ fSize + "]";
	}
	
	
}
