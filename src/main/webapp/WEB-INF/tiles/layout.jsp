<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<!-- <style type="text/css">
		header{height: 100px;}
		section{height: 400px;}
		footer{height: 150px;}
	</style> -->
</head>
<body>

	<header>
		<tiles:insertAttribute name="header"/>
	</header>
	
	<section>
		<tiles:insertAttribute name="content"/>
	</section>
	
	<footer>
		<tiles:insertAttribute name="footer"/>
	</footer>
	
</body>
</html>