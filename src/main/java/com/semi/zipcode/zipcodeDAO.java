package com.semi.zipcode;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.herbmall.db.ConnectionPoolMgr;

public class zipcodeDAO {
	
	private ConnectionPoolMgr pool;
	
	public zipcodeDAO() {
		pool = new ConnectionPoolMgr();
		
	}
	
	public List<zipcodeVO> selectAll(String sDong)throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<zipcodeVO> list = new ArrayList<zipcodeVO>();
		
		try {
			con=pool.getConnection();

			String sql="select * from zipcode where dong like '%' ||?||'%'";
			ps=con.prepareStatement(sql);
			ps.setString(1, sDong);

			rs=ps.executeQuery();
			while(rs.next()) {
				String zipcode=rs.getString(1);
				String sido=rs.getString(2);
				String gugun=rs.getString(3);
				String dong=rs.getString(4);
				String startBunji=rs.getString(5);
				String endBunji=rs.getString(6);
				int seq=rs.getInt(7);

				zipcodeVO vo 
					= new zipcodeVO(zipcode, sido, gugun, dong, 
							startBunji, endBunji, seq);
				list.add(vo);
			}
			
			System.out.println("선택된 우편번호 list.size="+list.size()
				+", 매개변수 dong ="+sDong);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}	
}
