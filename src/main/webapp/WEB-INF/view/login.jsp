 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }
        .login-card {
            width: 400px;
            padding: 30px;
            border-radius: 20px;
            background: #fff;
            box-shadow: 0px 8px 25px rgba(0, 0, 0, 0.2);
        }
        .login-card h3 {
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
        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 5px rgba(102, 126, 234, 0.5);
        }
        .text-center a {
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
        }
        .text-center a:hover {
            color: #5563c1;
        }
    </style>
</head>
<body>

    <div class="login-card">
        <h3>Login</h3>

        <!-- Show error message if login fails -->
        <c:if test="${param.error != null}">
            <div class="alert alert-danger text-center">Invalid username or password</div>
        </c:if>

        <!-- Show logout message -->
        <c:if test="${param.logout != null}">
            <div class="alert alert-success text-center">You have been logged out successfully</div>
        </c:if>

        <!-- Login Form -->
        <form action="${pageContext.request.contextPath}/doLogin" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
               <input type="text" id="username" name="username" class="form-control" placeholder="Enter username" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" id="password" name="password" class="form-control" placeholder="Enter password" required>
            </div>
            <button type="submit" class="btn btn-custom w-100">Login</button>
        </form>

        <!-- Links -->
        <div class="text-center mt-3">
            <small>
                Don't have an account? <a href="${pageContext.request.contextPath}/register">Register</a>
            </small>
            <br>
            <small>
                <a href="${pageContext.request.contextPath}/forgot-password">Forgot Password?</a>
            </small>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
 