package com.kennedy.onlinefeepaymentsystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.kennedy.onlinefeepaymentsystem.model.PaymentBean;
import com.kennedy.onlinefeepaymentsystem.utils.JDBCUtils;

public class paymentDao {
	
	public int makePayment(PaymentBean payment) {
String INSERT_PAYMENT_DETAILS_SQL ="INSERT INTO payment(payerName, RegNo, "
		+ "email, phone, DatePaid, referenceNo,"
		+ " Amount, country, currency, Purpose) VALUES (?,?,?,?,?,?,?,?,?,?)";

		int result = 0;
		
		try {
			
			//Create statements using the connection object
			Connection connection = JDBCUtils.getConnetion();
			PreparedStatement pst = connection.prepareStatement(INSERT_PAYMENT_DETAILS_SQL);
			pst.setString(1, payment.getPayerName());
			pst.setString(2, payment.getRegNo());
			pst.setString(3, payment.getPayerEmail());
			pst.setInt(4, payment.getPayerPhone());
			pst.setTimestamp(5, payment.getDate());
			pst.setString(6, payment.getRefNo());
			pst.setDouble(7, payment.getAmount());
			pst.setString(8, payment.getCountry());
			pst.setString(9, payment.getCurrency());
			pst.setString(10, payment.getPurpose());
			//Execute the query or execute query update
			result=pst.executeUpdate();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return result;
	}


}
