<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="Stylesheet" href="css/bootstrap.min.css" />
<meta charset="utf-8">
<!-- <meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->
<meta name="description" content="">
<meta name="author" content="">

<title>SSAFY 4반 김준호☆박영호</title>

<!-- Bootstrap core CSS -->
<link href="Resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="./Resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<link
	href="./Resources/vendor/simple-line-icons/css/simple-line-icons.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- Custom styles for this template -->
<link href="./Resources/css/landing-page.min.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/FoodInfoDropDownSetting.js"></script>
<script>

$(function(){
	var sel='name';
	$("select").change(function(){
		sel = $("select option:selected").attr('value');
		console.log(sel);
	});
	
	var searchWord='default';
	$("#searchWord").change(function(){
		searchWord = $(this).val();
	})
	
})


</script>
</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-light bg-light ">

		<div class="row" style="width: 1080px;">
			<div class="col">
				<a class="navbar-brand"
					href="Main.jsp"><img
					src="./Resources/img/logo.png " width="80px" height="65px" /></a>

			</div>


			<div class="col-8">

				<div class='row'>

					<div class="navbar-header">
						<button class="navbar-toggle collapsed" data-toggle="collapse"
							data-target="#target">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>



					
					<div class="col mb-2 mb-md-0 ">
						<button type="submit"
							class="btn btn-block btn-lg btn-primary caret"
							style="height: 50px; color: blue; background-color: white;">공지사항</button>
					</div>
					<div class=" col mb-2 mb-md-0 dropdown" style="float: left;" id="target">
						<button type="submit"
							class="btn btn-block btn-lg btn-primary caret dropdown-toggle"
							data-toggle="dropdown"
							style="height: 50px; color: blue; background-color: white;">식품정보</button>
						<ul class="dropdown-menu dropdownInfo" style="width: 250px;">
							<li><a href="foodList2.html">이름별</a></li>
							<li><a href="foodList2.html">제조사별</a></li>

						</ul>

					</div>
					<div class=" col mb-2 mb-md-0 dropdown" style="float: left;" id="target">
						<button type="submit"
							class="btn btn-block btn-lg btn-primary caret dropdown-toggle"
							data-toggle="dropdown"
							style="height: 50px; color: blue; background-color: white;">음식추천</button>
						<ul class="dropdown-menu" style="width: 250px;">
							<li><a href="#">칼로리별</a></li>
							<li><a href="#">알레르기별</a></li>

						</ul>

					</div>
				
				</div>
			</div>


			<div class="col">
				<div class="col">
					<c:choose>
						<c:when test="${userId != null}">
							<a href="main.do?action=logout" type="submit" class="btn btn-block btn-lg btn-primary">로그아웃</a>
							<a href="Change.jsp" type="submit" class="btn btn-block btn-lg btn-primary">회원 정보 수정</a>
						</c:when>
						<c:otherwise>
							<a href="Login.jsp" type="submit" class="btn btn-block btn-lg btn-primary">로그인</a>
							<a href="Join.jsp" type="submit" class="btn btn-block btn-lg btn-primary">회원가입</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

		</div>
	</nav>
	<!-- Masthead -->
	<header class="masthead text-white text-center">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-xl-9 mx-auto">
					<h1 class="mb-5 mx-auto mb-5 mb-lg-0 mb-lg-3">안전먹거리 페어프로젝트!</h1>
					<h3 class="mb-5 mx-auto mb-5 mb-lg-0 mb-lg-3">4반 김준호☆박영호</h3>
					<br /> <br />
				</div>


				<div class="col-md-12 col-lg-12 col-xl-7 mx-auto">
					<form>

						<div class="form-row">
							<div class="col">

								<select id="selectSearch" class="form-control form-control-lg">
									<option value="name" selected="selected">상품명</option>
									<option value="maker">제조사</option>
									<option value="material">원재료</option>
								</select>
							</div>
							<div class="col-8">
								<input type="type" id="searchWord" class="form-control form-control-lg"
									placeholder="먹거리 검색">
							</div>
							<div class="col">
								<a type="submit" href="foodList2.html" id="search" class="btn btn-block btn-lg btn-primary">검색하기!</a>
							</div>

						</div>
					</form>
				</div>
			</div>
		</div>
	</header>

	<!-- Icons Grid -->
	<section class="features-icons bg-light text-center">
		<div class="container">
			
			
			<div class="row">
				<div class="col-lg-4">
					<div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
						<div class="features-icons-icon d-flex">
							<i class="icon-screen-desktop m-auto text-primary"></i>
						</div>
						<h3>모든 식품정보</h3>
						<p class="lead mb-0">대부분의 제품정보를 검색할 수 있습니다</p>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
						<div class="features-icons-icon d-flex">
							<i class="icon-layers m-auto text-primary"></i>
						</div>
						<h3>빠른 검색속도</h3>
						<p class="lead mb-0">최적화된 알고리즘으로 빠르게 결과를 출력합니다</p>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="features-icons-item mx-auto mb-0 mb-lg-3">
						<div class="features-icons-icon d-flex">
							<i class="icon-check m-auto text-primary"></i>
						</div>
						<h3>쉬운 사용성</h3>
						<p class="lead mb-0">설명서 없어도 쉽게 쓸 수 있습니다</p>
					</div>
				</div>
			</div>
		</div>
	</section>



	<!-- Image Showcases -->
	<section class="showcase">
		<div class="container-fluid p-0">
			<div class="row no-gutters">

				<div class="col-lg-6 order-lg-2 text-white showcase-img"
					style="background-image: url('Resources/img/bg-showcase-1.jpg');"></div>
				<div class="col-lg-6 order-lg-1 my-auto showcase-text">
					<h2>안전한 먹거리</h2>
					<p class="lead mb-0">각종 알레르기 정보 출력
				</div>
			</div>
			<div class="row no-gutters">
				<div class="col-lg-6 text-white showcase-img"
					style="background-image: url('Resources/img/bg-showcase-2.jpg');"></div>
				<div class="col-lg-6 my-auto showcase-text">
					<h2>개인별 최적화된 음식추천</h2>
					<p class="lead mb-0">먹으면 안되는 음식을 자동으로 출력
				</div>
			</div>
			<div class="row no-gutters">
				<div class="col-lg-6 order-lg-2 text-white showcase-img"
					style="background-image: url('Resources/img/bg-showcase-3.jpg');"></div>
				<div class="col-lg-6 order-lg-1 my-auto showcase-text">
					<h2>건강한 먹거리</h2>
					<p class="lead mb-0">식품별 영양소 함량 출력
				</div>
			</div>
		</div>
	</section>

	<!-- Testimonials -->
	<section class="testimonials text-center bg-light">
		<div class="container">
			<h2 class="mb-5">베스트 후기</h2>
			<div class="row">
				<div class="col-lg-3">
					<div class="testimonial-item mx-auto mb-5 mb-lg-0">
						<img class="img-fluid rounded-circle mb-3"
							src="Resources/img/testimonials-1.jpg" alt="">
						<h5>백준 아저씨</h5>
						<p class="font-weight-light mb-0">"여러분의 BFS는 진짜 BFS가 아닙니다"</p>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="testimonial-item mx-auto mb-5 mb-lg-0">
						<img class="img-fluid rounded-circle mb-3"
							src="img/testimonials-2.jpg" alt="">
						<h5>황현승 프로님</h5>
						<p class="font-weight-light mb-0">"오늘은 특별히 2시에 가셔도 됩니다"</p>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="testimonial-item mx-auto mb-5 mb-lg-0">
						<img class="img-fluid rounded-circle mb-3"
							src="img/testimonials-3.jpg" alt="">
						<h5>이재용 부사장</h5>
						<p class="font-weight-light mb-0">"SSAFY 4반 전부 특별채용하겠습니다"</p>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="testimonial-item mx-auto mb-5 mb-lg-0">
						<img class="img-fluid rounded-circle mb-3"
							src="img/testimonials-3.jpg" alt="">
						<h5>김태희 선생님</h5>
						<p class="font-weight-light mb-0">"오늘은 야외수업으로 진행합니다"</p>
					</div>
				</div>
			</div>
		</div>
	</section>



	<!-- Footer -->
	<footer class="footer bg-light">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 h-100 text-center text-lg-left my-auto">
					<ul class="list-inline mb-2">
						<li class="list-inline-item"><a href="#">About</a></li>
						<li class="list-inline-item">&sdot;</li>
						<li class="list-inline-item"><a href="#">Contact</a></li>
						<li class="list-inline-item">&sdot;</li>
						<li class="list-inline-item"><a href="#">Terms of Use</a></li>
						<li class="list-inline-item">&sdot;</li>
						<li class="list-inline-item"><a href="#">Privacy Policy</a></li>
					</ul>
					<p class="text-muted small mb-4 mb-lg-0">&copy; Samsung
						Software Academy For Youth. All Rights Reserved.</p>
				</div>
				<div class="col-lg-6 h-100 text-center text-lg-right my-auto">
					<ul class="list-inline mb-0">
						<li class="list-inline-item mr-3"><a href="#"> <i
								class="fab fa-facebook fa-2x fa-fw"></i>
						</a></li>
						<li class="list-inline-item mr-3"><a href="#"> <i
								class="fab fa-twitter-square fa-2x fa-fw"></i>
						</a></li>
						<li class="list-inline-item"><a href="#"> <i
								class="fab fa-instagram fa-2x fa-fw"></i>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
