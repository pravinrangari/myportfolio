 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage About Intro</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">Manage About Intro</h2>

        <!-- ✅ Flash message -->
        <c:if test="${not empty result}">
            <div class="alert alert-info">${result}</div>
        </c:if>

        <table class="table table-bordered table-hover align-middle">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>First Paragraph</th>
                    <th>Second Paragraph</th>
                    <th style="width:180px;">Actions</th>
                </tr>
            </thead>
            <tbody>
               <c:forEach var="intro" items="${aboutIntroList}">
    <tr>
        <td>${intro.id}</td>
        <td>${intro.firstPara}</td>
        <td>${intro.secondPara}</td>
        <td>
            <a href="${pageContext.request.contextPath}/admin/updateAbountIntro/${intro.id}" 
               class="btn btn-sm btn-warning">✏️ Update</a>
            <a href="${pageContext.request.contextPath}/admin/deleteAbountIntro/${intro.id}" 
               class="btn btn-sm btn-danger"
               onclick="return confirm('Are you sure you want to delete this intro?');">🗑️ Delete</a>
        </td>
    </tr>
</c:forEach>


                <!-- If no records -->
                <c:if test="${empty aboutIntroList}">
                    <tr>
                        <td colspan="4" class="text-center text-muted">No About Intro records found</td>
                    </tr>
                </c:if>
            </tbody>
        </table>

        <!-- ✅ Add New About Intro -->
        <a href="${pageContext.request.contextPath}/admin/addAbountIntro" class="btn btn-success">➕ Add New Intro</a>
    </div>
</body>
</html>
 