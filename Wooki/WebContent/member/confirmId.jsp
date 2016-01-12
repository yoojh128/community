<%@page import="java.net.URLDecoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@page import="repository.MembershipDao"%> --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<title>ID 중복확인</title>
<c:if test="${result eq 1}">
<b><font color="red">${param.id }</font>는 이미 사용중인 아이디입니다.</b>

<form name="checkForm" method="post" action="confirmId.do">
	<div id="idDiv" class="join_row">
		<span class="ps_box int_id"> <input type="text" id="id"
			name="id" value="" maxlength="20" placeholder="아이디" class="int">
		</span> <span class="px_box int_id"><input type="submit"
			value="ID중복확인"></span>
	</div>
</form>
</c:if>

<c:if test="${result eq 0}">
<center>
	<b>입력하신<font color="red">${param.id }</font>는 사용하실 수 있는 ID입니다.
	</b><br>
	<br> <input type="button" value="닫기" onclick="setid()">
</center>
</c:if>

<script type="text/javascript">
	function setid(){
		opener.document.userinput.id.value="${param.id}";
		self.close();
	}
</script>
<%
// 	dao.closeConnection();
%>
</head>
<body>

</body>
</html>