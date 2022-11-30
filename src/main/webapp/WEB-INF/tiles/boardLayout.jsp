<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		table{width: 800px; height: 600px; border: 1px solid red;}
		.a{height: 100px; background-color: blue;}
		.b{height: 200px; background-color: orange;}
		.aside{width: 200px; background-color: skyblue;}
	</style>
</head>
<body>
	<table>
		<tr class="a">
			<th colspan="2"><tiles:insertAttribute name="header"/></th>
		</tr>
		<tr>
			<th><tiles:insertAttribute name="content"/></th>
			<th class="aside"><tiles:insertAttribute name="aside"/></th>
		</tr>
		<tr class="b">
			<th colspan="2"><tiles:insertAttribute name="footer"/></th>
		</tr>
	</table>
</body>
</html>