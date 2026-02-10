 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="about_area section_gap" id="about">
  <div class="container">
    <div class="row align-items-center">
      
      <!-- 👤 Profile Image -->
      <div class="col-lg-5 col-md-6 text-center mb-4 mb-lg-0">
        <div class="about_img position-relative">
          <img src="${pageContext.request.contextPath}/img/about-us.png" alt="About Me"
            class="img-fluid rounded-circle shadow-lg"
            style="max-width: 80%; border: 8px solid #fff; background: linear-gradient(135deg, #f5f7fa, #c3cfe2);">
        </div>
      </div>

      <!-- 💬 About Content -->
      <div class="col-lg-7 col-md-6">
        <div class="main_title text-left">
          <h2 class="text-uppercase mb-4" style="font-weight: 800; color: #2b2d42;">
            Let’s<br>Introduce About<br>Myself
          </h2>

          <!-- ✅ Dynamic About Text -->
          <c:forEach var="intro" items="${aboutIntroList}">
            <p style="font-size: 16px; color: #555; line-height: 1.8;">
              ${intro.firstPara}
            </p>
            <p style="font-size: 16px; color: #555; line-height: 1.8;">
              ${intro.secondPara}
            </p>
          </c:forEach>

          <!-- 📄 Resume Download Button -->
          <a class="primary_btn mt-4 d-inline-block"
             href="${pageContext.request.contextPath}/client/downloadResume"
             style="padding: 10px 25px; border-radius: 30px; font-weight: 600; background: linear-gradient(90deg, #007bff, #00d4ff); color: #fff;">
            <span>Download CV</span>
          </a>
        </div>
      </div>
    </div>
  </div>
</section>
 