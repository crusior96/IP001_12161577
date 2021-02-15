<!-- 회원가입 작업이 진행되는 곳입니다 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="member.MemberDataBean" %>
<%@ page import="member.MemberDBBean" %>
<%@ page import="java.sql.*" %><!-- 별로 추천되지 않는 import 방식.. -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
	<%
	request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="member" class = "member.MemberDataBean"/>
	<jsp:setProperty property = "*" name = "member" />
	아이디:<jsp:getProperty property = "id" name = "member"/><br>
	패스워드:<jsp:getProperty property = "passwd" name = "member"/><br>
	이름:<jsp:getProperty property = "name" name = "member"/><br>
	이메일:<jsp:getProperty property = "email" name = "member"/><br>
	<%

	MemberDBBean dbpro = new MemberDBBean();
	dbpro.insertMember(member);
	
	%>
	 <script type="text/javascript">
	 alert("회원가입 성공!");
	 location.href="loginForm.jsp";
	 </script><%
	%>
	</body>
</html>