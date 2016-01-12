<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>list.jsp</title>
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
	color: #FFFFFF /* 	<!-- 화이트 --> */
}

.test, .test th, .test td {
	font-size: 0.95em;
	text-align: center;
	padding: 4px;
	border-collapse: collapse;
}

.test th, .test td {
	border: 1px solid gray;
	/* 	<!-- 진한하늘색 --> */
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
	/* 	<!-- 하늘색 --> */
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
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	var i = 1;

	function lastPostFunc() {
		$.get("list_scroll.do?favorite=favorite&value="
				+ $('#sel option:selected').val() + "&page=" + i + "&id="
				+ $('#sessionId').val() + "&action=getLastPosts&lastID="
				+ $(".wrdLatest:last").attr("id"),

		function(data) {
			if ($(data).find("#test").text() != "게시글이 존재하지 않습니다.") {
				$(".wrdLatest:last").after(data);
			} else {
				alert("게시판의 마지막입니다.")
				$("div#lastPostsLoader").empty();
			}
		});

	};

	$(window).scroll(
			function() {

				if ($(window).scrollTop() == $(document).height()
						- $(window).height()) {
					++i;
					// $("div#lastPostsLoader:last").html("♥♥♥♥♥♥♥로딩중...♥♥♥♥♥♥♥");
					setTimeout("lastPostFunc()", 1000);
					// lastPostFunc();
				}
			});

	function selectEvent(value) {
		if (i == 1) {
			$('.row').load(
					"list_favorite.do?value=" + value + "&id="
							+ $('#sessionId').val() + " .row");

		} else {
			window.location.href = "list_favorite.do?value=" + value + "&id="
					+ $('#sessionId').val();
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
						<li><a href="list_favorite.do?id=${sessionScope.loginId }">찜한
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
	<div class="content-section" id="portfolio">
		<div id="list" class="container">
			<div align="center">
				정렬조건 : <select id="sel" name="kind"
					onChange="javascript:selectEvent(this.value)">
					<c:if test="${requestScope.value==0 || param.value==0}">
						<option name="new" value="0" selected="selected">최신글</option>
						<option name="favorite" value="1">좋아요</option>
					</c:if>

					<c:if test="${requestScope.value==1 || param.value==1}">
						<option name="new" value="0">최신글</option>
						<option name="favorite" value="1" selected="selected">좋아요</option>
					</c:if>
				</select>
			</div>
			<div class="row">
				<c:choose>
					<c:when test="${empty requestScope.memoPage.memoList }">

						<h3 align="center">게시글이 존재하지 않습니다.</h3>

					</c:when>
					<c:otherwise>
						<c:forEach var="memo" items="${requestScope.memoPage.memoList }">
							<div class="portfolio-item col-md-3 col-sm-6">
								<div class="portfolio-thumb"
									style="background-image: URL(css-rep/main/img/240_post1.png); height: 240px; width: 240px;">


									<article style="position: absolute; top: 50px; left: 30px;">
										<a id="page" href="read.do?memo_num=${memo.memo_num }">${memo.content }</a>
									</article>
									<div class="portfolio-overlay">

										<a href="css-rep/main/img/post1.png" data-rel="lightbox"
											class="expand"> <i class="fa fa-search"></i>
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
			</div>
			<input type="hidden" id="sessionId" value="${sessionScope.loginId }">
		</div>
		<div id="lastPostsLoader" align="center"></div>
	</div>
</body>
</html>