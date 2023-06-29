package com.kennedy.onlinefeepaymentsystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.kennedy.onlinefeepaymentsystem.model.PaymentBean;
import com.kennedy.onlinefeepaymentsystem.model.Student;
import com.kennedy.onlinefeepaymentsystem.model.feedbackBean;
import com.kennedy.onlinefeepaymentsystem.utils.JDBCUtils;

public class StudentDao {
	public int registerStudent(Student student) {
		String INSERT_STUDENT_SQL = "INSERT INTO student(firstname, lastname, regno, password) "
				+ "VALUES (?,?,?,?)";
		int result = 0;
		
		try {
			
			//Create statements using the connection object
			Connection connection = JDBCUtils.getConnetion();
			PreparedStatement pst = connection.prepareStatement(INSERT_STUDENT_SQL);
			pst.setString(1, student.getFirstName());
			pst.setString(2, student.getLastName());
			pst.setString(3, student.getRegNo());
			pst.setString(4, student.getPassword());
			
			//Execute the query or execute query update
			result=pst.executeUpdate();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return result;
	}
	
	public int updateStudentPassword(Student student) {
		String UPDATE_PASSWORD_SQL = "update student set password= ? where regno=? and password= ?”);";
		int result = 0;
		
		try {
			
			//Create statements using the connection object
			Connection connection = JDBCUtils.getConnetion();
			PreparedStatement pst = connection.prepareStatement(UPDATE_PASSWORD_SQL);
		
			pst.setString(1, student.getRegNo());
			pst.setString(2, student.getPassword());
			
			//Execute the query or execute query update
			result=pst.executeUpdate();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return result;
	}
}
