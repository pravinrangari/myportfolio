
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Services</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<style>
body {
	background: linear-gradient(135deg, #d9e4f5, #f6f9fc);
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	min-height: 100vh;
}

.navbar-brand {
	font-weight: bold;
	font-size: 22px;
}

h2 {
	background: linear-gradient(90deg, #ff8a00, #e52e71);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

.card {
	border-radius: 20px;
	overflow: hidden;
	background: rgba(255, 255, 255, 0.15);
	backdrop-filter: blur(10px);
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
	transition: transform 0.4s ease, box-shadow 0.4s ease;
	animation: fadeIn 0.8s ease-in-out;
}

.card:hover {
	transform: translateY(-10px) scale(1.03);
	box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
}

.card-img-top {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

.card-title {
	font-size: 18px;
	font-weight: 600;
	text-align: center;
	color: #fff;
	color: black
}

.card-text {
	font-size: 14px;
	text-align: center;
	color: #f1f1f1;
	color: black
}

.btn {
	border-radius: 25px;
	font-size: 13px;
	padding: 6px 18px;
	transition: all 0.3s ease;
}

.btn-danger {
	background: linear-gradient(135deg, #ff416c, #ff4b2b);
	border: none;
}

.btn-danger:hover {
	transform: scale(1.05);
	box-shadow: 0 4px 15px rgba(255, 65, 108, 0.5);
}

.btn-primary {
	background: linear-gradient(135deg, #36d1dc, #5b86e5);
	border: none;
}

.btn-primary:hover {
	transform: scale(1.05);
	box-shadow: 0 4px 15px rgba(54, 209, 220, 0.5);
}

@
keyframes fadeIn {from { opacity:0;
	transform: translateY(20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}
}
</style>
</head>
<body>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">⚡ My Portfolio</a>
			<div class="d-flex">
				<a href="${pageContext.request.contextPath}/client/home"
					class="btn btn-outline-light btn-sm me-2">🏠 Client Home</a> <a
					href="${pageContext.request.contextPath}/admin/home"
					class="btn btn-warning btn-sm">👨‍💼 Admin Home</a>
			</div>
		</div>
	</nav>

	<div class="container mt-5">
		<h2 class="text-center mb-4 fw-bold">✨ Our Services ✨</h2>

		<!-- Flash messages -->
		<c:if test="${not empty success}">
			<div class="alert alert-success text-center">${success}</div>
		</c:if>
		<c:if test="${not empty error}">
			<div class="alert alert-danger text-center">${error}</div>
		</c:if>


		<div class="row g-4">

			<c:forEach var="service" items="${listofService}">
				<div class="col-lg-3 col-md-4 col-sm-6 d-flex">
					<div class="card flex-fill">
						<img class="card-img-top"
							src="${pageContext.request.contextPath}/img/services/${service.filename}"
							alt="${service.title}">
						<div class="card-body d-flex flex-column">
							<h5 class="card-title">${service.title}</h5>
							<p class="card-text">${service.description}</p>
							<div class="d-flex justify-content-center mt-3">

								<!-- Delete Button -->
								<a
									href="${pageContext.request.contextPath}/admin/deleteService?id=${service.id}&filename=${service.filename}"
									class="btn btn-danger btn-sm me-2"
									onclick="return confirm('Are you sure you want to delete ${service.filename}?');">
									Delete </a>

								<!-- Update Button -->
								<a
									href="${pageContext.request.contextPath}/admin/updateService?id=${service.id}"
									class="btn btn-primary btn-sm"> Update </a>

							</div>

						</div>
					</div>
				</div>
			</c:forEach>


		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>