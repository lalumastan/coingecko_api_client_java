<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"
	xmlns:th="http://www.thymeleaf.org">
<head>
<meta charSet="utf-8" />
<title><s:text name="coingecko.message"/></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=yes">
<meta name="author" content="ICS Discover by Mohammed Monirul Islam">
<link rel="ICS Discover Icon" href="images/favicon.ico" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Mono:wght@400;500;600&family=IBM+Plex+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<s:head />
<%-- jQuery UI is intentionally NOT loaded: nothing in this app uses a jQuery UI
     widget directly, and its "base" theme CSS was the actual cause of the
     table-text-invisible-until-hover bug (see site.css history / commit notes).
     DataTables' own search/sort/length/pagination markup and behaviour do not
     require it -- they're driven by DataTables core, styled entirely in
     site.css. If a future feature genuinely needs a jQuery UI widget, re-add
     jqueryui="true" jquerytheme="base" here and keep it, but make sure the
     resulting .ui-widget-content/.ui-state-* rules cannot reach table rows. --%>
<sj:head />
<%-- site.css is loaded LAST, after <s:head/> and <sj:head/>, on purpose:
     those tags inject their own CSS (Struts2 theme resources, and the
     struts2-jquery plugin's jQuery/DataTables base CSS bundle) directly into
     <head>. When site.css loaded earlier (before these tags), its low-
     specificity, un-namespaced rules -- plain `body { ... }`,
     `h1,h2,h3,h4,h5,h6 { ... }` -- lost the cascade to same-specificity
     rules in that later-loaded plugin CSS, silently reverting the page
     background and typography to browser defaults (visible as a white page
     and serif fallback text) even though every class-scoped rule
     (.icsHeader, .icsPanel, table.dataTable ..., .chg-badge) still applied
     fine, since those have higher specificity than any generic reset.
     Loading site.css after s:head/sj:head guarantees our rules win on
     equal-specificity selectors too, without needing !important hacks. --%>
<link href="css/site.css" rel="stylesheet"/>
</head>
<body>
	<div class="page">
        <tiles:insertAttribute name="page-header"/>
        <main>
 		  <div class="icsWrap">
	        <tiles:insertAttribute name="page-body"/>
		  </div>
		</main>
		<tiles:insertAttribute name="page-footer"/>
	</div>
</body>
</html>
