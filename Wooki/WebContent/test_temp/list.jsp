<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>

<style>
.test table {
	width: 100%;
	margin: 15px 0;
	border: 0;
	border-top-left-radius: 50px 25px;
	border-top-right-radius: 50px 25px;
	border-bottom-left-radius: 15px 30px;
	border-bottom-right-radius: 15px 30px;
}

.test th {
	background-color: black;
	color: #FFFFFF /* 	<!-- ȭ��Ʈ --> */
}

.test, .test th, .test td {
	font-size: 0.95em;
	text-align: center;
	padding: 4px;
	border-collapse: collapse;
}

.test th, .test td {
	border: 1px solid gray;
	/* 	<!-- �����ϴû� --> */
	border-width: 1px 0 1px 0
}

.test tr {
	border: 1px solid #ffffff;
}

a:link {
	color: black;
}

a:visited {
	text-decoration: none;
	color: black;
}

.test tr:nth-child(odd) {
	background-color: CCCCCC;
	/* 	<!-- �ϴû� --> */
}

.test tr:nth-child(even) {
	background-color: #ffffff;
}
</style>

<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
	<title>list.jsp</title> <script type="text/javascript"
		src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
		var i = 1;

		function lastPostFunc() {
			$.get("list_scroll.do?page=" + i + "&sido="
					+ escape(encodeURIComponent($('#sido').val()))
					+ "&sigugun="
					+ escape(encodeURIComponent($('#sigugun').val()))
					+ "&action=getLastPosts&lastID="
					+ $(".wrdLatest:last").attr("id"),

			function(data) {
				if ($(data).find("#test").text() != "�Խñ��� �������� �ʽ��ϴ�.") {
					$(".wrdLatest:last").after(data);
				} else {
					alert("�Խñ��� �������� �ʽ��ϴ�.")
					$("div#lastPostsLoader").empty();
				}
			});

		};

		$(window).scroll(
				function() {

					if ($(window).scrollTop() == $(document).height()
							- $(window).height()) {
						++i;
						// $("div#lastPostsLoader:last").html("���������������ε���...��������������");
						setTimeout("lastPostFunc()", 1000);
						// lastPostFunc();
					}
				});

		function selectEvent(value) {

			if (i == 1) {
				$('.row')
						.load(
								"list.do?value="
										+ value
										+ "&sido="
										+ escape(encodeURIComponent($('#sido')
												.val()))
										+ "&sigugun="
										+ escape(encodeURIComponent($(
												'#sigugun').val())) + " .row");

			} else {
				window.location.href = "list.do?value=" + value + "&sido="
						+ escape(encodeURIComponent($('#sido').val()))
						+ "&sigugun="
						+ escape(encodeURIComponent($('#sigugun').val()));
			}

		}
	</script>
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
			<a class="navbar-brand" href="memo?type=main">Pappus</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">${sessionScope.loginId }�� ȯ���մϴ�.</a></li>
				<li><a href="memo?type=about">About</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">�� ���� <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="member?type=user_logout">�α׾ƿ�</a></li>
						<li><a href="member?type=user_info">�� ���� ����</a></li>
						<li><a href="member?type=user_drop">ȸ�� Ż��</a></li></li>
			</ul>
			</li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown">�޸� <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="memo?type=write_form">�޸� ������</a></li>
					<li><a href="memo?type=list_loccheck">����� �޸��</a></li>
					<li><a
						href="memo?type=list_favorite&id=${sessionScope.loginInfo.id }">����
							�޸��</a></li>
					<li><a href="memo?type=list_other">�ٸ� ���� �����</a></li>
				</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>

	<br>

		<div class="content-section" id="portfolio">
			<div id="list" class="container">
				<div align="center">
					�������� : <select id="sel" name="kind"
						onChange="javascript:selectEvent(this.value)">

						<c:if test="${requestScope.value==0 || param.value==0}">
							<option name="new" value="0" selected="selected">�ֽű�</option>
							<option name="favorite" value="1">���ƿ�</option>
						</c:if>
						
						<c:if test="${requestScope.value==1 || param.value==1}">
							<option name="new" value="0">�ֽű�</option>
							<option name="favorite" value="1" selected="selected">���ƿ�</option>
						</c:if>
						

					</select>&nbsp&nbsp �� ��ġ : <input id="area" type="text"
						value="${requestScope.sido} ${requestScope.sigugun}" disabled>
				</div>
				<!-- /.row -->
				<div class="row">
					<c:choose>
						<c:when test="${empty requestScope.memoPage.memoList }">

							<h3 align="center">�Խñ��� �������� �ʽ��ϴ�.</h3>

						</c:when>
						<c:otherwise>
							<c:forEach var="memo" items="${requestScope.memoPage.memoList }">
								<div class="portfolio-item col-md-3 col-sm-6">
									<div class="portfolio-thumb"
										style="background-image: URL(test/240_post1.png); height: 240px; width: 240px;">


										<article style="position: absolute; top: 50px; left: 30px;">
										<a id="page" href="read.do?memo_num=${memo.memo_num }">${memo.content }</a>
										</article>
										<div class="portfolio-overlay">

											<a href="test/post1.png" data-rel="lightbox" class="expand">
												<i class="fa fa-search"></i>
											</a>
										</div>
										<!-- /.portfolio-overlay -->
									</div>
									<p>${memo.id}</p>
									<p>${memo.posting_date}</p>
									<!-- /.portfolio-thumb -->
								</div>
							</c:forEach>
							<div class="wrdLatest" id=8></div>
						</c:otherwise>
					</c:choose>
					<!-- /.portfolio-item -->
					<input type="hidden" id="sido" value="${requestScope.sido}">
						<input type="hidden" id="sigugun" value="${requestScope.sigugun}">
				</div>
			</div>
			<div id="lastPostsLoader" align="center"></div>
		</div>
</body>
</html>