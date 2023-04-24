package com.semi.AskBoard;

import java.sql.SQLException;
import java.util.List;

public class AskBoardService {
	public AskBoardDAO dao;
		
	public AskBoardService() {
		dao = new AskBoardDAO();
	}

	
	public int insertAsk(AskBoardVO vo) throws SQLException {
		return dao.insertAsk(vo);
	}
	
	public List<AskBoardVO> selectAll(String search) throws SQLException {
		return dao.selectAll(search);
	}
	public AskBoardVO selectByaNo(int aNo) throws SQLException {
		return dao.selectByaNo(aNo);
	}
	public int updateAsk(AskBoardVO vo) throws SQLException {
		return dao.updateAsk(vo);
	}
	public int deleteAsk(int aNo) throws SQLException {
		return dao.deleteAsk(aNo);
	}
	public String findNickname(int ano)throws SQLException{
		return dao.findNickname(ano);
	}
	public int updateIsReply(int ano)throws SQLException{
		return dao.updateIsReply(ano);
	}
		
	    
		
		
			
	
	
}
