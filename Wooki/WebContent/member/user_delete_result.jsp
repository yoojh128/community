<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result eq 1}">
		<%
			session.invalidate();
		%>
		������ �����߽��ϴ�.<br>
		<a href="start.do">[�α��� ȭ������]</a>
	</c:if>

	<c:if test="${result eq 0}">
		���� ������ �����߽��ϴ�.<br>
		<a href="main.do">[��������]</a>
	</c:if>
</body>
</html>