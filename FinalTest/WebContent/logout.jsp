<!-- 로그아웃을 진행하는곳. 세션값 초기화 및 loginForm.jsp로의 이동이 진행된다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>로그아웃 처리</title>
	</head>
	<body>
		<%
			session.invalidate();
			response.sendRedirect("loginForm.jsp");
		%>
	</body>
</html>