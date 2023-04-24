package com.semi.AskBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.semi.db.ConnectionPoolMgr;
import com.semi.living.model.LivingVO;

public class AskBoardDAO {
	private ConnectionPoolMgr pool;
	
	public AskBoardDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	public int insertAsk(AskBoardVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con=pool.getConnection();
			
			String sql="insert into ask(aNo, title, content, mNo)"
					+ " values(ASK_SEQ.nextval, ?, ?, ?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getContent());
			ps.setInt(3, vo.getMno());
			
			
			int cnt = ps.executeUpdate();
			
			System.out.println("글쓰기 실행 결과 cnt="+cnt+", 매개변수 vo="+vo);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	public List<AskBoardVO> selectAll(String search) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<AskBoardVO> list = new ArrayList<AskBoardVO>();
		
		try {
			con=pool.getConnection();
			String sql="select * from ask";
			if(search!=null && !search.isEmpty()) {
				sql+=" where title like '%' || ? || '%'";
			}
			sql+=" order by aNo desc";
			ps=con.prepareStatement(sql);
			
			if(search!=null && !search.isEmpty()) {
				ps.setString(1, search);
			}
			rs=ps.executeQuery();
			while(rs.next()) {
				int aNo= rs.getInt("aNo");
				String reply = rs.getString("reply");
				String aPublic = rs.getString("aPublic");
				Timestamp regdate = rs.getTimestamp("regdate");
				int mno = rs.getInt("mno");
				String title = rs.getString("title");
				String content = rs.getString("content");

				AskBoardVO vo = new AskBoardVO(aNo, reply, aPublic, regdate, mno, title, content);
				
				list.add(vo);
			}
			System.out.println("전체 조회 list size="+list.size());
			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	public AskBoardVO selectByaNo(int aNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		AskBoardVO vo = new AskBoardVO();
		try {
			con=pool.getConnection();
			
			String sql="select * from ask"
					+ " where aNo=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, aNo);
			
			rs=ps.executeQuery();
			if(rs.next()) {
	
				vo.setaNo(aNo);
				vo.setReply(rs.getString("REPLY"));
				vo.setaPublic(rs.getString("APUBLIC"));
				vo.setRegdate(rs.getTimestamp("regdate"));
				vo.setMno(rs.getInt("mno"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
			}
			
			System.out.println("선택 조회 aNo="+aNo);
			return vo;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	public int updateAsk(AskBoardVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update ask"
					+ " set title=? , content=?"
					+ " where aNo=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getContent());
			ps.setInt(3, vo.getaNo());
			
			int cnt = ps.executeUpdate();
			
			System.out.println("변경 결과 cnt="+cnt+", 매개변수 vo="+vo);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	public int deleteAsk(int aNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps = null;
		
		try {
			con=pool.getConnection();
			
			String sql = "delete ask"
					+ " where aNo=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, aNo);
			
			int cnt = ps.executeUpdate();
			
			System.out.println("글 삭제 결과 cnt="+cnt+", 매개변수 wNo="+aNo);
			
			return cnt;
		}finally {
			
		}
	}
	
	public String findNickname(int ano)throws SQLException{
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String nickname = "";
        try {
            con = pool.getConnection();

            String sql = "select b.nickname \r\n"
                    + "from bmember b join ask a\r\n"
                    + "on b.mno = a.mno\r\n"
                    + "where a.ano = ?";
            ps =con.prepareStatement(sql);
            ps.setInt(1, ano);

            rs = ps.executeQuery();
            if(rs.next()) {

                nickname = rs.getString("nickname");
            }
            System.out.println("결과 nickname "+nickname+", 매개변수 리뷰글번호:"+ano);
            return nickname;

        }finally{
            pool.dbClose(rs, ps, con);
        }
    }
	
	public int updateIsReply(int ano)throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			
			con = pool.getConnection();
			
			String sql = "update ask\r\n"
					+ "set reply ='Y'\r\n"
					+ "where ano =?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, ano);
			
			int cnt = ps.executeUpdate();
			System.out.println("reply N=>Y 변경결과 cnt ="+cnt+", 매개변수 ano"+ano);
			
			return cnt;
			
		}finally {
			pool.dbClose(ps, con);
			
		}
		
		
	}

}
