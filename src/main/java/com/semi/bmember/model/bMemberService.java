package com.semi.bmember.model;

import java.sql.SQLException;

public class bMemberService {
	
	//아이디 중복확인
	public static final int USABLE_ID=1;
	public static final int UNUSABLE_ID=2;
	
	//닉네임 중복확인
	public static final int USABLE_NICKNAME=1;
	public static final int UNUSABLE_NICKNAME=2;
	
	public static final int LOGIN_OK=1;
	public static final int DISAGREE_PWD=2;  //비번 불일치
	public static final int NONE_USERID=3; 
	


	
	public bMemberDAO bmemdao;
	
	public bMemberService() {
		bmemdao = new bMemberDAO();
	}
	public int insertbMember(bMemberVO vo)throws SQLException{
		int cnt = bmemdao.insertbMember(vo);
		return cnt;
	}
	
	public int duplicateId(String id)throws SQLException{
		return bmemdao.duplicateId(id);
	}
	
	public int checkLogin(String id,String pwd) throws SQLException {
		return bmemdao.checkLogin(id, pwd);
	}
	public bMemberVO selectByUserid(String id) throws SQLException{
		return bmemdao.selectByUserid(id);
	}
	
	public int duplicateNickname(String nickname)throws SQLException{
		return bmemdao.duplicateId(nickname);
	}
	public int findMnoById(String id)throws SQLException{
		return bmemdao.findMnoById(id);
	}

	
}
