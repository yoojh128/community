<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result_update eq 1}">
		������ �����߽��ϴ�.<br>
		<a href="main.do">[��������]</a>
	</c:if>

	<c:if test="${result_update eq 0}">
		���� ���� ����.<br>
		<a href="main.do">[��������]</a>
	</c:if>
</body>
</html>