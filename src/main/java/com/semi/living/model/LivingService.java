package com.semi.living.model;

import java.sql.SQLException;
import java.util.List;

public class LivingService {
	private LivingDAO dao;
	
	public LivingService() {
		dao = new LivingDAO();
	}
	
	public int insertLiving(LivingVO vo) throws SQLException {
		return dao.insertLiving(vo);
	}
	
	public List<LivingVO> selectAll(String search) throws SQLException {
		return dao.selectAll(search);
	}
	
	public LivingVO selectBywNo(int wNo) throws SQLException {
		return dao.selectBywNo(wNo);
	}
	
	public int updateLiving(LivingVO vo) throws SQLException {
		return dao.updateLiving(vo);
	}
	
	public int deleteLiving(int wNo) throws SQLException {
		return dao.deleteLiving(wNo);
	}
	
	public String findNickname(int wno)throws SQLException{
		return dao.findNickname(wno);
	}
	
	public int recUpdate(int wNo) throws SQLException {
		return dao.recUpdate(wNo);
	}
}
