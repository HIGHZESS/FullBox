package com.semi.product.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.herbmall.db.ConnectionPoolMgr;

public class ProductDAO {
	private ConnectionPoolMgr pool;

	public ProductDAO() {
		pool=new ConnectionPoolMgr();
	}

	public int insertProduct(ProductVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			con=pool.getConnection();

			String sql="insert into product values(product_seq.nextval, ?, ?,sysdate,?,2,?,?,?,1)";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getpName());
			ps.setString(2, vo.getpIntro());
			ps.setInt(3, vo.getPrice());
			/* ps.setInt(4, vo.getvNo()); */
			ps.setString(4,vo.getfName());
			ps.setLong(5, vo.getfSize());
			ps.setString(6, vo.getfoName());

			int cnt=ps.executeUpdate();
			
			if(cnt>0) {
				System.out.println("상품등록 결과 cnt="+cnt+", 매개변수 vo="+vo);
			}

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}

	public List<ProductVO> selectAll(String condition, String keyword)throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		List<ProductVO> list=new ArrayList<ProductVO>();
		try {
			con=pool.getConnection();

			String sql="select * from product";
			if(keyword!=null && !keyword.isEmpty()) {
				sql+=" where "+condition+" like '%' || ? || '%'";
			}
			sql+=" order by pno desc";
			ps=con.prepareStatement(sql);
				
			if(keyword!=null && !keyword.isEmpty()) {
				ps.setString(1, keyword);
			}
				
			rs=ps.executeQuery();
			while(rs.next()) {
				int pno= rs.getInt("pNo");
				String pname = rs.getString("pName");
				String pintro = rs.getString("pIntro");
				Timestamp regdate = rs.getTimestamp("regdate");
				int price = rs.getInt("price");
				int vno = rs.getInt("vNo");
				String fname = rs.getString("fName");
				long fsize = rs.getLong("fSize");
				String foname = rs.getString("fOName");
				int sno = rs.getInt("sNo");

				ProductVO vo = new ProductVO(pno, pname, pintro, regdate, price, vno, fname, fsize, foname, sno);
				
				list.add(vo);
				
			}

			System.out.println("전체 조회 결과 list.size="+list.size()
			+", 매개변수 condition="+condition+", keyword="+ keyword);
			
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public List<ProductVO> selectAllByVege(String condition, String keyword)throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<ProductVO> list=new ArrayList<ProductVO>();
		try {
			con=pool.getConnection();
			
			String sql="select * from product where";
			if(keyword!=null && !keyword.isEmpty()) {
				sql+=condition+" and like '%' || ? || '%'";
			}
			sql+=" vno=2 order by pno desc";
			ps=con.prepareStatement(sql);
			
			if(keyword!=null && !keyword.isEmpty()) {
				ps.setString(1, keyword);
			}
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int pno= rs.getInt("pNo");
				String pname = rs.getString("pName");
				String pintro = rs.getString("pIntro");
				Timestamp regdate = rs.getTimestamp("regdate");
				int price = rs.getInt("price");
				int vno = rs.getInt("vNo");
				String fname = rs.getString("fName");
				long fsize = rs.getLong("fSize");
				String foname = rs.getString("fOName");
				int sno = rs.getInt("sNo");
				
				ProductVO vo = new ProductVO(pno, pname, pintro, regdate, price, vno, fname, fsize, foname, sno);
				
				list.add(vo);
				
			}
			
			System.out.println("전체 조회 결과 list.size="+list.size()
			+", 매개변수 condition="+condition+", keyword="+ keyword);
			
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public List<ProductVO> selectAllByFruit(String condition, String keyword)throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<ProductVO> list=new ArrayList<ProductVO>();
		try {
			con=pool.getConnection();
			
			String sql="select * from product where";
			if(keyword!=null && !keyword.isEmpty()) {
				sql+=condition+" and like '%' || ? || '%'";
			}
			sql+=" vno=3 order by pno desc";
			ps=con.prepareStatement(sql);
			
			if(keyword!=null && !keyword.isEmpty()) {
				ps.setString(1, keyword);
			}
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int pno= rs.getInt("pNo");
				String pname = rs.getString("pName");
				String pintro = rs.getString("pIntro");
				Timestamp regdate = rs.getTimestamp("regdate");
				int price = rs.getInt("price");
				int vno = rs.getInt("vNo");
				String fname = rs.getString("fName");
				long fsize = rs.getLong("fSize");
				String foname = rs.getString("fOName");
				int sno = rs.getInt("sNo");
				
				ProductVO vo = new ProductVO(pno, pname, pintro, regdate, price, vno, fname, fsize, foname, sno);
				
				list.add(vo);
				
			}
			
			System.out.println("전체 조회 결과 list.size="+list.size()
			+", 매개변수 condition="+condition+", keyword="+ keyword);
			
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public List<ProductVO> selectAll()throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<ProductVO> list=new ArrayList<ProductVO>();
		try {
			con=pool.getConnection();
			
			String sql="select * from product";
			
			ps=con.prepareStatement(sql);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int pno= rs.getInt("pNo");
				String pname = rs.getString("pName");
				String pintro = rs.getString("pIntro");
				Timestamp regdate = rs.getTimestamp("regdate");
				int price = rs.getInt("price");
				int vno = rs.getInt("vNo");
				String fname = rs.getString("fName");
				long fsize = rs.getLong("fSize");
				String foname = rs.getString("fOname");
				int sno = rs.getInt("sNo");
				
				ProductVO vo = new ProductVO(pno, pname, pintro, regdate, price, vno, fname, fsize, foname, sno);
				
				list.add(vo);
				
			}
			
			System.out.println("전체 조회 결과 list.size="+list.size());		
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	public ProductVO selectBypNo(int pno) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		ProductVO vo = new ProductVO();
		try {
			con=pool.getConnection();

			String sql="select * from product where pNo=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, pno);

			rs=ps.executeQuery();
			if(rs.next()) {
				String pname = rs.getString("pName");
				String pintro = rs.getString("pIntro");
				Timestamp regdate = rs.getTimestamp("regdate");
				int price = rs.getInt("price");
				int vno = rs.getInt("vNo");
				String fname = rs.getString("fName");
				long fsize = rs.getLong("fSize");
				String foname = rs.getString("fOname");
				int sno = rs.getInt("sNo");	
				
				vo = new ProductVO(pno, pname, pintro, regdate, price, vno, fname, fsize, foname, sno);
			}

			System.out.println("번호로 조회 결과 vo="+vo+", 매개변수 pno="+pno);

			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	public int updateProduct(ProductVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			con=pool.getConnection();

			String sql="update product"
					+ " set pName=?, pIntro=?, Price=?";
			if(vo.getfName()!=null &&!vo.getfName().isEmpty()) {
				sql+=", fName=?, fSize=?, fOName=?";	
			}
			sql+= "where pNo=?";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getpName());
			ps.setString(2, vo.getpIntro());
			ps.setInt(3, vo.getPrice());
			
			if(vo.getfName()!=null &&!vo.getfName().isEmpty()) {
				ps.setString(4, vo.getfName());
				ps.setLong(5, vo.getfSize());
				ps.setString(6, vo.getfoName());
				ps.setInt(7, vo.getpNo());
			}else {
				ps.setInt(4, vo.getpNo());
			}
			
			int cnt=ps.executeUpdate();
			System.out.println("상품 수정 결과 cnt="+cnt+", 매개변수 vo="+vo);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}

	public int deleteProduct(int pno) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			con=pool.getConnection();

			String sql="delete product where pNo=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, pno);

			int cnt=ps.executeUpdate();
			System.out.println("상품 삭제 결과 cnt="+cnt+", 매개변수 pno="+
					pno);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
}