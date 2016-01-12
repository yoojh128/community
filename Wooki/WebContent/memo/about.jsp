<%@page import="vo.PappusMembership"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<title>Modern Business - Start Bootstrap Template</title>

<!-- Bootstrap Core CSS -->
<link href="css-rep/main/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css-rep/main/css/modern-business.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="css-rep/main/font-awesome/css/font-awesome.min.css"
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

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					About <small>Subheading</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li class="active">About</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Intro Content -->
		<div class="row">
			<div class="col-md-6">
				<img class="img-responsive" src="http://placehold.it/750x450" alt="">
			</div>
			<div class="col-md-6">
				<h2>About Modern Business</h2>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed
					voluptate nihil eum consectetur similique? Consectetur, quod,
					incidunt, harum nisi dolores delectus reprehenderit voluptatem
					perferendis dicta dolorem non blanditiis ex fugiat.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
					Saepe, magni, aperiam vitae illum voluptatum aut sequi impedit non
					velit ab ea pariatur sint quidem corporis eveniet. Odit, temporibus
					reprehenderit dolorum!</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et,
					consequuntur, modi mollitia corporis ipsa voluptate corrupti eum
					ratione ex ea praesentium quibusdam? Aut, in eum facere corrupti
					necessitatibus perspiciatis quis?</p>
			</div>
		</div>
		<!-- /.row -->

		<!-- Team Members -->
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">Our Team</h2>
			</div>
			<div class="col-md-4 text-center">
				<div class="thumbnail">
					<img class="img-responsive" src="http://placehold.it/750x450"
						alt="">
					<div class="caption">
						<h3>
							John Smith<br> <small>Job Title</small>
						</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Iste saepe et quisquam nesciunt maxime.</p>
						<ul class="list-inline">
							<li><a href="#"><i class="fa fa-2x fa-facebook-square"></i></a>
							</li>
							<li><a href="#"><i class="fa fa-2x fa-linkedin-square"></i></a>
							</li>
							<li><a href="#"><i class="fa fa-2x fa-twitter-square"></i></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-4 text-center">
				<div class="thumbnail">
					<img class="img-responsive" src="http://placehold.it/750x450"
						alt="">
					<div class="caption">
						<h3>
							John Smith<br> <small>Job Title</small>
						</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Iste saepe et quisquam nesciunt maxime.</p>
						<ul class="list-inline">
							<li><a href="#"><i class="fa fa-2x fa-facebook-square"></i></a>
							</li>
							<li><a href="#"><i class="fa fa-2x fa-linkedin-square"></i></a>
							</li>
							<li><a href="#"><i class="fa fa-2x fa-twitter-square"></i></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-4 text-center">
				<div class="thumbnail">
					<img class="img-responsive" src="http://placehold.it/750x450"
						alt="">
					<div class="caption">
						<h3>
							John Smith<br> <small>Job Title</small>
						</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Iste saepe et quisquam nesciunt maxime.</p>
						<ul class="list-inline">
							<li><a href="#"><i class="fa fa-2x fa-facebook-square"></i></a>
							</li>
							<li><a href="#"><i class="fa fa-2x fa-linkedin-square"></i></a>
							</li>
							<li><a href="#"><i class="fa fa-2x fa-twitter-square"></i></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-4 text-center">
				<div class="thumbnail">
					<img class="img-responsive" src="http://placehold.it/750x450"
						alt="">
					<div class="caption">
						<h3>
							John Smith<br> <small>Job Title</small>
						</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Iste saepe et quisquam nesciunt maxime.</p>
						<ul class="list-inline">
							<li><a href="#"><i class="fa fa-2x fa-facebook-square"></i></a>
							</li>
							<li><a href="#"><i class="fa fa-2x fa-linkedin-square"></i></a>
							</li>
							<li><a href="#"><i class="fa fa-2x fa-twitter-square"></i></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-4 text-center">
				<div class="thumbnail">
					<img class="img-responsive" src="http://placehold.it/750x450"
						alt="">
					<div class="caption">
						<h3>
							John Smith<br> <small>Job Title</small>
						</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Iste saepe et quisquam nesciunt maxime.</p>
						<ul class="list-inline">
							<li><a href="#"><i class="fa fa-2x fa-facebook-square"></i></a>
							</li>
							<li><a href="#"><i class="fa fa-2x fa-linkedin-square"></i></a>
							</li>
							<li><a href="#"><i class="fa fa-2x fa-twitter-square"></i></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-4 text-center">
				<div class="thumbnail">
					<img class="img-responsive" src="http://placehold.it/750x450"
						alt="">
					<div class="caption">
						<h3>
							John Smith<br> <small>Job Title</small>
						</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Iste saepe et quisquam nesciunt maxime.</p>
						<ul class="list-inline">
							<li><a href="#"><i class="fa fa-2x fa-facebook-square"></i></a>
							</li>
							<li><a href="#"><i class="fa fa-2x fa-linkedin-square"></i></a>
							</li>
							<li><a href="#"><i class="fa fa-2x fa-twitter-square"></i></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->

		<!-- Our Customers -->
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">Our Customers</h2>
			</div>
			<div class="col-md-2 col-sm-4 col-xs-6">
				<img class="img-responsive customer-img"
					src="http://placehold.it/500x300" alt="">
			</div>
			<div class="col-md-2 col-sm-4 col-xs-6">
				<img class="img-responsive customer-img"
					src="http://placehold.it/500x300" alt="">
			</div>
			<div class="col-md-2 col-sm-4 col-xs-6">
				<img class="img-responsive customer-img"
					src="http://placehold.it/500x300" alt="">
			</div>
			<div class="col-md-2 col-sm-4 col-xs-6">
				<img class="img-responsive customer-img"
					src="http://placehold.it/500x300" alt="">
			</div>
			<div class="col-md-2 col-sm-4 col-xs-6">
				<img class="img-responsive customer-img"
					src="http://placehold.it/500x300" alt="">
			</div>
			<div class="col-md-2 col-sm-4 col-xs-6">
				<img class="img-responsive customer-img"
					src="http://placehold.it/500x300" alt="">
			</div>
		</div>
		<!-- /.row -->

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

</body>

</html>