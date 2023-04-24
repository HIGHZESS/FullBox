package com.semi.product.model;

import java.sql.SQLException;
import java.util.List;

public class ProductService {
	private ProductDAO dao;
	
	public ProductService() {
		dao = new ProductDAO();
	}
	
	public int insertProduct(ProductVO vo) throws SQLException {
		return dao.insertProduct(vo);
	}
	
	public List<ProductVO> selectAll(String condition, String keyword) throws SQLException {
		return dao.selectAll(condition, keyword);
	}

	public List<ProductVO> selectAllByVege(String condition, String keyword)throws SQLException {
		return dao.selectAllByVege(condition, keyword);
	}
	
	public List<ProductVO> selectAllByFruit(String condition, String keyword)throws SQLException {
		return dao.selectAllByFruit(condition, keyword);
	}


	
	public List<ProductVO> selectAll() throws SQLException {
		return dao.selectAll();
	}
	
	public ProductVO selectBypNo(int pNo) throws SQLException {
		return dao.selectBypNo(pNo);
	}
	
	public int updateProduct(ProductVO vo) throws SQLException {
		return dao.updateProduct(vo);
	}
	
	public int deleteProduct(int pNo) throws SQLException {
		return dao.deleteProduct(pNo);
	}
}
