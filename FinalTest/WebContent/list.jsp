<!-- 현재 회원가입한 회원들의 목록을 보여주는 창입니다 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="member.MemberDataBean" %>
<%@ page import="member.MemberDBBean" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원 목록</title>
	</head>
	<body>
		<%
			//세션값 가져오기
			String id = (String)session.getAttribute("id");
			//세션값이 없으면 loginForm.jsp로 이동합니다
			if(id==null)
			{
			 response.sendRedirect("loginForm.jsp");
			}

			MemberDBBean dbPro = new MemberDBBean();
			List memberList=null;
			//memberList에 회원의 전체 목록을 가져옵니다.
			memberList = dbPro.getMemberList();
		%>
			<h1>회원목록</h1>
			<h3><a href="main.jsp">메인화면으로</a></h3>
			<table border="2">
			<tr>
				<td>아이디</td><td>비밀번호</td><td>이름</td><td>Email</td>
			</tr>
		<%
			 for(int i = 0; i < memberList.size(); i++){
			  MemberDataBean member = (MemberDataBean) memberList.get(i);
			  %>
			  <tr>
			  <td><%=member.getId() %></td>
			  <td><%=member.getPasswd() %></td>
			  <td><%=member.getName() %></td>
			  <td><%=member.getEmail() %></td>
			  </tr>
		 <%
			 } 
		%>
		</table>
	</body>
</html>