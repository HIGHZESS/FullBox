package com.semi3.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.semi.bmember.model.bMemberVO;
import com.semi3.db.ConnectionPoolMgr;


public class RecipeDAO {
	private ConnectionPoolMgr pool;

	public RecipeDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	public int insertRecipe(RecipeVO vo, int mNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int cnt=0;
		
		try {
			con=pool.getConnection();
			String sql="insert into recipe values (recipe_seq.nextval, ?,?,?,0,0,0,sysdate,?,?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getContent());
			ps.setString(3, vo.getrLevel());
			ps.setString(4,vo.getfName());
			ps.setLong(5, vo.getfSize());
			ps.setString(6, vo.getfOname());
			ps.setInt(7, mNo);
			System.out.println(vo.getTitle());
			System.out.println(vo.getContent());
			System.out.println(vo.getrLevel());
			System.out.println(vo.getfName());
			System.out.println(vo.getfSize());
			System.out.println(vo.getfOname());
			
			cnt=ps.executeUpdate();
			System.out.println("어디가 문제일까5");
			if(cnt>0) {
				System.out.println("recipe 게시글 등록 cnt = "+cnt+", 매개변수 vo = "+vo);
			}
			System.out.println("어디가 문제일까6");
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public String selectNicknameByNo(int mNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			//1,2
			con=pool.getConnection();
			//3
			String sql="select nickname from bmember where mno=?";
			
			ps=con.prepareStatement(sql);
			ps.setInt(1, mNo);
			//4
			rs=ps.executeQuery();
			String nickname="";
			if(rs.next()) {
				nickname=rs.getString("nickname");
			}
			
			System.out.println("닉네임 조회 결과 닉네임 : "+nickname);
			return nickname;
		}finally {
			pool.dbClose(rs, ps, con);
		}
		
	}
	
	public List<RecipeVO> selectAll(String condition, String keyword) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<RecipeVO> list = new ArrayList<RecipeVO>();
		
		try {
			//1,2
			con=pool.getConnection();
			//3
			String sql="select * from recipe ";
			if(keyword!=null && !keyword.isEmpty()) {
				sql+=" where "+condition+" like '%' || ? || '%'";
			}
			sql+=" order by wno desc";
			
			
			ps=con.prepareStatement(sql);
			if(keyword!=null && !keyword.isEmpty()) {
				ps.setString(1, keyword);
			}
			
			
			//4
			rs=ps.executeQuery();
			while(rs.next()) {
				int wNo=rs.getInt("wno");         
				String title=rs.getString("title");  
				String content=rs.getString("content"); 
				String rLevel=rs.getString("rlevel");   
				int rView=rs.getInt("rview");         
				int star=rs.getInt("star");         
				int stCount=rs.getInt("stcount");         
				Timestamp regdate=rs.getTimestamp("regdate");           
				String fName=rs.getString("fname");  
				long fSize=rs.getLong("fsize");           
				String fOname=rs.getString("foname");  
				int mNo=rs.getInt("mno");  
				
				RecipeVO vo=new RecipeVO(wNo, title, content, rLevel, rView, star, stCount, regdate, fName, fSize, fOname, mNo);
				list.add(vo);
			}
			
			System.out.println("전체 조회 결과 list.size : "+list.size()+", 매개변수 condition = "+condition+", keyword = "+keyword);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
		
	}
	
	
	public List<RecipeVO> selectAll() throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<RecipeVO> list = new ArrayList<RecipeVO>();
		
		try {
			//1,2
			con=pool.getConnection();
			//3
			String sql="select * from recipe order by wno desc";
			
			ps=con.prepareStatement(sql);
			//4
			rs=ps.executeQuery();
			while(rs.next()) {
				int wNo=rs.getInt("wno");         
				String title=rs.getString("title");  
				String content=rs.getString("content"); 
				String rLevel=rs.getString("rlevel");   
				int rView=rs.getInt("rview");         
				int star=rs.getInt("star");         
				int stCount=rs.getInt("stcount");         
				Timestamp regdate=rs.getTimestamp("regdate");           
				String fName=rs.getString("fname");  
				long fSize=rs.getLong("fsize");           
				String fOname=rs.getString("foname");  
				int mNo=rs.getInt("mno");  
				
				RecipeVO vo=new RecipeVO(wNo, title, content, rLevel, rView, star, stCount, regdate, fName, fSize, fOname, mNo);
				list.add(vo);
			}
			
			System.out.println("전체 조회 결과 list.size : "+list.size());
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
		
	}
	
	public List<RecipeVO> selectRank() throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<RecipeVO> list = new ArrayList<RecipeVO>();
		
		try {
			//1,2
			con=pool.getConnection();
			//3
			String sql="select a.*, rownum from (select * from recipe order by star desc) a where rownum<=3";
			
			ps=con.prepareStatement(sql);
			//4
			rs=ps.executeQuery();
			while(rs.next()) {
				int wNo=rs.getInt("wno");         
				String title=rs.getString("title");  
				String content=rs.getString("content"); 
				String rLevel=rs.getString("rlevel");   
				int rView=rs.getInt("rview");         
				int star=rs.getInt("star");         
				int stCount=rs.getInt("stcount");         
				Timestamp regdate=rs.getTimestamp("regdate");           
				String fName=rs.getString("fname");  
				long fSize=rs.getLong("fsize");           
				String fOname=rs.getString("foname");  
				int mNo=rs.getInt("mno");  
				
				RecipeVO vo=new RecipeVO(wNo, title, content, rLevel, rView, star, stCount, regdate, fName, fSize, fOname, mNo);
				list.add(vo);
			}
			
			System.out.println("전체 조회 결과 list.size : "+list.size());
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
		
	}
	
	public int updateCount(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update recipe set rview=rview+1 where wno=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			int cnt=ps.executeUpdate();
			System.out.println("업데이트결과 count cnt = "+cnt+",매개변수 no = "+no);
			
			return cnt;
			
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public RecipeVO selectByNo(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		RecipeVO vo=new RecipeVO();
		try {
			//1,2
			con=pool.getConnection();
			//3
			String sql="select * from recipe where wno=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			//4
			rs=ps.executeQuery();
			if(rs.next()) {
				vo.setwNo(no);
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setrLevel(rs.getString("rLevel"));
				vo.setrView(rs.getInt("rView"));
				vo.setStar(rs.getInt("star"));
				vo.setStCount(rs.getInt("stCount"));
				vo.setRegdate(rs.getTimestamp("regdate"));
				vo.setfName(rs.getString("fName"));
				vo.setfSize(rs.getLong("fSize"));
				vo.setfOname(rs.getString("fOname"));
				vo.setmNo(rs.getInt("mNo"));
			}
			
			System.out.println("글 상세보기 결과 vo="+vo+", 매개변수 no="+no);
			
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	/*
	public UserInfoVO userByNo(int no) throws SQLException { //회원번호로 유저 닉네임 알아오는 메소드
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		UserInfoVO vo=new UserInfoVO();
		try {
			//1,2
			con=pool.getConnection();
			//3
			String sql="select a.wno,b.mno, b.id, b.nickname from recipe a join bmember b on a.mno=b.mno where wno=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			//4
			rs=ps.executeQuery();
			if(rs.next()) {
				vo.setWno(rs.getInt("wno"));
				vo.setMno(rs.getInt("mno"));
				vo.setId(rs.getString("id"));
				vo.setNickName(rs.getString("nickname"));
			}
			
			System.out.println("유저아이디 조회 결과 vo="+vo+", 매개변수 no="+no);
			
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	*/
	
	public bMemberVO userByNo(int no) throws SQLException { //회원번호로 유저 닉네임 알아오는 메소드
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		bMemberVO vo=new bMemberVO();
		try {
			//1,2
			con=pool.getConnection();
			//3
			String sql="select b.mno, b.id, b.nickname from recipe a join bmember b on a.mno=b.mno where wno=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			//4
			rs=ps.executeQuery();
			if(rs.next()) {
				vo.setMno(rs.getInt("mno"));
				vo.setId(rs.getString("id"));
				vo.setNickname(rs.getString("nickname"));
			}
			
			System.out.println("유저아이디 조회 결과 vo="+vo+", 매개변수 no="+no);
			
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	   public boolean checkUserid(String id, RecipeVO rVo) throws SQLException {
		   Connection con = null;
		   PreparedStatement ps = null;
		   ResultSet rs=null;
		   boolean bool=false;
		   try {
			   //1,2
			   
			  con=pool.getConnection();
			  
			  String sql="select b.id from recipe a join bmember b on a.mno=b.mno where wno=?";
			  ps=con.prepareStatement(sql);
			  ps.setInt(1, rVo.getwNo());
			  
			  rs=ps.executeQuery();
			  if(rs.next()) {
				  String loginId=rs.getString(1);
				  if(id.equals(loginId)) {
					  bool=true; //아이디 일치
				  }
			  }
			  
			  System.out.println("아이디 결과 bool="+bool+", 매개변수 id="+id+",rVo="+rVo+",rVo.getwNo="+rVo.getwNo());
			  
			  return bool;
		   }finally {
			   pool.dbClose(rs, ps, con);
		   }
	   }
	   
	   public int deleteByNo(int wNo) throws SQLException {
		   Connection con=null;
		   PreparedStatement ps=null;
		   int cnt=0;
		   try {
			   con=pool.getConnection();

			   String sql="delete from recipe where wno=?";

			   ps=con.prepareStatement(sql);
			   ps.setInt(1, wNo);
			   
			   cnt=ps.executeUpdate();

			   System.out.println("원본제거 cnt="+cnt+", 원본제거 매개변수 wNo="+wNo);
			   
			   return cnt;
		   }finally {
			   pool.dbClose(ps, con);
		   }
	   }
	   
	   public int updateStcount(int wNo, int rLevel) throws SQLException {
		   Connection con=null;
		   PreparedStatement ps=null;
			
			try {
				con=pool.getConnection();
				
				String sql="update recipe set star=star+?, stcount=stcount+1 where wno=?";
				ps=con.prepareStatement(sql);
				ps.setInt(1, rLevel);
				ps.setInt(2, wNo);
				
				int cnt=ps.executeUpdate();
				System.out.println("업데이트결과 count cnt = "+cnt+",매개변수 wNo = "+wNo+", rLevel = "+rLevel);
				
				return cnt;
				
			}finally {
				pool.dbClose(ps, con);
			}
	   }
	

	
}
