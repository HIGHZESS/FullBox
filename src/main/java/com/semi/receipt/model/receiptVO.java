package com.semi.receipt.model;

public class receiptVO {
	private int orNo; /* 주문번호 */
	private int tPrice; /* 총금액 */
	private String sType; /* 배송유형 */
	private int pNo; /* 상품번호 */
	private int sNo; /* 판매자번호 */
	private int mNo; /* 회원번호 */
	
	public receiptVO() {
		super();
	}

	public receiptVO(int orNo, int tPrice, String sType, int pNo, int sNo, int mNo) {
		super();
		this.orNo = orNo;
		this.tPrice = tPrice;
		this.sType = sType;
		this.pNo = pNo;
		this.sNo = sNo;
		this.mNo = mNo;
	}

	public int getOrNo() {
		return orNo;
	}

	public void setOrNo(int orNo) {
		this.orNo = orNo;
	}

	public int gettPrice() {
		return tPrice;
	}

	public void settPrice(int tPrice) {
		this.tPrice = tPrice;
	}

	public String getsType() {
		return sType;
	}

	public void setsType(String sType) {
		this.sType = sType;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	@Override
	public String toString() {
		return "receiptVO [orNo=" + orNo + ", tPrice=" + tPrice + ", sType=" + sType + ", pNo=" + pNo + ", sNo=" + sNo
				+ ", mNo=" + mNo + "]";
	}
	
	
}
