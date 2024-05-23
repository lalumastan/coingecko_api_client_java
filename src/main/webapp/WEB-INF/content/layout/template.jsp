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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link href="css/site.css" rel="stylesheet"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>   
<s:head />
<sj:head jqueryui="true" jquerytheme="redmond"/>
</head>
<body style="background-image: url('images/ai.jpg')">
	<div>
        <tiles:insertAttribute name="page-header"/>
        <main>
 		  <div class="container my-3">
	        <tiles:insertAttribute name="page-body"/>
		  </div>
		</main>
		<tiles:insertAttribute name="page-footer"/>
	</div>
</body>
</html>
