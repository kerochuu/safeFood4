<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ssafy.vo.Food"%>
<!DOCTYPE html>
<html lang="en">

<head>
<%
	Food food = null;
	food = (Food) request.getAttribute("food");
%>



<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="Stylesheet" href="css/bootstrap.min.css" />
<meta charset="utf-8">
<!-- <meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->
<meta name="description" content="">
<meta name="author" content="">

<title>SSAFY 4반 김준호☆박윤진</title>

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

<script src="./js/Chart.bundle.js"></script>
<script src="./js/utils.js"></script>
<script>
	$(function() {
		var code = localStorage.getItem("foodCode");
		var name;
		var image;
		var maker;
		var material;
		var daily;
		var calories;
		var carb;
		var protein;
		var fat;
		var sugar;
		var salt;
		var chol;
		var sat;
		var trans;

		$.ajax({
			type : "GET",
			url : "foodInfo.xml",
			dataType : "xml",
			success : function(xml) {
				var items = $(xml).find("food").filter(function() {
					return $(this).find('code').text() == code;
				});

				items.each(function() {
					name = $(this).find('name').text();
					maker = $(this).find('maker').text();
					material = $(this).find('material').text();
					image = $(this).find('image').text();
				});

				$("#name").text(name);
				$("#vender").text(maker);
				$("#materials").text(material);
				console.log(image);
				$("#productImg").attr("src", image);

			}

		});

		var cnt = 1;
		$.ajax({
			type : "GET",
			url : "FoodNutritionInfo.xml",
			dataType : "xml",
			success : function(xml) {
				$(xml).find("item").each(
						function() {
							if (cnt == parseInt(code)) {
								daily = $(this).find('SERVING_WT').text();
								calories = $(this).find('NUTR_CONT1').text();
								carb = $(this).find('NUTR_CONT2').text();
								protein = $(this).find('NUTR_CONT3').text();
								fat = $(this).find('NUTR_CONT4').text();
								sugar = $(this).find('NUTR_CONT5').text();
								salt = $(this).find('NUTR_CONT6').text();
								chol = $(this).find('NUTR_CONT7').text();
								sat = $(this).find('NUTR_CONT8').text();
								trans = $(this).find('NUTR_CONT9').text();

								var info = $("#nutritionInfo").append(
										"<div class='container'></div>");
								var row = $("<div class='row'></div>");
								$("<div class='col-6'></div>").text("일일 제공량")
										.appendTo(row);
								$("<div class='col-6'></div>").text(daily)
										.appendTo(row);
								row.appendTo(info);

								row = $("<div class='row'></div>");
								$("<div class='col-6'></div>").text("칼로리")
										.appendTo(row);
								$("<div class='col-6'></div>").text(calories)
										.appendTo(row);
								row.appendTo(info);

								row = $("<div class='row'></div>");
								$("<div class='col-6'></div>").text("탄수화물")
										.appendTo(row);
								$("<div class='col-6'></div>").text(carb)
										.appendTo(row);
								row.appendTo(info);

								row = $("<div class='row'></div>");
								$("<div class='col-6'></div>").text("단백질")
										.appendTo(row);
								$("<div class='col-6'></div>").text(protein)
										.appendTo(row);
								row.appendTo(info);

								row = $("<div class='row'></div>");
								$("<div class='col-6'></div>").text("지방")
										.appendTo(row);
								$("<div class='col-6'></div>").text(fat)
										.appendTo(row);
								row.appendTo(info);

								row = $("<div class='row'></div>");
								$("<div class='col-6'></div>").text("당류")
										.appendTo(row);
								$("<div class='col-6'></div>").text(sugar)
										.appendTo(row);
								row.appendTo(info);

								row = $("<div class='row'></div>");
								$("<div class='col-6'></div>").text("나트륨")
										.appendTo(row);
								$("<div class='col-6'></div>").text(salt)
										.appendTo(row);
								row.appendTo(info);

								row = $("<div class='row'></div>");
								$("<div class='col-6'></div>").text("콜레스트롤")
										.appendTo(row);
								$("<div class='col-6'></div>").text(chol)
										.appendTo(row);
								row.appendTo(info);

								row = $("<div class='row'></div>");
								$("<div class='col-6'></div>").text("포화지방산")
										.appendTo(row);
								$("<div class='col-6'></div>").text(sat)
										.appendTo(row);
								row.appendTo(info);

								row = $("<div class='row'></div>");
								$("<div class='col-6'></div>").text("트랜스지방산")
										.appendTo(row);
								$("<div class='col-6'></div>").text(trans)
										.appendTo(row);
								row.appendTo(info);
							}
							cnt += 1;
						});

			}
		});

	})

	var randomScalingFactor = function() {
		return Math.round(Math.random() * 100);
	};

	var config = {
		type : 'pie',
		data : {
			datasets : [ {
					
				data : [ 
					${food.calories},
					${food.carb},
					${food.protein},
					${food.fat},
					${food.sugar},
					${food.salt},
					${food.chol},
					${food.sat},
					${food.trans}
				]
			
		
			} ],
			labels : [ 'Red', 'Orange', 'Yellow', 'Green', 'Blue', 'Black', 'White', 'Purple', 'Gray' ]
		},
		options : {
			responsive : true
		}
	};

	window.onload = function() {
		var ctx = document.getElementById('chart-area').getContext('2d');
		window.myPie = new Chart(ctx, config);
	};



	
	
</script>

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-light bg-light ">

		<div class="row" style="width: 1080px;">
			<div class="col">
				<a class="navbar-brand" href="Main.html"><img
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
					<a href="Login.html" type="submit"
						class="btn btn-block btn-lg btn-primary">로그인</a> <a
						href="Join.html" type="submit"
						class="btn btn-block btn-lg btn-primary">회원가입</a>
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
					<h3 class="mb-5 mx-auto mb-5 mb-lg-0 mb-lg-3">4반 김준호☆영호쨩</h3>
					<br /> <br />
				</div>


				<div class="col-md-12 col-lg-12 col-xl-7 mx-auto">
					<form>

						<div class="form-row">
							<div class="col">

								<select class="form-control form-control-lg">
									<option value="상품명" selected="selected">상품명</option>
									<option value="제조사">제조사</option>
									<option value="원재료">원재료</option>
								</select>
							</div>
							<div class="col-8">
								<input type="search" class="form-control form-control-lg"
									placeholder="먹거리 검색">
							</div>
							<div class="col">
								<button type="submit" class="btn btn-block btn-lg btn-primary">검색하기!</button>
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
			<h2>제품 정보</h2>
			<!-- 아이콘넣기 -->


			<div class="row no-gutters">
				<div class="col-lg-3 text-white showcase-img"
					style="width: 600px; height: 400px; margin: 0 auto">
					<img id="productImg" src="" class="img-thumbnail"
						style="width: 600px; height: 400px; margin: 0 auto"></img>
				</div>
				<div class="col-lg-9 my-auto showcase-text">

					<div class="row no-gutters" style="margin: 0 0 30px 20px;">
						<div class="col-lg-3 my-auto showcase-text">
							<h2>제품명</h2>
						</div>
						<div class="col-lg-6 my-auto showcase-text">
							<h2 id="name">콘팡</h2>
						</div>
					</div>
					<div class="row no-gutters" style="margin: 0 0 30px 20px;">
						<div class="col-lg-3 my-auto showcase-text">
							<h2>제조사</h2>
						</div>
						<div class="col-lg-6 my-auto showcase-text">
							<h2 id="vender">포켓몬센터</h2>
						</div>
					</div>
					<div class="row no-gutters" style="margin: 0 0 30px 20px;">
						<div class="col-lg-3 my-auto showcase-text">
							<h2>원재료</h2>
						</div>
						<div class="col-lg-6 my-auto showcase-text">
							<h4 id="materials">귀여움</h4>
						</div>
					</div>
					<div class="row no-gutters">
						<div class="col-lg-3 my-auto showcase-text">
							<h2>알레르기성분</h2>
						</div>
						<div class="col-lg-6 my-auto showcase-text">
							<h2>콘팡</h2>
						</div>
					</div>
					<div class="row no-gutters" style="margin: 80px 0 0px 20px;">
						<div class="col-lg-6 my-auto showcase-text">
							<h2>수량</h2>
							<input type="number" min="0" placeholder="1">
						</div>
						<div class="col-lg-3 my-auto showcase-text">
							<button type="submit" class="btn btn-block btn-lg btn-primary">추가!</button>

						</div>
					</div>




				</div>
			</div>



		</div>
	</section>



	<!-- Image Showcases -->




	<section class="showcase">
		<div>
			<h2>영양정보</h2>

			<div class="row no-gutters">
				<div id="container"
					style="border: solid 1px black; width: 60%; height: 300px; margin-bottom: 10px;">
					<canvas id="chart-area"
						style="display: block; width: 198px; height: 99px;" width="198"
						height="99" class="chartjs-render-monitor"></canvas>
				</div>
				<div id="nutritionInfo" class="col my-auto showcase-text"></div>
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
						<h5>백준 아저씨</h5>
						<p class="font-weight-light mb-0">"여러분의 BFS는 진짜 BFS가 아닙니다"</p>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="testimonial-item mx-auto mb-5 mb-lg-0">
						<h5>황현승 프로님</h5>
						<p class="font-weight-light mb-0">"오늘은 특별히 2시에 가셔도 됩니다"</p>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="testimonial-item mx-auto mb-5 mb-lg-0">
						<h5>이재용 부사장</h5>
						<p class="font-weight-light mb-0">"SSAFY 4반 전부 특별채용하겠습니다"</p>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="testimonial-item mx-auto mb-5 mb-lg-0">
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
</body>

</html>
