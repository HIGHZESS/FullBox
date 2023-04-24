package com.semi.AskReboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.semi.db.ConnectionPoolMgr;

public class AskReboardDAO {
	
	private ConnectionPoolMgr pool;
	
	public AskReboardDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	public int insertReply(AskReboardVO vo)throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			
			con = pool.getConnection();
			
			String sql="insert into askreboard(rno,recontent,mno,ano)\r\n"
					+ "values(ASKREBOARD_SEQ.nextval, ?,?,?)";
			ps = con.prepareStatement(sql);
			
			ps.setString(1, vo.getRecontent());
			ps.setInt(2, vo.getMno());
			ps.setInt(3, vo.getAno());
			
			int cnt = ps.executeUpdate();
			System.out.println("답변작성결과 = "+cnt+", 매개변수 vo ="+vo);
			
			return cnt;
			
			
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public AskReboardVO selectByAno(int aNo)throws SQLException{
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs =null;
		
		AskReboardVO vo = new AskReboardVO();
		
		try {
			con=pool.getConnection();
			
			String sql ="select * from askreboard where ano = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, aNo);
			
			rs=ps.executeQuery();
			
			if(rs.next()) {
				vo.setAno(aNo);
				vo.setMno(rs.getInt("mno"));
				vo.setRecontent(rs.getString("recontent"));
				vo.setRegdate(rs.getTimestamp("regdate"));
				vo.setRno(rs.getInt("rno"));
				
			}
			System.out.println("답글선택조회 vo ="+vo+", 매개변수 aNo="+aNo);
			return vo;

		}finally {
			pool.dbClose(rs, ps, con);
		}
		
	}
		
}
