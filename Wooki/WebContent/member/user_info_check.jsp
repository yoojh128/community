<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body style="padding-top: 50px;">
	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="main.do">Pappus</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">${sessionScope.loginId }�� ȯ���մϴ�.</a></li>
					<li><a href="about.do">About</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">�� ���� <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="user_logout.do">�α׾ƿ�</a></li>
							<li><a href="user_info_check.do">�� ���� ����</a></li>
							<li><a href="user_delete_check.do">ȸ�� Ż��</a></li></li>
				</ul>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">�޸� <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="write_form.do">�޸� ������</a></li>
						<li><a href="list_loccheck.do">����� �޸��</a></li>
						<li><a
							href="list_favorite.do?id=${sessionScope.loginId }">����
								�޸��</a></li>
						<li><a href="list_other.do">�ٸ� ���� �����</a></li>
					</ul></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
	<br>
	<div align="center">
		<br> ���̵�:${sessionScope.loginId }<br>
		<form action="user_info.do" method="post">
			��й�ȣ:<input type="password" name="pw"> <input type="hidden"
				name="id" value="${sessionScope.loginId }"> <input
				type="submit" value="Ȯ��">
		</form>
	</div>

</body>
</html>