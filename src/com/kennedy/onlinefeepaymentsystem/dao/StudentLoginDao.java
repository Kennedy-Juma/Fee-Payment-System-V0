package com.kennedy.onlinefeepaymentsystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.kennedy.onlinefeepaymentsystem.model.AdminLoginBean;
import com.kennedy.onlinefeepaymentsystem.model.StudentLoginBean;
import com.kennedy.onlinefeepaymentsystem.utils.JDBCUtils;

public class StudentLoginDao {
	public  boolean validateStudent(StudentLoginBean studenloginbean) {
		boolean status = false;
		
		try {
		Connection connection = JDBCUtils.getConnetion();
		PreparedStatement pst = connection.prepareStatement("SELECT * FROM student where regno=? and password=?");
		pst.setString(1, studenloginbean.getUsername());
		pst.setString(2, studenloginbean.getPassword());
		
		ResultSet rs = pst.executeQuery();
		status = rs.next();
		
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return status;
	}
	
	public static int resetPass(StudentLoginBean student) {
		int i=0;
		try {
			Connection connection = JDBCUtils.getConnetion();
			PreparedStatement pst = connection.prepareStatement("UPDATE student SET password=? WHERE regno=?");
			pst.setString(1, student.getPassword());
			pst.setString(2, student.getUsername());
			i=pst.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return i;	
		
	}
}
