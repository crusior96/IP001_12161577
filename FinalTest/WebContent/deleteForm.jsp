<!-- 회원 삭제를 진행하는 창입니다 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원 삭제</title>
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
		<h1>회원정보삭제</h1>
		<hr>
		<form action="deletePro.jsp" method="post">
		아이디: <input type="text" name="id"><br>
		패스워드: <input type="password" name="passwd"><br>
		<input type="submit" value="회원삭제">
		<input type="button" value="뒤로가기" onclick="location.href='main.jsp'"><br>
		</form>
	</div>
	</body>
</html>