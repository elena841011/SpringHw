<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Verti by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="<c:url value='/assets/css/main.css' />" />
</head>
<body class="is-preload no-sidebar">
	<div id="page-wrapper">

		<!-- Header -->
		<div id="header-wrapper">
			<header id="header" class="container">

				<!-- Logo -->
				<div id="logo">
					<h1>
						<a href="<c:url value='/' />">I Podcast</a>
					</h1>
					<span>by group 3</span>
				</div>

				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li><a href="<c:url value='/kevin' />">普通用戶</a></li>
						<li class="current"><a href="<c:url value='/catio' />">Podcaster</a></li>
						<li><a href="<c:url value='/gavin' />">資源共享</a></li>
						<li><a href="<c:url value='/bill' />">線下活動</a></li>
						<li><a href="<c:url value='/wayne' />">廣告</a></li>
						<li><a href="<c:url value='/ben' />">論壇</a></li>

					</ul>
				</nav>
			</header>
		</div>

		<!-- Main -->
		<div id="main-wrapper">
			<div class="container">
				<div id="content">
					<!-- Content -->
					<form id="demoForm">
						
						
						<label for="demoCol1">欄1:</label>
						<input type="text" id="demoCol1" name="col1" />
						<button type="button" id="btnCheck">檢查唯一</button>
						<span id="checkMsg"></span>
						<br/>
						
						<label for="demoCol2">欄2:</label>
						<input type="text" id="demoCol2" name="col2" />
						<br/>
						
						<label for="demoDate">日期:</label>
						<input type="date" id="demoDate" name="date" />
						<br/>
						
						<button type="button" id="btnRegister">新增</button>
						<span id="regMsg"></span>
						
					</form>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<div id="footer-wrapper">
			<footer id="footer" class="container">
				<div class="row">
					<div class="col-3 col-6-medium col-12-small">

						<!-- Links -->
						<section class="widget links">
							<h3>組長</h3>
							<ul class="style2">
								<li><a href="#">19 張大品</a></li>

							</ul>
						</section>

					</div>
					<div class="col-3 col-6-medium col-12-small">

						<!-- Links -->
						<section class="widget links">
							<h3>技術長</h3>
							<ul class="style2">
								<li><a href="#">33 廖帝凱</a></li>
							</ul>
						</section>

					</div>
					<div class="col-3 col-6-medium col-12-small">

						<!-- Links -->
						<section class="widget links">
							<h3>組員</h3>
							<ul class="style2">
								<li><a href="#">32 洪豪均</a></li>
								<li><a href="#">10 陳宣佑</a></li>
								<li><a href="#">21 許佳崴</a></li>
								<li><a href="#">37 程偉勝</a></li>

							</ul>
						</section>

					</div>
					<div class="col-3 col-6-medium col-12-small">

						<!-- Contact -->
						<section class="widget contact last">
							<h3>Contact Us</h3>
							<ul>
								<li><a href="#" class="icon brands fa-twitter"><span
										class="label">Twitter</span></a></li>
								<li><a href="#" class="icon brands fa-facebook-f"><span
										class="label">Facebook</span></a></li>
								<li><a href="#" class="icon brands fa-instagram"><span
										class="label">Instagram</span></a></li>
								<li><a href="#" class="icon brands fa-dribbble"><span
										class="label">Dribbble</span></a></li>
								<li><a href="#" class="icon brands fa-pinterest"><span
										class="label">Pinterest</span></a></li>
							</ul>

						</section>

					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div id="copyright">
							<ul class="menu">
								<li>&copy; Untitled. All rights reserved</li>
								<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
							</ul>
						</div>
					</div>
				</div>
			</footer>
		</div>

	</div>

	<!-- Scripts -->

	<script src="<c:url value='/assets/js/jquery.min.js' />"></script>
	<script src="<c:url value='/assets/js/jquery.dropotron.min.js' />"></script>
	<script src="<c:url value='/assets/js/browser.min.js' />"></script>
	<script src="<c:url value='/assets/js/breakpoints.min.js' />"></script>
	<script src="<c:url value='/assets/js/util.js' />"></script>
	<script src="<c:url value='/assets/js/main.js' />"></script>
	<script>
		$(function(){
			
			let ifExist = false;
			let successHtml = "<font color='green'>成功</font>";
			let failHtml = "<font color='red'>失敗</font>";
			let checkFirstHtml = "<font color='red'>請先檢查成功</font>";
			let warningHtml = "<font color='red'>系統發生錯誤</font>";
			let inputWarningHtml= "<font color='red'>不可為空白</font>"

			
			$("#btnCheck").on("click", function(){
	
				let checkData = $("#demoCol1").val();
				if(checkData==null || checkData==""){
					$("#checkMsg").html(inputWarningHtml);
				}else{
					
					$.ajax({
						method: "POST",
						url: "<c:url value='/catio/check'/>",
						data: JSON.stringify({"colName":"col1","field":checkData}),
						contentType: "application/json",
						dataType: "json",
						
					}).done(function(response){
						let msg = response.msg;
						
						switch(msg){
							case 1:
								ifExist=true;
								$("#checkMsg").html(successHtml);
								$("#regMsg").html("");
								break;
							case -1:
								ifExit=false;
								$("#checkMsg").html(failHtml);
								break;
							default:
								ifExit=false;
								$("#checkMsg").html(warningHtml);
						}
					});
				};
			});
			
			$("#btnRegister").on("click", function(){

				if(!ifExist){
					$("#regMsg").html(checkFirstHtml);
				}else{
					let formData = {};
					//.each=for迴圈
					//下面兩行是為了要讓formdata(INPUT)變成JSON形式
					$.each($("#demoForm").serializeArray(), function(index, field){
						formData[field.name] = field.value;
					})
					//上面兩行等於下面這行,
					//#demoCol1 -> 抓id, 不太會抓name, 因為name不唯一
// 					formData["col1"] =  $("#demoCol1").val();
// 					formData["col2"] =  $("#demoCol2").val();
// 					formData["col2"] =  $("#demoDate").val();
					
					$.ajax({
						method: "POST",
						url: "<c:url value='/catio/demo'/>",
						data: JSON.stringify(formData), // =send
						contentType: "application/json",
						dataType: "json",
						async: false,
					}).done(function(response){
						alert(response.msg);
						window.location.href ='<c:url value="/catio"/>';
					});
				}
				
			});
		})
	</script>


</body>
</html>