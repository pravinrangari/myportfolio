 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Contacts</title>

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: #eef2f7;
        margin: 0;
        padding: 0;
    }

    .container {
        width: 95%;
        margin: 40px auto;
        background: #fff;
        padding: 25px;
        border-radius: 12px;
        box-shadow: 0 6px 20px rgba(0,0,0,0.1);
    }

    h1 {
        text-align: center;
        color: #222;
        margin-bottom: 20px;
        font-size: 28px;
    }

    .nav-links {
        margin-bottom: 25px;
        text-align: center;
    }

    .nav-links a {
        display: inline-block;
        margin: 0 12px;
        padding: 10px 20px;
        background: #007bff;
        color: #fff;
        text-decoration: none;
        border-radius: 6px;
        font-weight: 500;
        transition: all 0.3s ease-in-out;
    }

    .nav-links a:hover {
        background: #0056b3;
        transform: translateY(-2px);
    }

    table {
        width: 100%;
        border-collapse: collapse;
        overflow: hidden;
        border-radius: 10px;
    }

    thead {
        background: #007bff;
        color: white;
    }

    th, td {
        padding: 14px 18px;
        text-align: left;
        font-size: 15px;
    }

    tbody tr {
        background: #fafafa;
        transition: all 0.3s;
    }

    tbody tr:nth-child(even) {
        background: #f0f4f9;
    }

    tbody tr:hover {
        background: #dfe9f7;
        transform: scale(1.01);
    }

    .btn-delete {
        padding: 6px 14px;
        background: #e74c3c;
        color: white;
        border-radius: 6px;
        text-decoration: none;
        font-size: 14px;
        transition: all 0.3s;
    }

    .btn-delete:hover {
        background: #c0392b;
        transform: scale(1.05);
    }

    .message {
        text-align: center;
        color: green;
        margin-top: 15px;
        font-weight: bold;
    }
</style>
</head>
<body>

<div class="container">
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/client/home">🏠 Client Home</a>
        <a href="${pageContext.request.contextPath}/admin/home">👨‍💼 Admin Home</a>
    </div>

    <h1>📋 All Contact Records</h1>

    <c:if test="${not empty DeleteData}">
        <div class="message">${DeleteData}</div>
    </c:if>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>👤 Name</th>
                <th>📌 Subject</th>
                <th>💬 Message</th>
                <th>⏰ Date/Time</th>
                <th>⚡ Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="contact" items="${contactData}">
                <tr>
                    <td>${contact.id}</td>
                    <td>${contact.name}</td>
                    <td>${contact.subject}</td>
                    <td>${contact.message}</td>
                    <td>${contact.datetime}</td>
                    <td>
                        <a class="btn-delete" href="${pageContext.request.contextPath}/admin/deleteContactById?id=${contact.id}">
                            ❌ Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
 