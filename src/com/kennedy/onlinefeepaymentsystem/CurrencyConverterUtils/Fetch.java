package com.kennedy.onlinefeepaymentsystem.CurrencyConverterUtils;


import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;


public class Fetch {

	protected static CloseableHttpClient client() {
		return HttpClients.createDefault();
	}
}
