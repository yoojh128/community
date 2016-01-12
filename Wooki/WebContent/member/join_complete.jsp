<%@page import="vo.PappusMembership"%>
<%-- <%@page import="repository.MembershipDao"%> --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입 완료</title>

<style type="text/css">
	h1{
		color: red;
	}
</style>
</head>
<body>
	<c:if test="${result eq 1}">
		<h1>회원가입 성공</h1><br>
		<a href="start.do">[로그인하러가기]</a>
	</c:if>
	
	<c:if test="${result ne 1}">
		<h1>회원가입 실패! ㅠㅠ</h1><br>
		<a href="start.do">[메인화면]</a>
	</c:if>

</body>
</html>