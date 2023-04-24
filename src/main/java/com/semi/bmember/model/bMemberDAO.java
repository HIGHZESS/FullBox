package com.semi.bmember.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.ReviewBoard.ReviewVO;
import com.herbmall.db.ConnectionPoolMgr;

public class bMemberDAO {

	private ConnectionPoolMgr pool;

	public bMemberDAO() {
		pool = new ConnectionPoolMgr();
	}

	public int insertbMember(bMemberVO vo)throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = pool.getConnection();

			String sql = "insert into bmember(mno,id,pwd,name,nickname,zipcode,address,addressDetail,email,sub)"
					+ " values(bmember_seq.nextval,?,?,?,?,?,?,?,?,?)";

			ps = con.prepareStatement(sql);

			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getName());
			ps.setString(4, vo.getNickname());
			ps.setString(5, vo.getZipcode());
			ps.setString(6, vo.getAddress());
			ps.setString(7, vo.getAddressDetail());
			ps.setString(8, vo.getEmail());
			ps.setString(9, vo.getSub());

			int cnt = ps.executeUpdate();
			System.out.println("회원가입결과 cnt :"+cnt+", 매개변수 vo="+vo );

			return cnt;

		}finally {
			pool.dbClose(ps, con);
		}
	}

	public int duplicateId(String id)throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		int result = 0;
		try {
			con = pool.getConnection();

			String sql = "select count(*) from bmember where id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);

			rs = ps.executeQuery();
			if(rs.next()) {
				int count = rs.getInt(1);
				if(count>0) {
					result=bMemberService.UNUSABLE_ID; // 아이디 이미 조재 
				}else {
					result = bMemberService.USABLE_ID;
				}

			}
			System.out.println("아이디 중복확인 결과 result="+result
					+", 매개변수 id="+id);
			return result;

		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	public int duplicateNickname(String nickname)throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		int result = 0;
		try {
			con = pool.getConnection();

			String sql = "select count(*) from bmember where nickname=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, nickname);

			rs = ps.executeQuery();
			if(rs.next()) {
				int count = rs.getInt(1);
				if(count>0) {
					result=bMemberService.UNUSABLE_NICKNAME; // 아이디 이미 조재 
				}else {
					result = bMemberService.USABLE_NICKNAME;
				}

			}
			System.out.println("아이디 중복확인 결과 result="+result
					+", 매개변수 id="+nickname);
			return result;

		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	public int checkLogin(String id,String pwd) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		int result =0;

		try {
			con = pool.getConnection();
			String sql = "select pwd from bmember"
					+ " where id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);

			rs = ps.executeQuery();
			if(rs.next()) {
				String dbPwd = rs.getString(1);

				if(dbPwd.equals(pwd)) {
					result = bMemberService.LOGIN_OK;
				}else {
					result = bMemberService.DISAGREE_PWD;
				}

			}else {
				result = bMemberService.NONE_USERID;
			}
			System.out.println("로그인 체크결과 result="+ result+", 매개변수 userid="+id+", pwd="+pwd);
			return result;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	public bMemberVO selectByUserid(String id) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		bMemberVO vo = new bMemberVO();
		try {
			con = pool.getConnection();

			String sql ="select * from bmember where id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);

			rs = ps.executeQuery();
			if(rs.next()) {
				vo.setMno(rs.getInt("MNO"));
				vo.setId(id);
				vo.setPwd(rs.getString("PWD"));
				vo.setName(rs.getString("NAME"));
				vo.setAddress(rs.getString("ADDRESS"));
				vo.setEmail(rs.getString("EMAIL"));
				vo.setNickname(rs.getString("NICKNAME"));
				vo.setRegdate(rs.getTimestamp("REGDATE"));
				vo.setSub(rs.getString("SUB"));
				vo.setZipcode(rs.getString("ZIPCODE"));
				vo.setAddressDetail(rs.getString("ADDRESSDETAIL"));
			}
			System.out.println("아이디로 조회 결과 vo ="+ vo + ", 매개변수 id ="+id);

			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	public ReviewVO selectByWno(int wno)throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		ReviewVO vo = new ReviewVO();
		try {
			con = pool.getConnection();

			String sql ="select * from bmember where mno =?";
			ps = con.prepareStatement(sql);

			/*	private int wNo;
			private String title;
			private String content;
			private int rview;
			private String type;
			private int rec;
			private int mno;
			private Timestamp regdate;*/

			ps.setInt(1, wno);
			rs = ps.executeQuery();
			if(rs.next()) {
				vo.setwNo(wno);
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setContent(rs.getString("content"));
				vo.setRview(rs.getInt("rview"));
				vo.setType(rs.getString(("type")));
				vo.setRec(rs.getInt("rec"));
				vo.setMno(rs.getInt("mno"));
				vo.setRegdate(rs.getTimestamp("regdate"));
			}
			System.out.println("글 상세보기결과 vo ="+vo+", 매개변수 글번호 wno="+wno);
			return vo;

		}finally{
			pool.dbClose(rs, ps, con);
		}

	}
	public int findMnoById(String id)throws SQLException{

		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		int mno =0;
		try {

			con = pool.getConnection();
			String sql ="select mno from bmember where id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();

			if(rs.next()) {

				mno = rs.getInt("mno");

			}
			return mno;


		}finally {
			pool.dbClose(rs, ps, con);
		}


	}


}
