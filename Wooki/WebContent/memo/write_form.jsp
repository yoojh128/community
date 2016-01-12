<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<title>write_form.jsp</title>
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	var pos;
	var sido;
	var sigugun;

	function getLocation() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(showPosition);
		} else {
			alert("No");
		}
	}

	function showPosition(position) {
		pos = position.coords.longitude + ", " + position.coords.latitude;
// 		alert(pos);
		
		$.ajax({
			url:"map.do",
			type:"POST",
			data:{"query":pos},
			dataType:"xml",
			success:function(data){
			var result="";
				
				$(data).find("item").each(function(){
					sido = $(this).find("sido").text();
					sigugun = $(this).find("sigugun").text();
					
					return false;
				})
				
				$('#sido').val(sido);
				$('#sigugun').val(sigugun);
				$('#posvalue').val(pos);
				
				$('#target').submit();
				
			},
			error:function(e){
				alert("에러남:"+e);
			}
		})
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
	</nav><br>
	<div align="center">
		<form id="target" action="memo_write.do" method="post">
			글내용:<br>
			<textarea rows="25" cols="75" placeholder="내용입력" id="content" name="content"></textarea>
			<hr>
			<input type="hidden" name="type" value="memo_write"> <input
				type="hidden" name="id"
				value="${sessionScope.loginId }"> <input
				id="sido" type="hidden" name="sido" value=""> <input
				id="sigugun" type="hidden" name="sigugun" value=""> <input
				id="posvalue" type="hidden" name="posvalue" value="">
		</form>
	</div>
	<div align="center">
	<button onclick="getLocation()">메모 날리기</button>
	</div>
</body>
</html>