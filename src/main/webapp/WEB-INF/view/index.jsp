
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon"
	href="${pageContext.request.contextPath}/img/favicon.ico"
	type="image/png">
<title>Pravin Portfolio</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendors/linericon/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendors/nice-select/css/nice-select.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">


</head>

<body>

	<%@ include file="header.jsp"%>

	<!-- Home Banner -->
	<section class="home_banner_area">
		<div class="banner_inner">
			<div class="container">
				<div class="row">
					<div class="col-lg-7">
						<br>
						<div class="banner_content">
							<h3 class="text-uppercase">Hello</h3>
							<h1 class="text-uppercase">I am Pravin</h1>
							<h5 class="text-uppercase">SOftware Developer</h5>
							<div class="d-flex align-items-center">
								<a class="primary_btn"
									href="${pageContext.request.contextPath}/client/contact"><span>Hire
										Me</span></a> <a class="primary_btn tr-bg"
									href="${pageContext.request.contextPath}/client/downloadResume"><span>Get
										CV</span></a>
							</div>
						</div>
					</div>
					<div class="col-lg-5">
						<div class="home_right_img">
							<div class="profile-circle">
								<img
									src="${pageContext.request.contextPath}/img/banner/a161aa56-cb07-4641-971c-06ca6b209868.jpg"
									alt="Pravin profile photo" loading="lazy" decoding="async">
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>

	<!-- About Area -->
	<section class="about_area section_gap">
		<div class="container">
			<div class="row justify-content-start align-items-center">
				<div class="col-lg-5">
					<div class="about_img">
						<img src="${pageContext.request.contextPath}/img/about-us.png"
							alt="About Us">
					</div>
				</div>
				<div class="offset-lg-1 col-lg-5">
					<div class="main_title text-left">
						<h2>
							let’s <br>Introduce about <br>myself
						</h2>

						<!-- ✅ Dynamic First Paragraph -->
						<c:forEach var="intro" items="${aboutIntroList}">
							<p>${intro.firstPara}</p>

							<!-- ✅ Dynamic Second Paragraph -->
							<p>${intro.secondPara}</p>
						</c:forEach>
						<!-- ✅ Download Resume -->
						<a class="primary_btn"
							href="${pageContext.request.contextPath}/client/downloadResume">
							<span>Download CV</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Brand Area -->
	<section class="brand_area section_gap_bottom">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<div class="row">
						<div class="col-lg-4 col-md-4 col-sm-6">
							<div class="single-brand-item d-table">
								<div class="d-table-cell text-center">
									<img
										src="${pageContext.request.contextPath}/img/brands/logo1.png"
										alt="">
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-6">
							<div class="single-brand-item d-table">
								<div class="d-table-cell text-center">
									<img
										src="${pageContext.request.contextPath}/img/brands/logo2.png"
										alt="">
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-6">
							<div class="single-brand-item d-table">
								<div class="d-table-cell text-center">
									<img
										src="${pageContext.request.contextPath}/img/brands/logo3.png"
										alt="">
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-6">
							<div class="single-brand-item d-table">
								<div class="d-table-cell text-center">
									<img
										src="${pageContext.request.contextPath}/img/brands/logo4.png"
										alt="">
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-6">
							<div class="single-brand-item d-table">
								<div class="d-table-cell text-center">
									<img
										src="${pageContext.request.contextPath}/img/brands/logo5.png"
										alt="">
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-6">
							<div class="single-brand-item d-table">
								<div class="d-table-cell text-center">
									<img
										src="${pageContext.request.contextPath}/img/brands/logo6.png"
										alt="">
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-6">
							<div class="single-brand-item d-table">
								<div class="d-table-cell text-center">
									<img
										src="${pageContext.request.contextPath}/img/brands/logo7.png"
										alt="">
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-6">
							<div class="single-brand-item d-table">
								<div class="d-table-cell text-center">
									<img
										src="${pageContext.request.contextPath}/img/brands/logo8.png"
										alt="">
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-6">
							<div class="single-brand-item d-table">
								<div class="d-table-cell text-center">
									<img
										src="${pageContext.request.contextPath}/img/brands/logo9.png"
										alt="">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="offset-lg-2 col-lg-4 col-md-6">
					<div class="client-info">
						<div class="d-flex mb-50">
							<span class="lage">6 </span> <span class="smll">Month  Intern Experience 
								 </span>
						</div>
						<div class="call-now d-flex">
							<div>
								<span class="fa fa-phone"></span>
							</div>
							<div class="ml-15">
								<p>call us now</p>
								<h3>(+91)-74-9938-2688</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Features Area -->
	<section class="features_area">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8 text-center">
					<div class="main_title">
						<h2>Service Offers</h2>
						<p>Is give may shall likeness made yielding spirit a itself
							together created after sea is in beast beginning signs open god
							you're gathering ithe</p>
					</div>
				</div>
			</div>


			<div class="row feature_inner">


				<c:forEach var="service" items="${listofService}" begin="0" end="3">
					<div class="col-lg-3 col-md-6">
						<div class="feature_item">
							<img class="card-img-top"
								style="width: 100%; height: 200px; object-fit: cover; border-radius: 12px 12px 0 0;"
								src="${pageContext.request.contextPath}/img/services/${service.filename}"
								alt="Sorry ">
							<h5 class="card-title text-center">${service.title}</h5>
							<p class="card-text text-muted text-center">${service.description}</p>
						</div>
					</div>
				</c:forEach>

			</div>

		</div>
	</section>

	<!-- Testimonial Area -->
	<div class="testimonial_area section_gap_bottom">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8 text-center">
					<div class="main_title">
						<h2>Teacher say about me</h2>
						<p>“They consistently demonstrate dedication, curiosity, and a
							strong work ethic. Their enthusiasm for learning and commitment
							to excellence make them truly stand out.”</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="testi_slider owl-carousel">
					<!-- Repeat testimonial items -->
					<div class="testi_item">
						<div class="row">
							<div class="col-lg-4">
								<img
									src="${pageContext.request.contextPath}/img/testimonials/t1.jpg"
									alt="">
							</div>
							<div class="col-lg-8">
								<div class="testi_text">
									<h4>Saif Sir</h4>
									<p>"He is a dedicated and enthusiastic learner, always
										eager to take on challenges and excel in his work. His
										commitment, creativity, and positive attitude make him stand
										out."</p>

								</div>
							</div>
						</div>
					</div>
					<div class="testi_item">
						<div class="row">
							<div class="col-lg-4">
								<img
									src="${pageContext.request.contextPath}/img/testimonials/t2.jpg"
									alt="">
							</div>
							<div class="col-lg-8">
								<div class="testi_text">
									<h4>Remio Sir</h4>
									<p>"He is hardworking, disciplined, and always eager to
										learn. His dedication and positive attitude make him a
										valuable student and a joy to teach."</p>

								</div>
							</div>
						</div>
					</div>
					<!-- Add more testimonial items as needed -->
				</div>
			</div>
		</div>
	</div>


	<%@ include file="footer.jsp"%>

	<!-- JS -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/popper.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/stellar.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/nice-select/js/jquery.nice-select.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/isotope/imagesloaded.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/isotope/isotope-min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/owl-carousel/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery.ajaxchimp.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/mail-script.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="${pageContext.request.contextPath}/js/gmaps.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/theme.js"></script>

</body>
</html>
