<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result_update eq 1}">
		계정을 수정했습니다.<br>
		<a href="main.do">[메인으로]</a>
	</c:if>

	<c:if test="${result_update eq 0}">
		계정 수정 실패.<br>
		<a href="main.do">[메인으로]</a>
	</c:if>
</body>
</html>