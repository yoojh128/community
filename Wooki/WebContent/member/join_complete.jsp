<%@page import="vo.PappusMembership"%>
<%-- <%@page import="repository.MembershipDao"%> --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������ �Ϸ�</title>

<style type="text/css">
	h1{
		color: red;
	}
</style>
</head>
<body>
	<c:if test="${result eq 1}">
		<h1>ȸ������ ����</h1><br>
		<a href="start.do">[�α����Ϸ�����]</a>
	</c:if>
	
	<c:if test="${result ne 1}">
		<h1>ȸ������ ����! �Ф�</h1><br>
		<a href="start.do">[����ȭ��]</a>
	</c:if>

</body>
</html>