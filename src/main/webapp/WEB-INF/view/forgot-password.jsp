 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Forgot Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea, #764ba2);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .forgot-card {
            width: 400px;
            padding: 30px;
            border-radius: 20px;
            background: #fff;
            box-shadow: 0px 8px 25px rgba(0, 0, 0, 0.2);
        }
        .btn-custom {
            background: #667eea;
            color: white;
        }
        .btn-custom:hover {
            background: #5563c1;
        }
    </style>
</head>
<body>

<div class="forgot-card">
    <h3 class="text-center mb-3">Forgot Password</h3>

    <c:if test="${not empty error}">
        <div class="alert alert-danger text-center">${error}</div>
    </c:if>
    <c:if test="${not empty success}">
        <div class="alert alert-success text-center">${success}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/forgot-password" method="post">
        <div class="mb-3">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" class="form-control" 
                   required placeholder="Enter your email">
        </div>
        <button type="submit" class="btn btn-custom w-100">Send Reset Link</button>
    </form>
</div>

</body>
</html>
 