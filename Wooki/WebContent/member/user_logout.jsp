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
ȸ�� �α׾ƿ�!<br>
	����Id=<%=session.getId()	%><br>
	<button onclick="location.href='start.do'">�α��� ȭ������</button>
</body>
</html>