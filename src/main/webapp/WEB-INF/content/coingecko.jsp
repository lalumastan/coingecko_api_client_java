<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sjdt" uri="/struts-jquery-datatables-tags"%>

                    <div class="icsPanel">
                        <div class="icsPanelHead">
                            <span class="icsPanelTitle">
                               <s:property value="message" escapeHtml="false"/>
                            </span>
                            <span class="icsPill">
                                <span class="icsPillDot icsLive"></span>
                                <span id="countDown"></span>
                            </span>
                        </div>
                        <div class="icsTableScroll">
 	 			                <%-- datatablesTheme="jqueryui" removed on purpose: it tagged rows/cells
 	 			                     with jQuery UI's ui-state-default class, which our own site.css
 	 			                     styled dim (for idle buttons/pagination), making table text
 	 			                     unreadable except on hover. DataTables' search/sort/length/
 	 			                     pagination all keep working without it -- they're plain
 	 			                     DataTables markup, fully re-skinned in site.css. --%>
 	 			                <sjdt:datatables cssClass="stripe" ajax="{url: 'getCoingecko.action', dataSrc: 'coinGeckoTableList'}" ajaxReloadTopics="reloadCoinGeckoTableList" title="%{getText('coingecko.message')}" order="[ [1,'asc'] ]" datatablesTheme="jqueryui" id="coingeckotable" style="width:100%">
			                        <thead>
                                        <tr>
											<s:iterator value="headerList" status="headerStatus">
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

	                    // Purely cosmetic: color-code the "Day Chg %" column (green/red pill)
	                    // on every draw (initial load, sort, search, page, and each ajax
	                    // refresh). Reads only the already-rendered text -- it does not
	                    // change what data is requested, sorted, or displayed.
	                    $(document).on('draw.dt', '#coingeckotable', function () {
	                        $(this).find('tbody tr').each(function () {
	                            var $cell = $(this).find('td').last();
	                            if ($cell.find('.chg-badge').length) {
	                                return;
	                            }
	                            var raw = $.trim($cell.text());
	                            var val = parseFloat(raw);
	                            if (isNaN(val) || raw === '') {
	                                return;
	                            }
	                            var cls = val > 0 ? 'chg-pos' : (val < 0 ? 'chg-neg' : 'chg-flat');
	                            var sign = val > 0 ? '+' : '';
	                            $cell.html('<span class="chg-badge ' + cls + '">' + sign + raw + '%</span>');
	                        });
	                    });
                    </script>
