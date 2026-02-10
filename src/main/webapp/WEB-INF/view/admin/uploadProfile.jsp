 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Upload Profile Picture</title>
    <style>
        /* ===== Global Reset ===== */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(120deg, #74ebd5, #ACB6E5);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* ===== Navigation Bar ===== */
        .navbar {
            width: 100%;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            padding: 15px 40px;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.15);
        }

        .navbar a {
            color: #fff;
            text-decoration: none;
            margin-left: 25px;
            font-weight: 500;
            font-size: 16px;
            transition: 0.3s ease;
        }

        .navbar a:hover {
            color: #ffdf5d;
            transform: scale(1.1);
        }

        /* ===== Container ===== */
        .container {
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.2);
            text-align: center;
            width: 420px;
            animation: fadeIn 0.8s ease;
        }

        h2, h3 {
            color: #333;
            margin-bottom: 15px;
        }

        /* ===== Form ===== */
        form {
            margin-top: 15px;
            text-align: left;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
            color: #444;
        }

        input[type="file"] {
            padding: 10px;
            margin-bottom: 18px;
            width: 100%;
            border: 1px solid #bbb;
            border-radius: 10px;
            background: #f9f9f9;
            cursor: pointer;
        }

        input[type="submit"] {
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            color: #fff;
            padding: 12px 25px;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            font-weight: bold;
            transition: all 0.3s;
            display: block;
            width: 100%;
        }

        input[type="submit"]:hover {
            background: linear-gradient(135deg, #2575fc, #6a11cb);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        }

        /* ===== Profile Frame ===== */
        .profile-frame {
            width: 180px;
            height: 180px;
            border-radius: 50%;
            padding: 6px;
            background: linear-gradient(135deg, #ff6a00, #ee0979);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 20px auto;
            box-shadow: 0 4px 20px rgba(0,0,0,0.25);
            transition: transform 0.3s ease;
        }

        .profile-frame:hover {
            transform: scale(1.05);
        }

        .profile-frame img {
            width: 160px;
            height: 160px;
            border-radius: 50%;
            object-fit: cover;
            border: 5px solid #fff;
        }

        .message {
            margin-top: 10px;
            color: green;
            font-weight: bold;
            text-align: center;
        }

        /* ===== Animation ===== */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(15px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

    <!-- Navigation -->
    <div class="navbar">
        <a href="${pageContext.request.contextPath}/client/home">🏠 Client Panel</a>
        <a href="${pageContext.request.contextPath}/admin/home">👨‍💼 Admin Panel</a>
    </div>

    <!-- Upload Profile Section -->
    <div class="container">
        <h2>Upload Profile Picture</h2>
        <p class="message">${result}</p>

        <form action="${pageContext.request.contextPath}/admin/uploadProfile" 
              method="post" enctype="multipart/form-data">
            <label for="profile">Choose Profile Picture:</label>
            <input type="file" name="profile" id="profile" accept=".jpg,.jpeg,.png" required>
            <input type="submit" value="Upload">
        </form>

        <h3>Current Profile Picture</h3>
        <div class="profile-frame">
            <img src="${pageContext.request.contextPath}/img/banner/profile.jpg" alt="Profile Picture">
        </div>
    </div>

</body>
</html>
 