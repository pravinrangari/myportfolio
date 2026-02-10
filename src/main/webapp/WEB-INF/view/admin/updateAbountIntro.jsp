<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update About Intro</title>
    <!-- ✅ Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
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

            <!-- ✅ Update Card -->
            <div class="card shadow-lg border-0 rounded-3">
                <div class="card-header bg-primary text-white text-center">
                    <h4 class="mb-0">✏️ Update About Intro</h4>
                </div>

                <div class="card-body p-4">
                    <form action="${pageContext.request.contextPath}/admin/updateAbountIntro" method="post">
                        <input type="hidden" name="id" value="${intro.id}" />

                        <!-- First Para -->
                        <div class="mb-3">
                            <label class="form-label">📝 First Paragraph</label>
                            <textarea class="form-control" name="firstPara" rows="3" required>${intro.firstPara}</textarea>
                        </div>

                        <!-- Second Para -->
                        <div class="mb-3">
                            <label class="form-label">📝 Second Paragraph</label>
                            <textarea class="form-control" name="secondPara" rows="3" required>${intro.secondPara}</textarea>
                        </div>

                        <!-- Buttons -->
                        <div class="d-flex justify-content-between">
                            <a href="${pageContext.request.contextPath}/admin/readAllAboutIntro" class="btn btn-secondary">⬅️ Cancel</a>
                            <button type="submit" class="btn btn-success">✅ Update</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- ✅ Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
