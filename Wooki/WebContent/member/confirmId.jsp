<%@page import="java.net.URLDecoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@page import="repository.MembershipDao"%> --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<title>ID �ߺ�Ȯ��</title>
<c:if test="${result eq 1}">
<b><font color="red">${param.id }</font>�� �̹� ������� ���̵��Դϴ�.</b>

<form name="checkForm" method="post" action="confirmId.do">
	<div id="idDiv" class="join_row">
		<span class="ps_box int_id"> <input type="text" id="id"
			name="id" value="" maxlength="20" placeholder="���̵�" class="int">
		</span> <span class="px_box int_id"><input type="submit"
			value="ID�ߺ�Ȯ��"></span>
	</div>
</form>
</c:if>

<c:if test="${result eq 0}">
<center>
	<b>�Է��Ͻ�<font color="red">${param.id }</font>�� ����Ͻ� �� �ִ� ID�Դϴ�.
	</b><br>
	<br> <input type="button" value="�ݱ�" onclick="setid()">
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