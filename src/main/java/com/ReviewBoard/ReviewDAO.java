package com.ReviewBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.herbmall.db.ConnectionPoolMgr;
import com.semi.AskBoard.AskBoardVO;
import com.semi.living.model.LivingVO;

public class ReviewDAO {
	private ConnectionPoolMgr pool;
	
	public ReviewDAO() {
		pool = new ConnectionPoolMgr();
	}
	
	public int insertReview(ReviewVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = pool.getConnection();
			
			String sql ="insert into review(wno,title,content,mno,FNAME,FONAME,FSIZE)"
					+ " values(review_seq.nextval,?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getContent());
			ps.setInt(3, vo.getMno());
			ps.setString(4, vo.getFNAME());
			ps.setString(5, vo.getFONAME());
			ps.setLong(6,vo.getFSIZE());
			
			int cnt = ps.executeUpdate();
			System.out.println("글등록결과 :" +cnt +", 매개변수 vo:"+vo);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
			
		}		
	}
	
	public List<ReviewVO> selectAll(String condition, String keyword)throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<ReviewVO>list = new ArrayList<ReviewVO>();
		
		try {
			con = pool.getConnection();
			
			String sql = "select * from review ";
			if(keyword!=null && !keyword.isEmpty()) {
				sql+=" where "+condition+" like '%' || ? || '%'";
			}
			sql+=" order by wno desc";
			
			ps = con.prepareStatement(sql);
			if(keyword!=null && !keyword.isEmpty()) {
				ps.setString(1, keyword);
			}
			
			rs = ps.executeQuery();
			while(rs.next()) {
				int wno = rs.getInt("wno");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int rview = rs.getInt("rview");
				String type = rs.getString("type");
				int rec = rs.getInt("rec");
				Timestamp regdate = rs.getTimestamp("regdate");
				String fname = rs.getString("FNAME");
				Long FSIZE = rs.getLong("FSIZE");
				String FONAME = rs.getString("FONAME");
				int mno = rs.getInt("mno");	
				

				ReviewVO vo = new ReviewVO(wno, title, content, rview, type, rec, mno, regdate, fname, FSIZE, FONAME);
				list.add(vo);	
			}
			System.out.println("전체조회결과 list.size :" +list.size());
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public ReviewVO selectByNo(int wno)throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		ReviewVO vo = new ReviewVO();
		try {
			con = pool.getConnection();
			
			String sql ="select * from review where wno = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, wno);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				String title = rs.getString("title");
				String content = rs.getString("content");
				int rview = rs.getInt("rview");
				String type = rs.getString("type");
				int rec = rs.getInt("rec");
				Timestamp regdate = rs.getTimestamp("regdate");
				String fname = rs.getString("FNAME");
				Long FSIZE = rs.getLong("FSIZE");
				String FONAME = rs.getString("FONAME");
				int mno = rs.getInt("mno");	
				
				vo=new ReviewVO(wno, title, content, rview, type, rec, mno, regdate, fname, FSIZE, FONAME);
				
			}
			System.out.println("결과 vo "+vo+", 매개변수 no:"+wno);
			return vo;
			
		}finally {
			pool.dbClose(rs, ps, con);
		}	
	}
	public int updateReview(ReviewVO vo)throws SQLException{
		Connection con =null;
		PreparedStatement ps = null;
		
		try {
			con=pool.getConnection();
			
			String sql = "update review"
					+ " set title=?,content=?"
					+ " where wno=?";
			ps = con.prepareStatement(sql);	
			
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getContent());
			ps.setInt(3, vo.getwNo());
			
			int cnt = ps.executeUpdate();
			System.out.println("수정결과 cnt ="+cnt+", 매개변수 vo ="+vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public String findNickname(int wno)throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String nickname = "";
		try {
			con = pool.getConnection();
			
			String sql = "select b.nickname \r\n"
					+ "from bmember b join review r\r\n"
					+ "on b.mno = r.mno\r\n"
					+ "where r.wno = ?";
			ps =con.prepareStatement(sql);
			ps.setInt(1, wno);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				
				nickname = rs.getString("nickname");
			}
			System.out.println("결과 nickname "+nickname+", 매개변수 리뷰글번호:"+wno);
			return nickname;

		}finally{
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int findMno(String id)throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int mno = 0;
		
		try {
			con = pool.getConnection();
			
			String sql = "select mno from bmember where id =?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				mno = rs.getInt("mno");
				
			}
			System.out.println("결과 mno "+mno+", 매개변수 id:"+id);
			return mno;
			
			
			
		}finally {
			pool.dbClose(rs, ps, con);
			
		}
	}
	
	public List<ReviewVO>selectMyReview(int mno)throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ReviewVO>list = new ArrayList<ReviewVO>();
		
		try {
			
			con = pool.getConnection();
			
			String sql = "select * from review where mno = ?";
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, mno);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				int wno = rs.getInt("wno");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int rview = rs.getInt("rview");
				String type = rs.getString("type");
				int rec = rs.getInt("rec");
				Timestamp regdate = rs.getTimestamp("regdate");
				String fname = rs.getString("FNAME");
				Long FSIZE = rs.getLong("FSIZE");
				String FONAME = rs.getString("FONAME");

				ReviewVO vo = new ReviewVO(wno, title, content, rview, type, rec, mno, regdate, fname, FSIZE, FONAME);
				list.add(vo);	
				
			}
			System.out.println("전체조회결과 list.size :" +list.size());
			return list;
			
			
		}finally {
			
			pool.dbClose(rs, ps, con);
		}
	}
	public List<ReviewVO>selectPhotoReview()throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ReviewVO>list = new ArrayList<ReviewVO>();
		
		try {
			
			con = pool.getConnection();
			
			String sql = "select * from review where fname is not null";
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				int wno = rs.getInt("wno");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int rview = rs.getInt("rview");
				String type = rs.getString("type");
				int rec = rs.getInt("rec");
				Timestamp regdate = rs.getTimestamp("regdate");
				String fname = rs.getString("FNAME");
				Long FSIZE = rs.getLong("FSIZE");
				String FONAME = rs.getString("FONAME");
				int mno = rs.getInt("mno");

				ReviewVO vo = new ReviewVO(wno, title, content, rview, type, rec, mno, regdate, fname, FSIZE, FONAME);
				list.add(vo);	
				
			}
			System.out.println("전체조회결과 list.size :" +list.size());
			return list;
			
			
		}finally {
			
			pool.dbClose(rs, ps, con);
		}
	}
	public int deleteReview(int wno)throws SQLException{
		
		Connection con = null;
		PreparedStatement ps =null;
		
		try {
			con = pool.getConnection();
			
			String sql = "delete from review where wno = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, wno);
			
			int cnt = ps.executeUpdate();
			
			System.out.println("수정결과 cnt ="+cnt+", 매개변수 vo ="+wno);
			return cnt;
			
			
		}finally {
			pool.dbClose(ps, con);
			
		}
	}
	
	
	

}
