package com.semi.common;

public class PagingVO {
	private int nowPage;
	private int totalW;
	private int pageSize;
	private int totalPage;
	private int blockSize;
	private int firstPage;
	private int lastPage;
	private int curPos;
	private int num;
	
	public PagingVO(int nowPage, int totalW, int pageSize, int blockSize) {
		this.nowPage = nowPage;
		this.totalW = totalW;
		this.pageSize = pageSize;
		this.blockSize = blockSize;
		
		totalPage=(int)Math.ceil((float)totalW/pageSize);
		firstPage=nowPage-((nowPage-1)%blockSize);
		lastPage=firstPage+(blockSize-1);
		curPos=(nowPage-1)*pageSize;
		num=totalW-curPos;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getTotalW() {
		return totalW;
	}

	public void setTotalW(int totalW) {
		this.totalW = totalW;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public int getFirstPage() {
		return firstPage;
	}

	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getCurPos() {
		return curPos;
	}

	public void setCurPos(int curPos) {
		this.curPos = curPos;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
	
	
}
