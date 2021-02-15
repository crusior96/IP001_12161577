<!-- 로그인을 진행하는 프로그램  / loginForm.jsp와 연계돼있습니다 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="member.MemberDataBean" %>
<%@ page import="member.MemberDBBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			//id passwd 가져오기
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			//int check : 메서드 userCheck(id,passwd)의 결과값이 1,0,-1인지 확인하는 용도의 변수
			MemberDBBean dbpro = new MemberDBBean();
			int check = dbpro.userCheck(id,passwd);
			
			//check==1 : 세션생성"id" & main.jsp로 이동
			//check==0 : 비밀번호틀림 & 뒤로이동
			//check==-1 : 아이디없음 & 뒤로이동
		if(check==1)
		{
			 session.setAttribute("id", id);
			 %>
			 <script type="text/javascript">
			 alert("로그인 완료");
			 location.href="main.jsp";
			 </script>
			 <%
		}
		else if(check==0){
			 %>
			 <script type="text/javascript">
			 alert("비밀번호가 틀렸습니다");
			 history.back();
			 </script>
			 <%
		}
		else{
			 %>
			 <script type="text/javascript">
			 alert("아이디가 없습니다");
			 history.back();
			 </script>
			 <%
		}
		%>
	</body>
</html>