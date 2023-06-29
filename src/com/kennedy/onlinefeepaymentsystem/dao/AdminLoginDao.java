package com.kennedy.onlinefeepaymentsystem.dao;

import java.sql.*;

import com.kennedy.onlinefeepaymentsystem.model.AdminLoginBean;
import com.kennedy.onlinefeepaymentsystem.utils.JDBCUtils;

public class AdminLoginDao {

	public  boolean validateAdmin(AdminLoginBean adminloginbean) {
		boolean status = false;
		
		try {
		Connection connection = JDBCUtils.getConnetion();
		PreparedStatement pst = connection.prepareStatement("SELECT * FROM admin where pfno=? and password=?");
		pst.setString(1, adminloginbean.getUsername());
		pst.setString(2, adminloginbean.getPassword());
		
		ResultSet rs = pst.executeQuery();
		status = rs.next();
		
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return status;
	}

	public static int resetPass(AdminLoginBean adminloginbean) {
		int i=0;
		try {
			Connection connection = JDBCUtils.getConnetion();
			PreparedStatement pst = connection.prepareStatement("UPDATE admin SET password=? WHERE pfno=?");
			pst.setString(1, adminloginbean.getPassword());
			pst.setString(2, adminloginbean.getUsername());
			i=pst.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return i;	
		
	}
}

