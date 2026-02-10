 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Access Denied</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #ff6b6b, #f06595);
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        color: #fff;
        text-align: center;
        overflow: hidden;
    }

    /* Floating background circles */
    body::before, body::after {
        content: '';
        position: absolute;
        border-radius: 50%;
        background: rgba(255, 255, 255, 0.1);
        animation: float 6s ease-in-out infinite alternate;
        z-index: 0;
    }
    body::before {
        width: 300px;
        height: 300px;
        top: -50px;
        left: -50px;
    }
    body::after {
        width: 400px;
        height: 400px;
        bottom: -100px;
        right: -100px;
        animation-duration: 8s;
    }

    @keyframes float {
        0% { transform: translateY(0) translateX(0); }
        100% { transform: translateY(-20px) translateX(20px); }
    }

    .container {
        position: relative;
        z-index: 1;
        background: rgba(0,0,0,0.6);
        padding: 50px 80px;
        border-radius: 20px;
        box-shadow: 0 15px 35px rgba(0,0,0,0.3);
        backdrop-filter: blur(5px);
        max-width: 500px;
        animation: pop 0.5s ease;
    }

    @keyframes pop {
        0% { transform: scale(0.8); opacity: 0; }
        100% { transform: scale(1); opacity: 1; }
    }

    h1 {
        font-size: 28px;
        margin-bottom: 25px;
        line-height: 1.4;
    }

    a {
        display: inline-block;
        margin-top: 20px;
        padding: 12px 25px;
        background: #fff;
        color: #f06595;
        font-weight: 600;
        text-decoration: none;
        border-radius: 10px;
        transition: 0.3s ease;
        box-shadow: 0 5px 15px rgba(0,0,0,0.2);
    }

    a:hover {
        background: #f06595;
        color: #fff;
        transform: translateY(-3px);
        box-shadow: 0 8px 20px rgba(0,0,0,0.3);
    }
</style>
</head>
<body>
<div class="container">
    <h1>🚫 You are not authorized to perform this operation!</h1>
    <a href="${pageContext.request.contextPath}/admin/home">Go Back to Admin Panel</a>
</div>
</body>
</html>
 