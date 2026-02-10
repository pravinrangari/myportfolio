 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Update Service</title>

<!-- ✅ Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- ✅ FontAwesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

<style>
    body { background: #eef2f7; font-family: 'Segoe UI', sans-serif; }
    .container { max-width: 700px; margin-top: 60px; }
    .card { border-radius: 18px; border: none; box-shadow: 0 8px 20px rgba(0,0,0,0.08); }
    .card-header { background: linear-gradient(135deg, #007bff, #6610f2); color: #fff; border-radius: 18px 18px 0 0; text-align: center; padding: 25px; }
    .card-header h3 { margin: 0; font-weight: bold; }
    .btn-custom { background: linear-gradient(135deg, #007bff, #6610f2); border: none; color: white; font-weight: bold; border-radius: 10px; transition: 0.3s; }
    .btn-custom:hover { background: linear-gradient(135deg, #6610f2, #007bff); transform: scale(1.05); }
</style>
</head>
<body>

<!-- ✅ Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="#">Portfolio Admin</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/client/home"><i class="fas fa-home"></i> Client Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/home"><i class="fas fa-cog"></i> Admin Home</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="card">
        <div class="card-header"><h3>Update Service</h3></div>
        <div class="card-body">

            <!-- ✅ Flash Messages -->
            <c:if test="${not empty message}">
                <div class="alert alert-success">${message}</div>
            </c:if>
            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>

            <form action="${pageContext.request.contextPath}/admin/updateService"
                  method="post" enctype="multipart/form-data">

                <!-- Hidden Fields -->
                <input type="hidden" name="id" value="${service.id}">
                <input type="hidden" name="oldFileName" value="${service.filename}">

                <!-- Title -->
                <div class="mb-3">
                    <label class="form-label">Service Title</label>
                    <input type="text" name="title" value="${service.title}" class="form-control" required>
                </div>

                <!-- Description -->
                <div class="mb-3">
                    <label class="form-label">Description</label>
                    <textarea name="description" rows="3" class="form-control" required>${service.description}</textarea>
                </div>

                <!-- ✅ Current Image -->
                <div class="mb-3 text-center">
                    <label class="form-label">Current Image</label><br>
                    <c:choose>
                        <c:when test="${not empty service.filename}">
                            <img src="${pageContext.request.contextPath}/img/services/${service.filename}" 
                                 alt="Service Image" class="img-thumbnail" width="180"
                                 onerror="this.src='${pageContext.request.contextPath}/images/no-image.png'">
                        </c:when>
                        <c:otherwise>
                            <img src="${pageContext.request.contextPath}/images/no-image.png" 
                                 alt="No Image" class="img-thumbnail" width="180">
                        </c:otherwise>
                    </c:choose>
                </div>

                <!-- Upload New Image -->
                <div class="mb-3">
                    <label class="form-label">Upload New Image</label>
                    <input type="file" name="serviceFile" class="form-control">
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-custom">Update</button>
                    <a href="${pageContext.request.contextPath}/admin/readAllServices" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
 