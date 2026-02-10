 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Upload Resume</title>
</head>
<body>

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

    <h2>Upload Resume</h2>
    
           ${result}
    <form action="uploadResume" method="post" enctype="multipart/form-data">
        

        <label for="resume">Choose Resume:</label><br>
        <input type="file" name="resume" id="resume" accept=".pdf" required><br><br>

        <input type="submit" value="Upload">
    </form>
</body>
</html>
 