ㄅ<%@ page language="java" contentType="text/html; charset=UTF-8"
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
					<a href="<c:url value='/catio/registry'/>">註冊</a>
					<table id="demoList">
						<tr>
							<th>編輯</th>
							<th>編號</th>
							<th>欄1</th>
							<th>欄2</th>
							<th>日期</th>
						</tr>
					</table>
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
			$.ajax({
				method: "GET",
				url: "<c:url value='/catio/demo'/>",
				dataType: "json",
			}).done(function(response){
				$.each(response, function(index, demoBean){
					appendTable(demoBean);
				})
			});
			
			function appendTable(bean){
					
				let id = bean.id;
				let uri = "<c:url value='/catio/demoEdit/'/>" + id;
					
				let temp = "<tr>";
				temp += "<td><a href='" + uri + "'>詳細</a></td>"
				temp += "<td>" + bean.id + "</td>"
				temp += "<td>" + bean.col1 + "</td>"
				temp += "<td>" + bean.col2 + "</td>"
				temp += "<td>" + bean.date + "</td>"
				temp += "</tr>";
					
				$("#demoList").append(temp);	
				
			}
			
		})
	</script>


</body>
</html>