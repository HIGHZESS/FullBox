package com.semi.product.model;

import java.sql.Timestamp;

public class ProductVO {
	private int pno;
	private String pname;	
	private String pintro;
	private Timestamp regdate;	
	private int price;
	private int vno;	
	private String fname;
	private long fsize;
	private String foname;
	private int sno;
	
	public ProductVO() {
		super();
	}

	public ProductVO(int pno, String pname, String pintro, Timestamp regdate,  int price,
			int vno, String fname, long fsize, String foname,int sno) {
		super();
		this.pno = pno;
		this.pname = pname;
		this.pintro = pintro;
		this.regdate = regdate;
		this.price = price;
		this.vno = vno;
		this.fname = fname;
		this.fsize = fsize;
		this.foname = foname;
		this.sno = sno;
	}

	public int getpNo() {
		return pno;
	}

	public void setpNo(int pno) {
		this.pno = pno;
	}

	public String getpName() {
		return pname;
	}

	public void setpName(String pname) {
		this.pname = pname;
	}

	public String getpIntro() {
		return pintro;
	}

	public void setpIntro(String pintro) {
		this.pintro = pintro;
	}
	
	public Timestamp getRegdate() {
		return regdate;
	}
	
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	
	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	public int getvNo() {
		return vno;
	}
	
	public void setvNo(int vno) {
		this.vno = vno;
	}

	public String getfName() {
		return fname;
	}

	public void setfName(String fname) {
		this.fname = fname;
	}

	public long getfSize() {
		return fsize;
	}

	public void setfSize(long fsize) {
		this.fsize = fsize;
	}
	
	public String getfoName() {
		return foname;
	}
	
	public void setfoName(String foname) {
		this.foname = foname;
	}
	
	public int getsNo() {
		return sno;
	}
	
	public void setsNo(int sno) {
		this.sno = sno;
	}

	@Override
	public String toString() {
		return "ProductVO [pno=" + pno + ", pname=" + pname + ", pintro=" + pintro + ", regdate=" + regdate + ", price="
				+ price + ", vno=" + vno + ", fname=" + fname + ", fsize=" + fsize + ", foname=" + foname + ", sno="
				+ sno + "]";
	}

	
	
}
