package com.house.web.brokermypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.house.util.DBUtil;

public class BrokerInfoDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public BrokerInfoDAO() {
		conn = DBUtil.open();
	}
}
