package com.semi.AskReboard;

import java.sql.SQLException;

import com.ReviewBoard.ReviewDAO;

public class AskReboardService {
	public AskReboardDAO dao;
	
	public AskReboardService() {
		dao = new AskReboardDAO();
	}
	
	
	public int insertReply(AskReboardVO vo)throws SQLException{
		return dao.insertReply(vo);
	}
	public AskReboardVO selectByAno(int aNo)throws SQLException{
		return dao.selectByAno(aNo);
	}
		
		

}
