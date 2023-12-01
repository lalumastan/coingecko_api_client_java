<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjdt" uri="/struts-jquery-datatables-tags"%>

                    <div class="row bg-success border border-success my-0 py-2 rounded-top">
                        <h3 class="text-center text-white">
                           <s:property value="message" escapeHtml="false"/> <span class="fs-6" id="countDown"></span>                            
                        </h3>
                    </div>
                    <div>
                        <div class="row bg-light border border-success rounded-bottom p-2">
 					        <sjdt:datatables cssClass="stripe" ajax="{url: 'getCoingecko.action', dataSrc: 'coinGeckoTableList'}" ajaxReloadTopics="reloadCoinGeckoTableList" title="%{getText('coingecko.message')}" order="[ [1,'asc'] ]" datatablesTheme="jqueryui" id="coingeckotable" style="width:100%">
					        <thead>
                                    <tr>
										<s:iterator value="@icsdiscover.coingecko.service.CoingeckoService@HEADER_LIST" status="headerStatus">
											<s:if test="#headerStatus.first">
											    <th id="<s:property/>" width="1%" scope="col"><s:property/></th>
											</s:if>
											<s:else>
											    <th id="<s:property/>" width="14%" scope="col"><s:property/></th>
											</s:else>										  
										</s:iterator>                                            
                                    </tr>
					        </thead>
                            <tfoot>
                                    <tr>
										<s:iterator value="@icsdiscover.coingecko.service.CoingeckoService@HEADER_LIST">
										  <th id="<s:property/>" scope="col"><s:property/></th>
										</s:iterator>
                                    </tr>
                            </tfoot>					        
					        </sjdt:datatables>
                        </div>
                    </div>
                    <script>
	                    var limit = 60;
	                    var start_time = new Date().getTime();
	
	                    function updateTimeout() {
	                        var timeout = document.getElementById("countDown");
	                        if (!timeout)
	                           return;
	
	                        var sec = Math.round((new Date().getTime() - start_time)/1000);
	                        if (sec > limit) {
	                        	timeout.innerHTML = "<s:text name='coingecko.refreshnow'/>";
	                        	$('#coingeckotable').trigger('reloadCoinGeckoTableList');
	                        	start_time = new Date().getTime();
	                        }
	                        else
	                        {
	                           timeout.innerHTML = "(Refreshing in " + eval(limit - sec) + " seconds)";
	                        }
	                        setTimeout(updateTimeout, 1000);
	                    }
	
	                    setTimeout(updateTimeout, 1000);
                    </script>