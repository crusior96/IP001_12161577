<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>메인 화면</title>
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
	<div id="wrap">
		<%
			//현재 세션에 있는 id값에 따라 맨 처음 화면에서 할 수 있는 일이 달라집니다
			String id = (String)session.getAttribute("id");
			//만약 세션에 있는 id값이 비어있다면 로그인 화면으로 이동됩니다
			if(id == null){
			 response.sendRedirect("loginForm.jsp");
			}
		%>
		<!-- 입력한 id가 일반 회원이라면 테트리스 게임을 시작할 수 있습니다 -->
		<h3><%=id %>님이 로그인하셨습니다.</h3><br>
		<hr>
		<!-- 입력한 id가 "admin" 즉 관리자라면 회원정보 수정 및 삭제, 회원목록을 체크할 수 있습니다 -->
		<%
		if(id!=null){
		 if(id.equals("admin"))
		 {
		  %>
		  <div id="btn">
		  <input type="button" value="테트리스 게임시작" onclick="location.href='tetris.html'">
		  <input type="button" value="회원정보 수정" onclick="location.href='updateForm.jsp'">
		  <input type="button" value="회원정보 삭제" onclick="location.href='deleteForm.jsp'">
		  <input type="button" value="로그아웃" onclick="location.href='logout.jsp'"><br>
		  <input type="button" value="현재 회원 목록 조회" onclick="location.href='list.jsp'">
		  </div>
		  <%
		 }
		 else
		 {
		  %>
		  <div id="btn">
			<input type="button" value="테트리스 게임시작" onclick="location.href='tetris.html'">
			<input type="button" value="회원정보 수정" onclick="location.href='updateForm.jsp'">
			<input type="button" value="로그아웃" onclick="location.href='logout.jsp'"><br>
		  </div>
		  <%	
			 }
		 }
		
		%>
	</div>
	</body>
</html>