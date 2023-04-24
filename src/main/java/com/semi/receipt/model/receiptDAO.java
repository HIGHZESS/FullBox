package com.semi.receipt.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;
import com.semi.living.model.LivingVO;
import com.semi3.member.model.RecipeVO;

public class receiptDAO {
	private ConnectionPoolMgr pool;
	
	public receiptDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	public List<receiptVO> selectAll() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<receiptVO> list = new ArrayList<receiptVO>();
		
		try {
			con=pool.getConnection();
			
			String sql="select * from receipt";
			ps=con.prepareStatement(sql);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int orNo= rs.getInt("orNo");
				int tPrice = rs.getInt("tPrice");
				String sType = rs.getString("sType");
				int pNo = rs.getInt("pNo");
				int sNo = rs.getInt("sNo");
				int mNo = rs.getInt("mNo");


				receiptVO vo = new receiptVO(orNo, tPrice, sType, pNo, sNo, mNo);
				
				list.add(vo);
			}
			System.out.println("주문확인서 조회 list size="+list.size());
			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public receiptVO selectByorNo(int orNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		receiptVO vo = new receiptVO();
		try {
			con=pool.getConnection();
			
			String sql="select * from receipt"
					+ " where orNo=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, orNo);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				vo.setOrNo(rs.getInt("orNo"));
				vo.settPrice(rs.getInt("tPrice"));
				vo.setsType(rs.getString("sType"));
				vo.setpNo(rs.getInt("pNo"));
				vo.setsNo(rs.getInt("sNo"));
				vo.setmNo(rs.getInt("mNo"));
			}
			
			System.out.println("선택 조회 orNo="+orNo);
			return vo;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int insertRecipe(receiptVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int cnt=0;
		
		try {
			con=pool.getConnection();
			String sql="insert into receipt values (receipt_seq.nextval, ? , 'N', ?,?,?)"; //회원아이디 테스트용임! 바꿔야함@@@@@@@@@@@@@@@@@@
			ps=con.prepareStatement(sql); 
			ps.setInt(1, vo.gettPrice()); 
			ps.setInt(2, vo.getpNo()); 
			ps.setInt(3, vo.getsNo()); 
			ps.setInt(4, vo.getmNo()); 
			
			cnt=ps.executeUpdate();
			if(cnt>0) {
				System.out.println("recipe 게시글 등록 cnt = "+cnt+", 매개변수 vo = "+vo);
			}
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
}
