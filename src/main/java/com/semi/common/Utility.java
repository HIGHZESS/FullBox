package com.semi.common;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import com.ReviewBoard.ReviewVO;
import com.semi.living.model.LivingDAO;
import com.semi.living.model.LivingVO;
import com.semi3.member.model.RecipeVO;

public class Utility {
	public static String displayNew(Timestamp regdate) {
		String result = "";
		Date today = new Date();
		// getTime() : 1970.01.01 이후 경과된 시간을 밀리초로 나타내는 메소드
		long time = today.getTime() - regdate.getTime();
		time = time / (1000 * 60 * 60);

		if(time < 24) {
			result = "<img src='../image/new.png' style='width:20px;height:20px;'>";
		}

		return result;
	}
	
	public static String displayFile(String fileName) {
		String result="";
		if(fileName!=null && !fileName.isEmpty()) {
			result="<img src='../image/file.gif'>";
		}
		return result;
	}
	
	public static String getFileInfo(RecipeVO vo) {
		String result="";
		double fsize=vo.getfSize()/1024.0;
		if(vo.getfOname()!=null && !vo.getfOname().isEmpty()) {
			result+=displayFile(vo.getfOname())+" ";
			result+=vo.getfOname()+" ("+Math.round(fsize*100)/100.0+"KB)";
		}
		return result;
	}
	
	public static String getFileInfo(String filename, long filesize) {
	      String result="";
	      
	      if(filename!=null && !filename.isEmpty()) {
	         double fsize=filesize/1024.0;
	         
	         result+=displayFile(filename)+" ";
	         result+=filename;
	         result+=" ("+ Math.round(fsize*100)/100.0+"KB)";
	      }
	      
	      return result;
	}
	
	public static String recWrite(int wNo) {
		String result="";
		LivingVO vo=new LivingVO();
		LivingDAO dao = new LivingDAO();
		try {
			vo = dao.selectBywNo(wNo);
			int rec = vo.getRec();
			
			if(rec>=10) {
				result="<img src='../image/reco.png' style='width:20px;height:20px;'>";
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
