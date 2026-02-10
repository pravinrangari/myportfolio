 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Add Service</title>

<!-- ✅ Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- ✅ FontAwesome for icons -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

<style>
    body {
        background: #eef2f7;
        font-family: 'Segoe UI', sans-serif;
    }
    .container {
        max-width: 700px;
        margin-top: 60px;
    }
    .card {
        border-radius: 18px;
        border: none;
        box-shadow: 0 8px 20px rgba(0,0,0,0.08);
    }
    .card-header {
        background: linear-gradient(135deg, #007bff, #6610f2);
        color: #fff;
        border-radius: 18px 18px 0 0;
        text-align: center;
        padding: 25px;
    }
    .card-header h3 {
        margin: 0;
        font-weight: bold;
    }
    .form-label {
        font-weight: 600;
    }
    .btn-custom {
        background: linear-gradient(135deg, #007bff, #6610f2);
        border: none;
        color: white;
        font-weight: bold;
        transition: 0.3s;
        border-radius: 10px;
    }
    .btn-custom:hover {
        background: linear-gradient(135deg, #6610f2, #007bff);
        transform: scale(1.05);
    }
    .alert {
        border-radius: 12px;
    }
</style>
</head>
<body>

<!-- ✅ Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="#">Portfolio Admin</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/client/home">
                        <i class="fas fa-home"></i> Client Home
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/home">
                        <i class="fas fa-cog"></i> Admin Home
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- ✅ Form Card -->
<div class="container">
    <div class="card">
        <div class="card-header">
            <h3><i class="fas fa-plus-circle"></i> Add New Service</h3>
        </div>
        <div class="card-body p-4">

            <!-- ✅ Success Message -->
            <c:if test="${not empty success}">
                <div class="alert alert-success">
                    <i class="fas fa-check-circle"></i> ${success}
                </div>
            </c:if>

            <!-- ✅ Error Message -->
            <c:if test="${not empty result}">
                <div class="alert alert-danger">
                    <i class="fas fa-exclamation-circle"></i> ${result}
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/admin/addService" 
                  method="post" enctype="multipart/form-data">

                <!-- Title -->
                <div class="mb-3">
                    <label class="form-label">Service Title</label>
                    <input type="text" name="title" class="form-control" 
                           value="${serviceDto.title}" placeholder="Enter title">
                    <c:forEach var="err" items="${errors}">
                        <c:if test="${err.field == 'title'}">
                            <small class="text-danger"><i class="fas fa-info-circle"></i> ${err.defaultMessage}</small>
                        </c:if>
                    </c:forEach>
                </div>

                <!-- Description -->
                <div class="mb-3">
                    <label class="form-label">Description</label>
                    <textarea name="description" class="form-control" rows="4"
                              placeholder="Enter description">${serviceDto.description}</textarea>
                    <c:forEach var="err" items="${errors}">
                        <c:if test="${err.field == 'description'}">
                            <small class="text-danger"><i class="fas fa-info-circle"></i> ${err.defaultMessage}</small>
                        </c:if>
                    </c:forEach>
                </div>

                <!-- File Upload -->
                <div class="mb-3">
                    <label class="form-label">Upload File</label>
                    <input type="file" name="serviceFile" class="form-control" accept=".jpg,.png,.pdf">
                    <c:if test="${not empty fileError}">
                        <small class="text-danger"><i class="fas fa-exclamation-triangle"></i> ${fileError}</small>
                    </c:if>
                </div>

                <!-- Buttons -->
                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-custom px-4 me-2">
                        <i class="fas fa-save"></i> Save
                    </button>
                    <a href="${pageContext.request.contextPath}/admin/home" class="btn btn-secondary px-4">
                        <i class="fas fa-arrow-left"></i> Cancel
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- ✅ Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
 