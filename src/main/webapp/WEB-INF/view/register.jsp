 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Register</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #667eea, #764ba2);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .register-card {
        width: 450px;
        padding: 35px;
        border-radius: 20px;
        background: #fff;
        box-shadow: 0px 8px 25px rgba(0, 0, 0, 0.2);
    }
    .register-card h3 {
        font-weight: 600;
        text-align: center;
        margin-bottom: 25px;
    }
    .btn-custom {
        background: #667eea;
        color: white;
        font-weight: 500;
        border-radius: 10px;
        transition: 0.3s;
    }
    .btn-custom:hover {
        background: #5563c1;
    }
    .form-label {
        font-weight: 500;
    }
</style>
</head>
<body>

<div class="register-card">
    <h3>Register</h3>

    <!-- Display error messages -->
    <c:if test="${not empty error}">
        <div class="alert alert-danger text-center">${error}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/register" method="post">
        <div class="mb-3">
            <label class="form-label">Username</label>
            <input type="text" name="username" class="form-control" required placeholder="Enter username">
        </div>
        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" name="email" class="form-control" required placeholder="Enter email">
        </div>
        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control" required placeholder="Enter password">
        </div>
        <div class="mb-3">
            <label class="form-label">Confirm Password</label>
            <input type="password" name="confirmPassword" class="form-control" required placeholder="Confirm password">
        </div>
        <div class="mb-3">
            <label class="form-label">Role</label>
            <select name="role" class="form-select" required>
                <option value="" disabled selected>Select Role</option>
                <option value="ADMIN">Admin</option>
                <option value="MEMBER">Member</option>
            </select>
        </div>
        <button type="submit" class="btn btn-custom w-100">Register</button>
    </form>

    <div class="text-center mt-3">
        <small>Already have an account? <a href="${pageContext.request.contextPath}/client/mylogin">Login</a></small>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
 