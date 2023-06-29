package com.kennedy.onlinefeepaymentsystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.kennedy.onlinefeepaymentsystem.model.feedbackBean;
import com.kennedy.onlinefeepaymentsystem.utils.JDBCUtils;

public class feedDao {
	
	public int Feedback(feedbackBean feedback) {
		String INSERT_FEEDBACK_SQL = "INSERT INTO feedback(name, email, comment) "
				+ "VALUES (?,?,?)";
				
		int result = 0;
		
		try {
			
			//Create statements using the connection object
			Connection connection = JDBCUtils.getConnetion();
			PreparedStatement pst = connection.prepareStatement(INSERT_FEEDBACK_SQL);
			pst.setString(1,feedback.getName());
			pst.setString(2,feedback.getEmail());
			pst.setString(3,feedback.getComment());
			
			//Execute the query or execute query update
			result=pst.executeUpdate();
			
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println(ex);
		}
		return result;
	}

}
