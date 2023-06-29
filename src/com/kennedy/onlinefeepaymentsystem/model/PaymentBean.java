package com.kennedy.onlinefeepaymentsystem.model;

import java.sql.Timestamp;

public class PaymentBean {
	
	String payerName;
	String regNo;
	String payerEmail;
	int payerPhone;
	Timestamp date;
	String refNo;
	double amount;
	String country;
	String currency;
	String purpose;
	
	
	public PaymentBean(String payerName, String regNo, String payerEmail, 
			int payerPhone,Timestamp date, String refNo, double amount,
	        String country,String currency,String purpose) {
		super();
		this.payerName = payerName;
		this.regNo = regNo;
		this.payerEmail = payerEmail;
		this.payerPhone = payerPhone;
		this.date=date;
		this.refNo = refNo;
		this.amount = amount;
		this.country=country;
		this.currency=currency;
		this.purpose = purpose;
	}
	
	public String getPayerName() {
		return payerName;
	}
	public void setPayerName(String payerName) {
		this.payerName = payerName;
	}
	public String getRegNo() {
		return regNo;
	}
	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}
	public String getPayerEmail() {
		return payerEmail;
	}
	public void setPayerEmail(String payerEmail) {
		this.payerEmail = payerEmail;
	}
	public int getPayerPhone() {
		return payerPhone;
	}
	public void setPayerPhone(int payerPhone) {
		this.payerPhone = payerPhone;
	}
	
	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getRefNo() {
		return refNo;
	}
	public void setRefNo(String refNo) {
		this.refNo = refNo;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	
	

}
