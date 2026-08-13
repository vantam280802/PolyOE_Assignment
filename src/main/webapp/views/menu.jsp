<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
    /* ============ MODERN DARK THEME - MENU ============ */
    .header-top-bar {
        width: 100%;
        max-width: 900px;
        margin: 0 auto 20px auto;
        display: flex;
        justify-content: space-between;
        align-items: center;
        background: #1E293B; /* Nền tối */
        padding: 14px 28px;
        border-radius: 50px; /* Bo tròn viên thuốc giống ảnh 2 */
        box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.3);
        border: 1px solid #334155;
        color: #94A3B8;
        font-size: 14.5px;
        font-family: 'Inter', sans-serif;
    }

    .header-top-bar span {
        display: flex;
        align-items: center;
    }

    .header-top-bar strong { 
        color: #F8FAFC; 
        font-weight: 600; 
        margin-left: 6px; 
    }

    .admin-badge {
        background: linear-gradient(135deg, #F43F5E, #9F1239);
        color: white;
        font-size: 11px;
        font-weight: 800;
        padding: 3px 10px;
        border-radius: 20px;
        margin-left: 10px;
        letter-spacing: 0.5px;
    }

    .btn-logout-small {
        background: rgba(244, 63, 94, 0.1);
        color: #F43F5E;
        border: 1px solid #F43F5E;
        padding: 4px 14px;
        border-radius: 20px;
        text-decoration: none;
        font-weight: 600;
        font-size: 12px;
        margin-left: 15px;
        transition: all 0.3s ease;
    }

    .btn-logout-small:hover { 
        background: #F43F5E; 
        color: white; 
        transform: translateY(-1px);
    }

    /* Thanh Menu Chính (Main Navbar) */
    .main-nav-bar {
        width: 100%;
        max-width: 900px;
        margin: 0 auto 30px auto;
        background: #1E293B;
        padding: 18px 28px;
        border-radius: 16px;
        display: flex;
        align-items: center;
        gap: 35px;
        border: 1px solid #334155;
        box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        font-family: 'Inter', sans-serif;
    }

    .nav-brand {
        font-size: 20px;
        font-weight: 800;
        background: linear-gradient(to right, #818CF8, #A78BFA);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        text-decoration: none;
        letter-spacing: -0.5px;
    }

    .nav-link {
        font-size: 15px;
        font-weight: 600;
        color: #F8FAFC;
        text-decoration: none;
        transition: color 0.3s ease;
    }

    .nav-link:hover { 
        color: #818CF8; 
    }
    
    .nav-dropdown-wrapper { 
        position: relative; 
        display: inline-block; 
    }

    .nav-dropdown-toggle {
        font-size: 15px;
        font-weight: 600;
        color: #F8FAFC;
        cursor: pointer;
        padding: 5px 0;
        transition: color 0.3s ease;
        display: flex;
        align-items: center;
        gap: 6px;
    }

    .nav-dropdown-toggle:hover { 
        color: #818CF8; 
    }

    /* Nội dung Dropdown */
    .nav-dropdown-menu {
        position: absolute;
        top: 140%;
        left: 0;
        background-color: #1E293B;
        min-width: 220px;
        box-shadow: 0 15px 35px rgba(0,0,0,0.4);
        z-index: 100;
        border: 1px solid #334155;
        border-radius: 12px;
        overflow: hidden;
        display: none;
        animation: fadeInDown 0.2s ease forwards;
    }

    @keyframes fadeInDown {
        from { opacity: 0; transform: translateY(-10px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .nav-dropdown-menu a {
        display: block;
        padding: 14px 20px;
        text-decoration: none;
        color: #94A3B8;
        font-size: 14px;
        font-weight: 500;
        border-bottom: 1px solid #334155;
        transition: all 0.3s ease;
    }

    .nav-dropdown-menu a:last-child { 
        border-bottom: none; 
    }

    .nav-dropdown-menu a:hover {
        background-color: #334155;
        color: #F8FAFC;
        padding-left: 26px; /* Hiệu ứng trượt nhẹ */
    }
</style>

<!-- 1. Thanh thông báo Đăng nhập & Lượt truy cập -->
<div class="header-top-bar">
    <span>
        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                Xin chào: <strong>${sessionScope.user.fullname}</strong>
                <c:if test="${sessionScope.user.admin}">
                    <span class="admin-badge">ADMIN</span>
                </c:if>
                <!-- Nút Đăng xuất đưa lên thanh Top Bar -->
                <a href="${pageContext.request.contextPath}/logout" class="btn-logout-small">Đăng xuất</a>
            </c:when>
            <c:otherwise>
                <i>Bạn chưa đăng nhập</i>
                <a href="${pageContext.request.contextPath}/login" class="btn-logout-small" style="color:#10B981; border-color:#10B981;">Đăng nhập</a>
            </c:otherwise>
        </c:choose>
    </span>
    <span>
        Lượt truy cập hệ thống: <strong>${applicationScope.visitors != null ? applicationScope.visitors : 0}</strong>
    </span>
</div>

<!-- 2. Thanh Menu Chính -->
<div class="main-nav-bar">
    
    <!-- Nút Trang chủ -->
    <a href="${pageContext.request.contextPath}/" class="nav-brand">
        ONLINE ENTERTAINMENT
    </a>
    
    <!-- Nút Video Yêu Thích -->
    <a href="${pageContext.request.contextPath}/user-favorites" class="nav-link">
        MY FAVORITES
    </a>
    
    <!-- Dropdown Tài khoản -->
    <div class="nav-dropdown-wrapper">
        <span class="nav-dropdown-toggle" id="myAccountToggle">
            MY ACCOUNT &#9662;
        </span>
        
        <!-- Nội dung Dropdown -->
        <div class="nav-dropdown-menu" id="accountDropdown">
            <c:choose>
                <c:when test="${empty sessionScope.user}">
                    <a href="${pageContext.request.contextPath}/login">Login</a>
                    <a href="${pageContext.request.contextPath}/account/forgot-password">Forgot Password</a>
                    <a href="${pageContext.request.contextPath}/account/sign-up">Registration</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/account/change-password">Change Password</a>
                    <a href="${pageContext.request.contextPath}/account/edit-profile">Edit Profile</a>
                    <a href="${pageContext.request.contextPath}/logout" style="color: #F43F5E;">Logoff</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<!-- Script nhỏ để bật/tắt Dropdown My Account -->
<script>
    const dropdown = document.getElementById('accountDropdown');
    const toggleBtn = document.getElementById('myAccountToggle');
    
    if(toggleBtn) {
        toggleBtn.addEventListener('click', function(e) {
            e.stopPropagation(); // Ngăn sự kiện click lan ra ngoài
            dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block';
        });
    }

    // Click ra ngoài thì ẩn dropdown đi
    window.addEventListener('click', function() {
        if (dropdown && dropdown.style.display === 'block') {
            dropdown.style.display = 'none';
        }
    });
</script>