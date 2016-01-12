<%@ page contentType="text/html; charset=utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	response.setContentType("text/html; charset=utf-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>read.jsp</title>
<style>
textarea {
	/* 	background-color: #FFFF33; */
	filter =progid: DXImageTransform.Microsoft.Gradient(GradientType=1,
		StartColorStr=#669933, EndColorStr=#E0EFD1);
}
</style>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		var textarea = document.getElementById('reply');
		textarea.scrollTop = textarea.scrollHeight;

		$('#reply_button')
				.click(
						function() {
							var text = escape(encodeURIComponent($(
									'#reply_text').val()));
							$
									.ajax({
										url : "reply.do",
										type : "get",
										data : "memo_num="
												+ $('#memo_num').val() + "&id="
												+ $('#id').val()
												+ "&reply_text=" + text,
										dataType : "text",
										success : function(data) {

											if (data == "1") {
												alert("리플이 등록되었습니다.")
												$('#reply')
														.append(
																$('#id').val()
																		+ " : "
																		+ $(
																				'#reply_text')
																				.val()
																		+ "\r\n")
												$('#reply_text').val("")

												$('#reply')
														.scrollTop(
																$('#reply')[0].scrollHeight);
											}

										},
										error : function(e) {
											alert("에러남:" + e)
										}
									})
						})

		$('#favorite').click(
				function() {

					$.ajax({
						url : "favorite.do",
						type : "get",
						data : "memo_num=" + $('#memo_num').val()
								+ "&id=" + $('#id').val(),
						dataType : "text",
						success : function(data) {

							if (data == "1") {
								alert("찜하였습니다.")
							} else if (data == "0") {
								alert("이미 찜하셨습니다.")
							}

						},
						error : function(e) {
							alert("에러남:" + e)
						}
					})
				});

		$('#up').click(
				function() {

					$.ajax({
						url : "up.do",
						type : "get",
						data : "memo_num=" + $('#memo_num').val()
								+ "&id=" + $('#id').val(),
						dataType : "text",
						success : function(data) {

							if (data == "1") {
								alert("UP하셨습니다.")
								$('#upTd').text(Number($('#upVal').val()) + 1);
							} else if (data == "0") {
								alert("이미 UP하셨습니다.")
							}

						},
						error : function(e) {
							alert("에러남:" + e)
						}
					})
				});

		$('#down').click(
				function() {

					$.ajax({
						url : "down.do",
						type : "get",
						data : "memo_num=" + $('#memo_num').val()
								+ "&id=" + $('#id').val(),
						dataType : "text",
						success : function(data) {

							if (data == "1") {
								alert("DOWN하셨습니다.")
								$('#downTd').text(
										Number($('#downVal').val()) + 1);
							} else if (data == "0") {
								alert("이미 DOWN하셨습니다.")
							}

						},
						error : function(e) {
							alert("에러남:" + e)
						}
					})
				});
	})
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
				<a class="navbar-brand" href="main.do">Pappus</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">${sessionScope.loginId }님 환영합니다.</a></li>
					<li><a href="about.do">About</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">내 정보 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="user_logout.do">로그아웃</a></li>
							<li><a href="user_info_check.do">내 정보 수정</a></li>
							<li><a href="user_delete_check.do">회원 탈퇴</a></li></li>
				</ul>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">메모 <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="write_form.do">메모 날리기</a></li>
						<li><a href="list_loccheck.do">날라온 메모들</a></li>
						<li><a
							href="list_favorite.do?id=${sessionScope.loginId }">찜한
								메모들</a></li>
						<li><a href="list_other.do">다른 지역 놀러가기</a></li>
					</ul></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
	<br>
	<div>
		<c:choose>
			<c:when test="${empty requestScope.memo }">
			해당 글번호의 글이 존재하지 않습니다.<br>
				<a href="board?type=list">[목록으로]</a>
			</c:when>
			<c:otherwise>
				<div align="center">
					<table border="1" align="center"
						style="background-size: 100% 100%; background-repeat: no-repeat; background-image:url('main/post-it.png');">
						<tr>
							<td width="5%">작성자</td>
							<td width="95%" align="left">${requestScope.memo.id }</td>
						</tr>
						<tr>
							<td colspan="2"><textarea
									style="border: none; background-color: transparent;" rows="10"
									cols="50" placeholder="내용입력" name="content" readonly="readonly">${requestScope.memo.content }</textarea></td>
						</tr>
						<tr>
							<td colspan="2" align="right">${requestScope.memo.posting_date }</td>
						</tr>
						<tr>
							<td>조회수</td>
							<td>${requestScope.memo.read_count }</td>
						</tr>
						<tr>
							<td>UP</td>
							<td id="upTd">${requestScope.memo.up }</td>
						</tr>
						<tr>
							<td>DOWN</td>
							<td id="downTd">${requestScope.memo.down }</td>
						</tr>
						<tr>
							<td colspan="2" align="center"><button id="favorite">찜하기</button>
								|
								<button id="up">UP</button> /
								<button id="down">DOWN</button></td>
						</tr>
					</table>
				</div>
				<br>
				<table border="1" width="500px" align="center">
					<tr>
						<td><textarea id="reply" rows="5" cols="100" name="content"
								readonly="readonly">${requestScope.memo.reply }</textarea></td>
					</tr>
					<tr>
						<td><input id="reply_text" type="text" style="width: 100%"></td>
					</tr>
					<tr>
						<td align="center"><button id="reply_button">댓글달기</button></td>
					</tr>
				</table>
				<input id="memo_num" type="hidden"
					value="${requestScope.memo.memo_num }">
				<input id="id" type="hidden" value="${sessionScope.loginId }">
				<input id="upVal" type="hidden" value="${requestScope.memo.up }">
				<input id="downVal" type="hidden" value="${requestScope.memo.down }">
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>