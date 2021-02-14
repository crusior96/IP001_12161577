<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%! int day =3; %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>if/else예제</title>
</head>
<body>
<% if(day==1|day==7) {%>
<p>오늘은 주말입니다.</p>
<%} else {%>
<p>오늘은 주말이 아닙니다.</p>
<%} %>
</body>
</html>