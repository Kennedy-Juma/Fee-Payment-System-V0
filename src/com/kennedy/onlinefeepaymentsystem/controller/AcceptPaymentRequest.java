package com.kennedy.onlinefeepaymentsystem.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.RoundingMode;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kennedy.onlinefeepaymentsystem.CurrencyConverterUtils.ExchangeCache;
import com.kennedy.onlinefeepaymentsystem.CurrencyConverterUtils.ExchangeRate;
import com.kennedy.onlinefeepaymentsystem.dao.StudentDao;
import com.kennedy.onlinefeepaymentsystem.dao.paymentDao;
import com.kennedy.onlinefeepaymentsystem.model.PaymentBean;
import com.kennedy.onlinefeepaymentsystem.model.Student;
import com.stripe.Stripe;
import com.stripe.model.Charge;

/**
 * Servlet implementation class AcceptPaymentRequest
 */
@WebServlet("/AcceptPaymentRequest")
public class AcceptPaymentRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AcceptPaymentRequest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
		HttpSession session = request.getSession();
 
		PrintWriter out=response.getWriter();
        try {
        	
        	// change apikey to your own value
    		ExchangeCache.setParameter("openexchangerates.org.apikey", "5699a9d895d0430fad5f24b75a7b5852");

    		// define base currency
    		ExchangeCache cache = new ExchangeCache("USD");

    		// get the specified currency to USD exchange rate
    		String CurrencyToConvert=request.getParameter("currency");
    		ExchangeRate rate = cache.getRate(CurrencyToConvert);

    		// convert
    		double AmountToConvert=Double.parseDouble(request.getParameter("amount")); 
    		BigDecimal amountConverted = new BigDecimal(AmountToConvert);
    		BigDecimal converted =rate.convert(amountConverted);
    		converted = converted.setScale(0, RoundingMode.HALF_UP);
    		
    		int x = 100;
    	    converted = converted.multiply(new BigDecimal(x));
    		
            Stripe.apiKey = getServletContext().getInitParameter("stripeSecretKey");
            Map<String, String[]> httpParameters = request.getParameterMap();
 
            //esctract request parameters
            Map<String, Object> userBillingData = new HashMap<>();
            String userEmail = httpParameters.get("stripeEmail")[0];
            userBillingData.put("email", userEmail);
            userBillingData.put("stripeToken", httpParameters.get("stripeToken")[0]);
 
            Map<String, Object> params = new HashMap<>();
            params.put("amount", converted); // or get from request
            params.put("currency", "usd");  // or get from request
            params.put("source", userBillingData.get("stripeToken"));// or get from request
            params.put("receipt_email", userEmail);
 
            Charge charge;
 
            charge = Charge.create(params);
 
            String chargeID = charge.getId();
            
            
            
            String name = request.getParameter("name");
    		String regno = request.getParameter("regno");
    		String email = request.getParameter("email");
    		int phone= Integer.parseInt(request.getParameter("phone"));
    		Timestamp date = new Timestamp(new Date().getTime());
    		String refno = chargeID;   
    		double amount = Double.parseDouble(request.getParameter("amount"));   
            String country = request.getParameter("country");
    		String currency = request.getParameter("currency");
    		String purpose = request.getParameter("paymentfor");
    		
    		PaymentBean payment = new PaymentBean(name, regno, email, phone,date,refno,amount,country,currency,purpose);

    		paymentDao paymentdao = new paymentDao();

    		try {
    			int result = paymentdao.makePayment(payment);
    			if (result == 1) {
    				session.setAttribute("amount", amount);
    				session.setAttribute("currency", currency);
    				response.sendRedirect("PaymentSuccess.jsp");
    				System.out.println("payment added successfully");
    			} else {
    				System.out.println("error");
    			}

    		} catch (Exception ex) {
    			 out.println("Exception:"+ex);
    			ex.printStackTrace();
    	
    		}
            
           
            
            
 
           
 
        } catch (Exception ex) {
           out.println("Exception:"+ex);
        }
	}}
