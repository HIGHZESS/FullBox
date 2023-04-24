package com.semi3.member.model;

import java.sql.SQLException;
import java.util.List;

import com.semi.bmember.model.bMemberVO;

public class RecipeService {
	private RecipeDAO recipeDao;
	
	public RecipeService() {
		recipeDao=new RecipeDAO();
	}
	
	public int insertRecipe(RecipeVO vo, int mNo) throws SQLException {
		return recipeDao.insertRecipe(vo, mNo);
	}
	
	public List<RecipeVO> selectAll(String condition, String keyword) throws SQLException{
		return recipeDao.selectAll(condition, keyword);
	}
	public List<RecipeVO> selectAll() throws SQLException{
		return recipeDao.selectAll();
	}
	
	public List<RecipeVO> selectRank() throws SQLException{
		return recipeDao.selectRank();
	}
	
	public int updateCount(int no) throws SQLException {
		return recipeDao.updateCount(no);
	}
	
	public RecipeVO selectByNo(int no) throws SQLException {
		return recipeDao.selectByNo(no);
	}

	public bMemberVO userByNo(int no) throws SQLException { //회원번호로 유저 닉네임 알아오는 메소드
		return recipeDao.userByNo(no);
	}
	public String selectNicknameByNo(int mNo) throws SQLException {
		return recipeDao.selectNicknameByNo(mNo);
	}

	
   public boolean checkUserid(String id, RecipeVO rVo) throws SQLException {
	   return recipeDao.checkUserid(id, rVo);
   }
   
   public int deleteByNo(int wNo) throws SQLException {
	   return recipeDao.deleteByNo(wNo);
   }
   
   public int updateStcount(int wNo, int rLevel) throws SQLException {
	   return recipeDao.updateStcount(wNo, rLevel);
   }





}
