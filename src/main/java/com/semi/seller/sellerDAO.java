package com.semi.seller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.herbmall.db.ConnectionPoolMgr;
import com.semi.bmember.model.bMemberVO;


public class sellerDAO {
	private ConnectionPoolMgr pool;
	
	public sellerDAO() {
		pool = new ConnectionPoolMgr();
	}
	
	public int insertSeller(sellerVO vo)throws SQLException{
		
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = pool.getConnection();
			String sql = "insert into seller (sno,sregnum,sintro,mno,sname)\r\n"
					+ "values(SELLER_SEQ.nextval, ?,?,?,?)";
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, vo.getsRegnum());
			ps.setString(2, vo.getsIntro());
			ps.setInt(3, vo.getMno());
			ps.setString(4, vo.getsName());
			
			int cnt = ps.executeUpdate();
			System.out.println("판매자정보 등록결과 : "+cnt+", 매개변수 vo :"+vo);
			
			return cnt;
			
		}finally {
			pool.dbClose(ps, con);
		}	
	}
	
	public sellerVO selectByMno(int mno)throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		
		sellerVO vo = new sellerVO();
		try {
			con = pool.getConnection();
			String sql ="select * from seller where sno =? ";
			ps = con.prepareStatement(sql);
			ps.setInt(1, mno);
			rs= ps.executeQuery();
			if(rs.next()) {
				vo.setMno(mno);
				vo.setsName(rs.getString("name"));
				vo.setsIntro(rs.getString("sintro"));
				vo.setSno(rs.getInt("sno"));
				vo.setsRegnum(rs.getInt("regnum"));
			}
			System.out.println("회원번호로 조회결과vo ="+vo+", 매개변수 mno ="+mno);
			
			return vo;
			
		}finally {
			pool.dbClose(rs, ps, con);
		}	
	}
	
	public int updateSeller(sellerVO vo)throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = pool.getConnection();
			
			String sql ="update seller\r\n"
					+ "set sregnum =?, sintro=?,sname=?\r\n"
					+ "where mno = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, vo.getsRegnum());
			ps.setString(2, vo.getsIntro());
			ps.setString(3, vo.getsName());
			ps.setInt(4, vo.getMno());

			
			int cnt = ps.executeUpdate();
			
			System.out.println("판매자정보 수정 결과 cnt="+cnt
					+", 매개변수 vo="+vo);
			return cnt;
			
		}finally {
			pool.dbClose(ps, con);
		}
	}

	
	
	

}
