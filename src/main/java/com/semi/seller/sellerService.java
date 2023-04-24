package com.semi.seller;

import java.sql.SQLException;

public class sellerService {
	public sellerDAO dao;
	
	public sellerService() {
		dao = new sellerDAO();
	}

	public int insertSeller(sellerVO vo)throws SQLException{
		return dao.insertSeller(vo);
	}
	public sellerVO selectByMno(int mno)throws SQLException{
		return dao.selectByMno(mno);
	}
	public int updateSeller(sellerVO vo)throws SQLException{
		return dao.updateSeller(vo);
	}
			
		
	
}
