<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	session.invalidate();
%>
<html>
<head>
<title>user_logout.jsp</title>
</head>
<body>
회원 로그아웃!<br>
	세션Id=<%=session.getId()	%><br>
	<button onclick="location.href='start.do'">로그인 화면으로</button>
</body>
</html>