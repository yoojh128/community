<%@page import="vo.PappusMembership"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript">
	$(document).ready(function() {
		$("#year-opt").val($("#year").val());
		$("#month-opt").val($("#month").val());
		$("#day-opt").val($("#day").val());
	});

	function checkIt() {
		if (!document.userinput.id.value) {
			alert("ID를 입력하세요");
			return false;
		}
		if (!document.userinput.pw.value) {
			alert("비밀번호를 입력하세요");
			return false;
		}
		if (document.userinput.pw.value != document.userinput.password1.value) {
			alert("비밀번호가 서로 다릅니다.")
			return false;
		}
		if (!document.userinput.name.value) {
			alert("사용자의 이름을 입력해주세요");
			return false;
		}
		if (!document.userinput.phoneNum.value) {
			alert("휴대번호를 입력해주세요");
			return false;
		}
		if (!document.userinput.year.value || !document.userinput.month.value
				|| !document.userinput.day.value) {
			alert("생년월일을 입력하세요");
			return false;
		}
		var gender = $(':radio[name="gender"]:checked').val();
		if (gender == null) {
			alert("성별을 선택하세요");
			return false;
		}
	}

	function openConfirmid(inputid) {
		if (inputid.id.value == "") {
			alert("아이디를 입력해주세요");
			return false;
		}
		url = "confirmId.do?id="
				+ encodeURI(encodeURIComponent(inputid.id.value));
		window
				.open(
						url,
						"confirm",
						"toolbar=no, location=no,menubar=no,scrollbars=no,resizeble=no,width=310,height=180");

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
				<li class="dropdown"><a href="" class="dropdown-toggle"
					data-toggle="dropdown">내 정보 <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="user_logout.do">로그아웃</a></li>
						<li><a href="user_info_check.do">내 정보</a></li>
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
	<!-- /.container --> </nav>
	<br>


	<link rel="stylesheet" href="assets/member/css/main.css" />
	<div id="page-wrapper">

		<article id="main"> <header>
		<h2>내 정보</h2>
		</header> <section class="wrapper style5">
		<div class="inner">
			<section>
			<h4>정보 확인란</h4>
			<form method="post" action="user_update.do" name="userinput"
				onsubmit="return checkIt()">
				<div class="row uniform">
					<div class="6u 12u$(xsmall)">
						<label id="demo-name">${userInfo.getId() }</label> <input
							type="hidden" name="id" id="demo-name"
							value="${userInfo.getId() }" />
					</div>
					<div class="6u 12u$(xsmall)">
						<input type="password" name="pw" id="pasword" value=""
							placeholder="비밀번호" />
					</div>
					<div class="6u 12u$(xsmall)">
						<input type="password" name="password1" id="pasword" value=""
							placeholder="비밀번호 확인" />
					</div>
					<div class="6u$ 12u$(xsmall)">
						<input type="text" name="name" id="de"
							value="${userInfo.getName() }" />
					</div>
					<div class="6u 12u$(xsmall)">
						<input type="email" name="email" id="de"
							value="${userInfo.getEmail() }" />
					</div>
					<div class="6u 12u$(xsmall)">
						<input type="text" name="phoneNum" id="phone"
							value="${userInfo.getPhoneNum() }" maxlength="13" />
					</div>

					<div class="\-10u">

						<div class="select-wrapper">
							<select name="year" id="year-opt">
								<option value="">년도 -</option>
								<option value="1980">1980</option>
								<option value="1981">1981</option>
								<option value="1982">1982</option>
								<option value="1983">1983</option>
								<option value="1984">1984</option>
								<option value="1985">1985</option>
								<option value="1986">1986</option>
								<option value="1987">1987</option>
								<option value="1988">1988</option>
								<option value="1989">1989</option>
								<option value="1990">1990</option>
								<option value="1991">1991</option>
								<option value="1992">1992</option>
								<option value="1993">1993</option>
								<option value="1994">1994</option>
								<option value="1995">1995</option>
								<option value="1996">1996</option>
								<option value="1997">1997</option>
								<option value="1998">1998</option>
								<option value="1999">1999</option>
								<option value="2000">2000</option>
								<option value="2001">2001</option>
							</select>
						</div>
					</div>
					<div class="\-10u">

						<div class="select-wrapper">
							<select name="month" id="month-opt">
								<option value="">월 -</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>

							</select>

						</div>
					</div>
					<div class="\-10u">
						<div class="select-wrapper">
							<select name="day" id="day-opt">
								<option value="">일 -</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
								<option value="21">21</option>
								<option value="22">22</option>
								<option value="23">23</option>
								<option value="24">24</option>
								<option value="25">25</option>
								<option value="26">26</option>
								<option value="27">27</option>
								<option value="28">28</option>
								<option value="29">29</option>
								<option value="30">30</option>
								<option value="31">31</option>

							</select>

						</div>
					</div>
					<c:if test="${userInfo.getGender()=='m'}">
						<div class="4u 12u$(xsmall)">
							<input type="radio" id="demo-priority-low" name="gender"
								value="m" checked="checked"> <label
								for="demo-priority-low">남자</label>

						</div>
						<div class="4u 12u$(xsmall)">
							<input type="radio" id="demo-priority-normal" name="gender"
								value="f"> <label for="demo-priority-normal">여자</label>
						</div>
					</c:if>

					<c:if test="${userInfo.getGender()=='f'}">
						<div class="4u 12u$(xsmall)">
							<input type="radio" id="demo-priority-low" name="gender"
								value="m"> <label for="demo-priority-low">남자</label>

						</div>
						<div class="4u 12u$(xsmall)">
							<input type="radio" id="demo-priority-normal" name="gender"
								value="f" checked="checked"> <label
								for="demo-priority-normal">여자</label>
						</div>
					</c:if>


					<div class="12u$">
						<textarea name="demo-message" id="demo-message"
							placeholder="Enter your message" rows="6"></textarea>
					</div>

					<div class="12u$">
						<ul class="actions">
							<li><input type="submit" value="수정하기" class="special" /></li>
							<li><input type="reset" value="Reset" /></li>
						</ul>
					</div>
				</div>
			</form>
			</section>
		</div>
		</section> </article>

		<!-- Footer -->
		<footer id="footer">
		<ul class="icons">
			<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
			<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
			<li><a href="#" class="icon fa-instagram"><span
					class="label">Instagram</span></a></li>
			<li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
			<li><a href="#" class="icon fa-envelope-o"><span
					class="label">Email</span></a></li>
		</ul>
		<ul class="copyright">
			<li>&copy; Pappus</li>
			<li>By woojung</li>
		</ul>
		</footer>

	</div>
	<input type="hidden" id="year" value="${userInfo.getYear()}">
	<input type="hidden" id="month" value="${userInfo.getMonth()}">
	<input type="hidden" id="day" value="${userInfo.getDay()}">

	<!-- Scripts -->
	<script src="assets/member/js/jquery.min.js"></script>
	<script src="assets/member/js/jquery.scrollex.min.js"></script>
	<script src="assets/member/js/jquery.scrolly.min.js"></script>
	<script src="assets/member/js/skel.min.js"></script>
	<script src="assets/member/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/member/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/member/js/main.js"></script>
</body>
</html>

<div align="center">
	<a href="user_update.do">[내 정보 수정]</a>
</div>
</body>
</html>
