package com.semi.product.common;

import java.sql.Timestamp;
import java.util.Date;

public class Utility {
	public static String displayNew(Timestamp regdate) {
		String result = "";
		Date today = new Date();
		// getTime() : 1970.01.01 이후 경과된 시간을 밀리초로 나타내는 메소드
		long time = today.getTime() - regdate.getTime();
		time = time / (1000 * 60 * 60);

		if(time < 24) {
			result = "<img src='../image/new.gif'>";
		}

		return result;
	}

	public static String displayFile(String filename) {
		String result = "";

		if(filename != null && !filename.isEmpty()) {
			result ="<img src='../image/file.gif'>";
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


}
