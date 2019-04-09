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
<link href="./Resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

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
</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-light bg-light ">

		<div class="row" style="width: 1080px;">
			<div class="col">
				<a class="navbar-brand"
					href="Main.jsp"><img
					src="./Resources/img/logo.png " width="70px" height="50px" />SSAFY</a>

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
					<div class=" col mb-2 mb-md-0 dropdown" style="float: left;"
						id="target">
						<button type="submit"
							class="btn btn-block btn-lg btn-primary caret dropdown-toggle"
							data-toggle="dropdown"
							style="height: 50px; color: blue; background-color: white;">식품정보</button>
						<ul class="dropdown-menu dropdownInfo" style="width: 250px;">
							<li><a href="foodList2.html">이름별</a></li>
							<li><a href="foodList2.html">제조사별</a></li>

						</ul>

					</div>
					<div class=" col mb-2 mb-md-0 dropdown" style="float: left;"
						id="target">
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
							<a href="Change.html" type="submit" class="btn btn-block btn-lg btn-primary">회원 정보 수정</a>
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
	<header class="masthead text-white text-center"
		style="height: 550px; width: 350px; margin: 0 auto;">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-xl-9 mx-auto">
					<h2 class="mb-5 mx-auto mb-5 mb-lg-0 mb-lg-3">정보수정</h2>
					<br /> <br />

				</div>
				<form action="main.do" methon="post">
					<div class="form-row" style="margin: 0 0 10px 0;">
						<div class="col" class="form-control form-control-lg"
							style="font-size: 16px; margin: 0 10px 0 30px;">아이디 :</div>
						<div class="col">
							<input type="text" class="form-control form-control-lg"
								placeholder="아이디를 입력하세요"
								style="width: 200px; margin: 0 10 0 50;" name="uid">
						</div>
					</div>
					<div class="form-row" style="margin: 0 0 10px 0;">
						<div class="col" class="form-control form-control-lg"
							style="font-size: 16px; margin: 0 10px 0 30px;">비밀번호 :</div>
						<div class="col">
							<input type="password" class="form-control form-control-lg"
								placeholder="비밀번호를 입력하세요"
								style="width: 200px; margin: 0 10 0 50;" name="upw">
						</div>
					</div>
					<div class="form-row" style="margin: 0 0 10px 0;">
						<div class="col" class="form-control form-control-lg"
							style="font-size: 16px; margin: 0 10px 0 30px;">이름 :</div>
						<div class="col">
							<input type="text" class="form-control form-control-lg"
								placeholder="이름을 입력하세요" style="width: 200px; margin: 0 10 0 50;" name="uname">
						</div>
					</div>
					<div class="form-row" style="margin: 0 0 20px 0;">



						<div class="col" class="form-control form-control-lg"
							style="font-size: 16px; margin: 0 10px 0 30px;">생년월일 :</div>
						<div class="col">
							<input type="date" class="form-control form-control-lg"
								placeholder="생년월일을 입력하세요" style="width: 200px; margin: 0 10 0 50;" name="ubirth">
						</div>
					</div>
					<div class="form-row" style="margin: 0 0 10px 0;">
						<div class="col" class="form-control form-control-lg"
							style="font-size: 16px; margin: 0 10px 0 30px;">성별 :</div>
						<div class="col">
							<input type="radio" name="gender" value="male"
								style="border-color: red; font-size: 14px;"> male
						</div>
						<div class="col">
							<input type="radio" name="gender" value="female"
								style="border-color: red; font-size: 14px;"> female
						</div>
					</div>
					<div class="form-row" style="margin: 0 0 10px 0;">
						<div class="col" class="form-control form-control-lg"
							style="font-size: 16px; margin: 0 10px 0 30px;">이메일 :</div>
						<div class="col">
							<input type="email" class="form-control form-control-lg"
								placeholder="example@qwer.ty"
								style="width: 200px; margin: 0 10 0 50;" name="uemail">
						</div>
					</div>
					<div class="form-row" style="margin: 0 0 10px 0;">
						<div class="col" class="form-control form-control-lg"
							style="font-size: 16px; margin: 0 10px 0 30px;">연락처 :</div>
						<div class="col">
							<input type="text" class="form-control form-control-lg"
								placeholder="번호만 입력하세요"
								style="width: 200px; margin: 0 10 0 50;" name="uphone">
						</div>
					</div>
					<br />
					<div class="form-row" style="margin: 20px 15px 50px 35px;">
						<div class="col">
							<input type="hidden" name="action" value="updateMember"/>
							<input type="submit" class="btn btn-block btn-lg btn-primary" value="수정"/>
							<br /> <br /> <br />
						</div>
						<div class="col">
							<input type="hidden" name="action" value="deleteMember"/>
							<input type="submit" class="btn btn-block btn-lg btn-primary" value="삭제"/>
							<br /> <br /> <br />
						</div>
					</div>



				</form>


			</div>
		</div>
	</header>





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
