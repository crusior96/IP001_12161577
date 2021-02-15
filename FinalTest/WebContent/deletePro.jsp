<!-- 회원에 대한 정보 삭제가 이루어지는 곳입니다 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="member.MemberDataBean" %>
<%@ page import="member.MemberDBBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원 삭제 진행</title>
	</head>
	<body>
		<%
		String id = request.getParameter("id");
		//passwd값 가져오기
		String passwd = request.getParameter("passwd");
		//데이터베이스 객체인 dbPro를 생성합니다.
		MemberDBBean dbPro = new MemberDBBean();
		int check = dbPro.deleteMember(id, passwd);
		
		// check==1 : 세션값 삭제 & 삭제성공메시지 & loginForm.jsp로 이동
		// check==0 : 비밀번호가 틀렸으므로 이전 페이지로 이동
		if(check == 1)
		{
			 session.invalidate();
			 %>
			 <script type="text/javascript">
			 alert("해당 유저에 대한 삭제가 성공했습니다");
			 location.href="main.jsp";
			 </script>
			 <%
		}
		else if(check == 0)
		{
			 %>
			 <script type="text/javascript">
			 alert("비밀번호가 틀렸습니다");
			 history.back();
			 </script>
			 <%
		}
		%>
		
	</body>
</html>