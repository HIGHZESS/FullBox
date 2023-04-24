package com.semi.living.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;

public class LivingDAO {
	private ConnectionPoolMgr pool;
	
	public LivingDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	public List<LivingVO> selectAll(String search) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<LivingVO> list = new ArrayList<LivingVO>();
		
		try {
			con=pool.getConnection();
			String sql="select * from living";
			if(search!=null && !search.isEmpty()) {
				sql+=" where title like '%' || ? || '%'";
			}
			sql+=" order by wNo desc";
			ps=con.prepareStatement(sql);
			
			if(search!=null && !search.isEmpty()) {
				ps.setString(1, search);
			}
			rs=ps.executeQuery();
			while(rs.next()) {
				int wno= rs.getInt("wno");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int lview = rs.getInt("lview");
				int rec = rs.getInt("rec");
				Timestamp regdate = rs.getTimestamp("regdate");
				String fName = rs.getString("fName");
				long fSize = rs.getLong("fSize");
				String fOname = rs.getString("fOname");
				int mno = rs.getInt("mno");


				LivingVO vo = new LivingVO(wno, title, content, lview, rec, regdate, fName, fSize, fOname, mno);
				
				list.add(vo);
			}
			System.out.println("전체 조회 list size="+list.size());
			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int insertLiving(LivingVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con=pool.getConnection();
			
			String sql="insert into living(wNo, title, content, fname, fsize, foname, mNo)"
					+ " values(living_seq.nextval, ?, ?, ?, ?, ?, ?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getContent());
			ps.setString(3, vo.getfName());
			ps.setLong(4, vo.getfSize());
			ps.setString(5, vo.getfOname());
			ps.setInt(6, vo.getmNo());
			
			int cnt = ps.executeUpdate();
			
			System.out.println("글쓰기 실행 결과 cnt="+cnt+", 매개변수 vo="+vo);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public LivingVO selectBywNo(int wNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		LivingVO vo = new LivingVO();
		try {
			con=pool.getConnection();
			
			String sql="select * from living"
					+ " where wNo=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, wNo);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				vo.setwNo(rs.getInt("wNo"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setlView(rs.getInt("lview"));
				vo.setRec(rs.getInt("rec"));
				vo.setRegdate(rs.getTimestamp("regdate"));
				vo.setfName(rs.getString("fname"));
				vo.setfSize(rs.getLong("fsize"));
				vo.setfOname(rs.getString("foname"));
				vo.setmNo(rs.getInt("mno"));
			}
			
			System.out.println("선택 조회 wNo="+wNo);
			return vo;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int viewUpdate(int wNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update living"
					+ "	set lview=lview+1"
					+ "	where wNo=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, wNo);
			
			int cnt = ps.executeUpdate();
			System.out.println("조회수 증가 cnt="+cnt+", 매개변수 wNo="+wNo);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int updateLiving(LivingVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update living"
					+ " set title=? , content=?, fname=?, fsize=?, foname=?, mNo=?"
					+ " where wNo=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getContent());
			ps.setString(3, vo.getfName());
			ps.setLong(4, vo.getfSize());
			ps.setString(5, vo.getfOname());
			ps.setInt(6, vo.getmNo());
			ps.setInt(7, vo.getwNo());
			
			int cnt = ps.executeUpdate();
			
			System.out.println("변경 결과 cnt="+cnt+", 매개변수 vo="+vo);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int deleteLiving(int wNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps = null;
		
		try {
			con=pool.getConnection();
			
			String sql = "delete living"
					+ " where wNo=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, wNo);
			
			int cnt = ps.executeUpdate();
			
			System.out.println("글 삭제 결과 cnt="+cnt+", 매개변수 wNo="+wNo);
			
			return cnt;
		}finally {
			
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
                    + "from bmember b join living l\r\n"
                    + "on b.mno = l.mno\r\n"
                    + "where l.wno = ?";
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
	public int recUpdate(int wNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update living"
					+ "	set rec=rec+1"
					+ "	where wNo=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, wNo);
			
			int cnt = ps.executeUpdate();
			System.out.println("추천수 증가 cnt="+cnt+", 매개변수 wNo="+wNo);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
}
