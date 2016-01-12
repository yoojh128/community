<%@page import="vo.PappusMembership"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="css-rep/main/demo.css" />
<link rel="stylesheet" type="text/css" href="css-rep/main/style7.css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Modern Business - Start Bootstrap Template</title>

<!-- Bootstrap Core CSS -->
<link href="css-rep/main/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css-rep/main/css/modern-business.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="aboutmain/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

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

	<!-- Header Carousel -->
	<header id="myCarousel" class="carousel slide">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active">
				<div class="fill" style="background-image: url('css-rep/main/img/logo-1.png');"></div>
				<div class="carousel-caption">
					<h2>BlowingMessage</h2>
				</div>
			</div>
			<div class="item">
				<div class="fill"
					style="background-image: url('http://placehold.it/1900x1080&amp;text=Slide Two');"></div>
				<div class="carousel-caption">
					<h2>Caption 2</h2>
				</div>
			</div>
			<div class="item">
				<div class="fill"
					style="background-image: url('http://placehold.it/1900x1080&amp;text=Slide Three');"></div>
				<div class="carousel-caption">
					<h2>Caption 3</h2>
				</div>
			</div>
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="icon-prev"></span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span class="icon-next"></span>
		</a>
	</header>
	<div class="container" align="center">
				<div class="content">
					<ul class="ca-menu">
						<li><a href="list_loccheck.do"> <span
								class="ca-icon">A</span>
								<div class="ca-content">
									<h2 class="ca-main">날라온 메모들</h2>
									<h3 class="ca-sub">test1</h3>
								</div>
						</a></li>
						<li><a href="write_form.do"> <span class="ca-icon">I</span>
								<div class="ca-content">
									<h2 class="ca-main">메모 날리기</h2>
									<h3 class="ca-sub">test2</h3>
								</div>
						</a></li>
						<li><a
							href="list_favorite.do?id=${sessionScope.loginId }">
								<span class="ca-icon">C</span>
								<div class="ca-content">
									<h2 class="ca-main">찜한 메모들</h2>
									<h3 class="ca-sub">test3</h3>
								</div>
						</a></li>
					</ul>
				</div>
				<!-- content -->
			</div>
	<!-- Page Content -->
	<div class="container">

		<!-- Marketing Icons Section -->
		<div class="row">
			

			<!-- Portfolio Section -->
			<div class="row">
				<div class="col-lg-12">
					<h2 class="page-header">Portfolio Heading</h2>
				</div>
				<div class="col-md-4 col-sm-6">
					<a href="portfolio-item.html"> <img
						class="img-responsive img-portfolio img-hover"
						src="http://placehold.it/700x450" alt="">
					</a>
				</div>
				<div class="col-md-4 col-sm-6">
					<a href="portfolio-item.html"> <img
						class="img-responsive img-portfolio img-hover"
						src="http://placehold.it/700x450" alt="">
					</a>
				</div>
				<div class="col-md-4 col-sm-6">
					<a href="portfolio-item.html"> <img
						class="img-responsive img-portfolio img-hover"
						src="http://placehold.it/700x450" alt="">
					</a>
				</div>
				<div class="col-md-4 col-sm-6">
					<a href="portfolio-item.html"> <img
						class="img-responsive img-portfolio img-hover"
						src="http://placehold.it/700x450" alt="">
					</a>
				</div>
				<div class="col-md-4 col-sm-6">
					<a href="portfolio-item.html"> <img
						class="img-responsive img-portfolio img-hover"
						src="http://placehold.it/700x450" alt="">
					</a>
				</div>
				<div class="col-md-4 col-sm-6">
					<a href="portfolio-item.html"> <img
						class="img-responsive img-portfolio img-hover"
						src="http://placehold.it/700x450" alt="">
					</a>
				</div>
			</div>
			<!-- /.row -->

			<!-- Features Section -->
			<div class="row">
				<div class="col-lg-12">
					<h2 class="page-header">Modern Business Features</h2>
				</div>
				<div class="col-md-6">
					<p>The Modern Business template by Start Bootstrap includes:</p>
					<ul>
						<li><strong>Bootstrap v3.2.0</strong></li>
						<li>jQuery v1.11.0</li>
						<li>Font Awesome v4.1.0</li>
						<li>Working PHP contact form with validation</li>
						<li>Unstyled page elements for easy customization</li>
						<li>17 HTML pages</li>
					</ul>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Corporis, omnis doloremque non cum id reprehenderit, quisquam
						totam aspernatur tempora minima unde aliquid ea culpa sunt.
						Reiciendis quia dolorum ducimus unde.</p>
				</div>
				<div class="col-md-6">
					<img class="img-responsive" src="http://placehold.it/700x450"
						alt="">
				</div>
			</div>
			<!-- /.row -->

			<hr>

			<!-- Call to Action Section -->
			<div class="well">
				<div class="row">
					<div class="col-md-8">
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Molestias, expedita, saepe, vero rerum deleniti beatae veniam
							harum neque nemo praesentium cum alias asperiores commodi.</p>
					</div>
					<div class="col-md-4">
						<a class="btn btn-lg btn-default btn-block" href="#">Call to
							Action</a>
					</div>
				</div>
			</div>

			<hr>

			<!-- Footer -->
			<footer>
				<div class="row">
					<div class="col-lg-12">
						<p>Copyright &copy; Your Website 2014</p>
					</div>
				</div>
			</footer>

		</div>
		<!-- /.container -->

		<!-- jQuery -->
		<script src="js/jquery.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="js/bootstrap.min.js"></script>

		<!-- Script to Activate the Carousel -->
		<script>
			$('.carousel').carousel({
				interval : 5000
			//changes the speed
			})
		</script>
</body>

</html>
