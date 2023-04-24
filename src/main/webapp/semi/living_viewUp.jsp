<%@page import="java.sql.SQLException"%>
<%@page import="com.semi.living.model.LivingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String wNo = request.getParameter("wNo");
	
	LivingDAO dao = new LivingDAO();
	
	try{
		dao.viewUpdate(Integer.parseInt(wNo));
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	response.sendRedirect("living_detail.jsp?wNo="+wNo);
%>
