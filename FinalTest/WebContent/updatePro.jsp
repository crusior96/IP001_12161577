<!-- 회원정보 수정에 대한 작업이 이루어지는 곳 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="member.MemberDataBean" %>
<%@ page import="member.MemberDBBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원정보 수정</title>
	</head>
	<body>
	<%
	//혹시 몰라서 한글 처리를 해놨습니다.
	request.setCharacterEncoding("utf-8");
	%>
		<jsp:useBean id="member" class="member.MemberDataBean"/>
		<jsp:setProperty property="*" name="member"/>
	<%
	MemberDBBean dbPro = new MemberDBBean();
	int check = dbPro.updateMember(member);
	//check==1 수정완료 & main.jsp 이동
	//check==0 비밀번호 틀림 & 뒤로이동
	if(check == 1)
	{
		 %>
		 <script type = "text/javascript">
		 alert("수정완료");
		 location.href = "main.jsp";
		 </script>
		 <%
	}
	else
	{
		 %>
		 <script type = "text/javascript">
		 alert("비밀번호틀림");
		 history.back();
		 </script>
		 <%
	}
	%>
	</body>
</html>