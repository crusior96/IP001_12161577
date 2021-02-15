<!-- 회원정보 수정이 이루어지는 창 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="member.MemberDataBean" %>
<%@ page import="member.MemberDBBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>회원정보 수정</title>
		<style>
		#wrap
		{
			width: 700px;
			margin-left: auto;
			margin-right: auto;
		}
		
		input[type=button], input[type=submit] 
		{
			border: none;
			border-radius: 10px;
			text-align: center;
		    text-decoration: none;
		    width: 100px;
		    background-color: #BBDEFB;
		    color: black;
		    padding: 15px 0;
		    display: inline-block;
		    font-size: 10px;
		    margin: 5px;
		    cursor: pointer;
		}
		
		hr
		{
			border: 5px solid black;	
		}
		
		h3
		{
			text-align: center;
		}
		
		#btn
		{
		width:700px;
		text-align: center;
		}
		</style>
	</head>
	<body>
	<div id = "wrap">
	<%
		String id = (String)session.getAttribute("id");
		if(id == null){
		 response.sendRedirect("loginForm.jsp");
		}
		MemberDBBean dbPro = new MemberDBBean();
		MemberDataBean member = dbPro.getMember(id);
	%>
		<h1>회원정보수정</h1>
		<hr>
			<form action="updatePro.jsp" method="post">
			아이디:<%=member.getId() %>
			<input type="hidden" name="id" value="<%=member.getId()%>"><br>
			패스워드:<input type="password" name="passwd"><br>
			이름:<input type="text" name="name" value="<%=member.getName()%>"><br>
			이메일:<input type="text" name="email" value="<%=member.getEmail()%>"><br>
			<input type="submit" value="회원수정">
			</form>
	</div>
	</body>
</html>