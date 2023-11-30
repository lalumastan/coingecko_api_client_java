package icsdiscover.coingecko.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;

import icsdiscover.coingecko.service.model.CoinGeckoPingResponse;
import icsdiscover.coingecko.service.model.CoinGeckoTable;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.core.GenericType;
import jakarta.ws.rs.core.MediaType;

public class CoingeckoService {

	public final static String COINGECKO_API_URL = "https://api.coingecko.com/api/v3/";
	public final static String MARKETS = "coins/markets?vs_currency=usd&per_page=250&page=1";
	public final static String PING = "ping";
	public final static ObjectMapper objectMapper = new ObjectMapper();
	public final static String MARKET_JSON_FILE = System.getProperty("java.io.tmpdir") + "markets.json";

	public final static String[] HEADER_LIST = new String[] { "Icon", "Symbol", "Name", "Price ($)", "High ($)",
			"Low ($)", "Day Chg %" };

	@SuppressWarnings("unchecked")
	public static List<List<String>> getCoinGeckoTableList() {
		List<List<String>> coinGeckoTableList = new ArrayList<>();

		try {
			if (isCoinGeckoApiAvailable()) {
				Client client = ClientBuilder.newClient();

				for (CoinGeckoTable coinGeckoTable : client.target(COINGECKO_API_URL + MARKETS)
						.request(MediaType.APPLICATION_JSON).get(new GenericType<List<CoinGeckoTable>>() {
						})) {
					List<String> row = new ArrayList<String>();
					row.add("<img src=" + coinGeckoTable.image() + " align=\"center\" class=\"center\" />");
					row.add(coinGeckoTable.symbol());
					row.add(coinGeckoTable.name());
					row.add(coinGeckoTable.current_price().toString());
					row.add(coinGeckoTable.high_24h().toString());
					row.add(coinGeckoTable.low_24h().toString());
					row.add(coinGeckoTable.price_change_percentage_24h().toString());
					coinGeckoTableList.add(row);
				}

				objectMapper.writeValue(new File(MARKET_JSON_FILE), coinGeckoTableList);
			} else
				throw new Exception("Coingecko ping api failed.");

		} catch (Exception e) {
			System.out.println(e.getMessage());
			try {
				System.out.println("Loading data from " + MARKET_JSON_FILE + ".");
				coinGeckoTableList = objectMapper.readValue(new File(MARKET_JSON_FILE), List.class);
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
			}
		}

		return coinGeckoTableList;
	}

	public static boolean isCoinGeckoApiAvailable() {
		boolean isAvailable = false;

		try {
			Client client = ClientBuilder.newClient();
			CoinGeckoPingResponse coinGeckoPingResponse = (CoinGeckoPingResponse) client
					.target(COINGECKO_API_URL + PING).request(MediaType.APPLICATION_JSON)
					.get(CoinGeckoPingResponse.class);

			String value = coinGeckoPingResponse.gecko_says();

			isAvailable = !(value == null || value.isEmpty());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return isAvailable;
	}
}
