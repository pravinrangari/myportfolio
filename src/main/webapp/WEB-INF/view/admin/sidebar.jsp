 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="sidebar">
    <h2>Admin Panel</h2>
    <c:set var="context" value="${pageContext.request.contextPath}" />

    <a href="${context}/client/home"><i class="fas fa-home"></i> Client Home</a>
    <a href="${context}/admin/addAbountIntro"><i class="fas fa-pen"></i> Add Intro</a>
    <a href="${context}/admin/readAllAboutIntro"><i class="fas fa-book-open"></i> Read Intro</a>
    <a href="${context}/admin/readAllContacts"><i class="fas fa-address-book"></i> Contacts</a>
    <a href="${context}/admin/addService"><i class="fas fa-plus-circle"></i> Add Service</a>
    <a href="${context}/admin/readAllServices"><i class="fas fa-th-list"></i> View Services</a>
    <a href="${context}/admin/uploadResume"><i class="fas fa-file-arrow-up"></i> Upload Resume</a>
    <a href="${context}/admin/uploadProfile"><i class="fas fa-user-circle"></i> Profile</a>
    <a href="${context}/logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
</div>

<style>
/* Sidebar Styling */
.sidebar {
    width: 240px;
    background: linear-gradient(180deg, #6a11cb, #2575fc);
    color: #fff;
    display: flex;
    flex-direction: column;
    padding: 30px 20px;
    box-shadow: 2px 0 15px rgba(0,0,0,0.3);
    position: fixed;
    top: 0;
    left: 0;
    height: 100vh;
    overflow-y: auto;
}

.sidebar::-webkit-scrollbar {
    width: 8px;
}

.sidebar::-webkit-scrollbar-thumb {
    background: rgba(255,255,255,0.4);
    border-radius: 4px;
}

.sidebar a {
    color: #fff;
    text-decoration: none;
    margin: 12px 0;
    font-weight: 500;
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 10px;
    border-radius: 8px;
    transition: all 0.3s ease;
}

.sidebar a:hover {
    background: rgba(255,255,255,0.2);
    transform: translateX(6px);
}

.sidebar h2 {
    font-size: 22px;
    margin-bottom: 40px;
    text-align: center;
    text-shadow: 1px 1px 4px rgba(0,0,0,0.4);
}
</style>
 