package com.semi.receipt.model;

import java.sql.SQLException;
import java.util.List;

public class receiptService {
	receiptDAO dao;
	public receiptService() {
		dao=new receiptDAO();
	}
	
	public List<receiptVO> selectAll() throws SQLException {
		return dao.selectAll();
	}
	
	public receiptVO selectByorNo(int orNo) throws SQLException {
		return dao.selectByorNo(orNo);
	}
	
	public int insertRecipe(receiptVO vo) throws SQLException {
		return dao.insertRecipe(vo);
	}

}
