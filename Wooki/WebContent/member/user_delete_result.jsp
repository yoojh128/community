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
		계정을 삭제했습니다.<br>
		<a href="start.do">[로그인 화면으로]</a>
	</c:if>

	<c:if test="${result eq 0}">
		계정 삭제에 실패했습니다.<br>
		<a href="main.do">[메인으로]</a>
	</c:if>
</body>
</html>