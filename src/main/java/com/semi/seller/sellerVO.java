package com.semi.seller;

public class sellerVO {
	private int sno;
	private int sRegnum;
	private String sIntro;
	private int mno;
	private String sName;
	
	public sellerVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public sellerVO(int sno, int sRegnum, String sIntro, int mno, String sName) {
		super();
		this.sno = sno;
		this.sRegnum = sRegnum;
		this.sIntro = sIntro;
		this.mno = mno;
		this.sName = sName;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public int getsRegnum() {
		return sRegnum;
	}

	public void setsRegnum(int sRegnum) {
		this.sRegnum = sRegnum;
	}

	public String getsIntro() {
		return sIntro;
	}

	public void setsIntro(String sIntro) {
		this.sIntro = sIntro;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	@Override
	public String toString() {
		return "sellerVO [sno=" + sno + ", sRegnum=" + sRegnum + ", sIntro=" + sIntro + ", mno=" + mno + ", sName="
				+ sName + "]";
	}
	
	
	
	
}
