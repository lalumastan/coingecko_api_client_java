/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package icsdiscover.coingecko;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import icsdiscover.coingecko.service.CoingeckoService;

/**
 * <code>Set welcome message.</code>
 */
public class CoinGeckoAction extends ActionSupport {
	@SuppressWarnings("compatibility:8655046138357228857")
	private static final long serialVersionUID = 1L;

	public static final String MESSAGE = "coingecko.message";

	/**
	 * Field for Message property.
	 */
	private String message;

	public String execute() throws Exception {
		setMessage(getText(MESSAGE));
		return SUCCESS;
	}

	/**
	 * Return Message property.
	 *
	 * @return Message property
	 */
	public String getMessage() {
		return message;
	}

	/**
	 * Set Message property.
	 *
	 * @param message Text to display on HelloWorld page.
	 */
	public void setMessage(String message) {
		this.message = message;
	}

	public List<List<String>> getCoinGeckoTableList() {
		return CoingeckoService.getCoinGeckoTableList();
	}
}
