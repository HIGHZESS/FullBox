package com.ReviewBoard;

import java.sql.SQLException;
import java.util.List;

public class ReviewService {
	public ReviewDAO dao;
	
	public ReviewService() {
		dao = new ReviewDAO();
	}
	public int insertReview(ReviewVO vo)throws SQLException{
		return dao.insertReview(vo);
	}
	
	public List<ReviewVO>selectAll(String condition, String keyword)throws SQLException{
		return dao.selectAll(condition, keyword);
	}
	
	public ReviewVO selectByNo(int no)throws SQLException{
		return dao.selectByNo(no);
		
	}
	
	public int updateReview(ReviewVO vo)throws SQLException{
		return dao.updateReview(vo);
	
	}
	
	public String findNickname(int mno)throws SQLException{
		
		return dao.findNickname(mno);
	}
	
	public ReviewVO selectByWno(int wno)throws SQLException{
		return dao.selectByNo(wno);
	}
	
	public int findMno(String id)throws SQLException{
		return dao.findMno(id);
	}
	public List<ReviewVO>selectMyReview(int mno)throws SQLException{
		return dao.selectMyReview(mno);
	}
	public List<ReviewVO>selectPhotoReview()throws SQLException{
		return dao.selectPhotoReview();
	}
	public int deleteReview(int wno)throws SQLException{
		return dao.deleteReview(wno);
	}
		
		
		
	
}
