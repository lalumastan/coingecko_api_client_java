package icsdiscover.coingecko.service.model;

import java.util.Date;

record Roi(Double times, String currency, Double percentage) {
}

public record CoinGeckoTable(String id, String symbol, String name, String image, Double current_price,
		Object market_cap, Integer market_cap_rank, Object fully_diluted_valuation, Object total_volume,
		Double high_24h, Double low_24h, Double price_change_24h, Double price_change_percentage_24h,
		Object market_cap_change_24h, Double market_cap_change_percentage_24h, Double circulating_supply,
		Double total_supply, Double max_supply, Double ath, Double ath_change_percentage, Date ath_date, Double atl,
		Double atl_change_percentage, Date atl_date, Roi roi, Date last_updated) {
}
