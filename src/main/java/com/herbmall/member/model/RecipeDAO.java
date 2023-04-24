package com.herbmall.member.model;

import com.herbmall.db.ConnectionPoolMgr;

public class RecipeDAO {
	private ConnectionPoolMgr pool;
	
	public RecipeDAO() {
		pool = new ConnectionPoolMgr();
	}
}
