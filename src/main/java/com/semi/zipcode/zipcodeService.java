package com.semi.zipcode;

import java.sql.SQLException;
import java.util.List;

public class zipcodeService {
	public zipcodeDAO zipcodeDao;

	public zipcodeService() {
		zipcodeDao=new zipcodeDAO();
	}

	public List<zipcodeVO> selectAll(String sDong) throws SQLException{
		return zipcodeDao.selectAll(sDong);
	}
}
