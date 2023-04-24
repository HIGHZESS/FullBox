package com.semi.AskReboard;

import java.sql.Timestamp;

public class AskReboardVO {
	private int rno;
	private String recontent;
	private Timestamp regdate;
	private int mno;
	private int ano;
	public AskReboardVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AskReboardVO(int rno, String recontent, Timestamp regdate, int mno, int ano) {
		super();
		this.rno = rno;
		this.recontent = recontent;
		this.regdate = regdate;
		this.mno = mno;
		this.ano = ano;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getRecontent() {
		return recontent;
	}
	public void setRecontent(String recontent) {
		this.recontent = recontent;
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
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	@Override
	public String toString() {
		return "AskReboardVO [rno=" + rno + ", recontent=" + recontent + ", regdate=" + regdate + ", mno=" + mno
				+ ", ano=" + ano + "]";
	}
	

	
}	
