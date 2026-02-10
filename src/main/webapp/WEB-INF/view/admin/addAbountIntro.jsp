<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>About Intro - Admin</title>
	<!-- ✅ Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

	<!-- ✅ Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
		<div class="container-fluid">
			<a class="navbar-brand fw-bold" href="#">⚡ My Portfolio</a>
			<div class="d-flex">
				<a href="${pageContext.request.contextPath}/client/home" class="btn btn-outline-light btn-sm me-2">🏠 Client Home</a>
				<a href="${pageContext.request.contextPath}/admin/home" class="btn btn-warning btn-sm">👨‍💼 Admin Home</a>
			</div>
		</div>
	</nav>

	<!-- ✅ Page Content -->
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-lg-6">

				<!-- ✅ Card -->
				<div class="card shadow-lg border-0 rounded-3">
					<div class="card-header bg-primary text-white text-center">
						<h4 class="mb-0">➕ Add About Intro</h4>
					</div>

					<div class="card-body p-4">
						<form action="${pageContext.request.contextPath}/admin/addAbountIntro" method="post">

							<!-- First Para -->
							<div class="mb-3">
								<label for="firstPara" class="form-label">📝 First Paragraph</label>
								<textarea class="form-control" id="firstPara" name="firstPara" rows="3" required>${addAboutDto.firstPara}</textarea>
								<c:if test="${not empty firstParaError}">
									<div class="text-danger small mt-1">${firstParaError}</div>
								</c:if>
							</div>

							<!-- Second Para -->
							<div class="mb-3">
								<label for="secondPara" class="form-label">📝 Second Paragraph</label>
								<textarea class="form-control" id="secondPara" name="secondPara" rows="3" required>${addAboutDto.secondPara}</textarea>
								<c:if test="${not empty secondParaError}">
									<div class="text-danger small mt-1">${secondParaError}</div>
								</c:if>
							</div>

							<!-- Submit -->
							<div class="d-grid">
								<button type="submit" class="btn btn-success btn-lg shadow-sm">✅ Save Intro</button>
							</div>
						</form>

						<!-- Flash Message -->
						<c:if test="${not empty result}">
							<div class="alert alert-success alert-dismissible fade show mt-3" role="alert">
								${result}
								<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
							</div>
						</c:if>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- ✅ Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
