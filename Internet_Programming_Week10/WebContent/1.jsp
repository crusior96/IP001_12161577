<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  java.util.Date date = new java.util.Date();
%>
안녕하세요? 현재 시각은
<%
  out.println(date);
  out.println("<BR>이고 ip주소는 ");
  out.println(request.getRemoteAddr());
%>
입니다.
</body>
</html>