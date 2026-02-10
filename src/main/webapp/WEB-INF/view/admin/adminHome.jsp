 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    
    <!-- FontAwesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

    <style>
        /* Reset */
        * { margin:0; padding:0; box-sizing:border-box; }

        body {
            font-family: 'Poppins', sans-serif;
            background: #f8f9fc;
            display: flex;
            min-height: 100vh;
        }

        /* Main content */
        .main {
            flex: 1;
            margin-left: 240px; /* width of sidebar */
            padding: 30px;
            overflow-y: auto;
        }

        .main h1 {
            font-size: 28px;
            margin-bottom: 30px;
            color: #333;
            position: sticky;
            top: 0;
            background: #f8f9fc;
            padding: 10px 0;
            z-index: 10;
        }

        /* Card grid */
        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 25px;
        }

        .card {
            background: #fff;
            border-radius: 16px;
            padding: 25px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            display: flex;
            flex-direction: column;
            align-items: center;
            transition: 0.3s;
            border-top: 4px solid transparent;
        }

        .card:hover {
            transform: translateY(-6px) scale(1.03);
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        }

        .card i {
            font-size: 28px;
            margin-bottom: 15px;
            color: #6a11cb;
            transition: 0.3s;
        }

        .card:hover i {
            transform: scale(1.2);
            color: #2575fc;
        }

        .card a {
            text-decoration: none;
            font-weight: 600;
            color: #333;
            transition: 0.3s;
            text-align: center;
        }

        .card a:hover {
            color: #6a11cb;
        }
    </style>
</head>
<body>

    <!-- Include reusable sidebar -->
 
<%@ include file="sidebar.jsp"%>

    <div class="main">
        <h1>👨‍💼 Welcome to Your Dashboard</h1>

        <div class="card-grid">
            <div class="card"><i class="fas fa-home"></i><a href="${pageContext.request.contextPath}/client/home">Client Home</a></div>
            <div class="card"><i class="fas fa-pen"></i><a href="${pageContext.request.contextPath}/admin/addAbountIntro">Add Introduction</a></div>
            <div class="card"><i class="fas fa-book-open"></i><a href="${pageContext.request.contextPath}/admin/readAllAboutIntro">Read Introduction</a></div>
            <div class="card"><i class="fas fa-address-book"></i><a href="${pageContext.request.contextPath}/admin/readAllContacts">View Contacts</a></div>
            <div class="card"><i class="fas fa-plus-circle"></i><a href="${pageContext.request.contextPath}/admin/addService">Add Services</a></div>
            <div class="card"><i class="fas fa-th-list"></i><a href="${pageContext.request.contextPath}/admin/readAllServices">View Services</a></div>
            <div class="card"><i class="fas fa-file-arrow-up"></i><a href="${pageContext.request.contextPath}/admin/uploadResume">Upload Resume</a></div>
            <div class="card"><i class="fas fa-user-circle"></i><a href="${pageContext.request.contextPath}/admin/uploadProfile">Profile</a></div>
            <div class="card"><i class="fas fa-sign-out-alt"></i><a href="${pageContext.request.contextPath}/logout">Logout</a></div>
        </div>
    </div>

</body>
</html>
 