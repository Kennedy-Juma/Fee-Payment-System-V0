package com.kennedy.onlinefeepaymentsystem.utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCUtils {
	/*private static String jdbcURL = "jdbc:mysql://localhost:3306/onlinefeepayment";
	private static String jdbcUsername = "root";
	private static String jdbcPassword = "root";
	*/
	
	private static String jdbcURL = "jdbc:postgresql://ec2-34-203-91-150.compute-1.amazonaws.com:5432/dd3a028jsl9ckn";
	private static String jdbcUsername = "baewilftzcmwhe";
	private static String jdbcPassword = "8ef3b691d5498a924878bfbc7a9def06cad69b43040db82d8f9e6edbc3779291";
	
	public static Connection getConnetion() {
		Connection connection=null;
		try {
			//Class.forName("com.mysql.jdbc.Driver");
			
			Class.forName("org.postgresql.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return connection;
	}
}
