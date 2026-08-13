<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lab 3 & Lab 4 - PolyOE</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        /* ============ MODERN DARK THEME TOKENS ============ */
        :root {
            --bg-body: #0F172A;        /* Slate 900 */
            --bg-card: #1E293B;        /* Slate 800 */
            --bg-card-hover: #334155;  /* Slate 700 */
            
            --primary: #6366F1;        /* Indigo 500 */
            --primary-hover: #818CF8;  /* Indigo 400 */
            --primary-glow: rgba(99, 102, 241, 0.4);
            
            --accent: #10B981;         /* Emerald 500 */
            
            --danger: #F43F5E;         /* Rose 500 */
            --danger-hover: #FB7185;   /* Rose 400 */
            --danger-bg: rgba(244, 63, 94, 0.1);
            
            --text-main: #F8FAFC;      /* Slate 50 */
            --text-muted: #94A3B8;     /* Slate 400 */
            
            --border: #334155;         /* Slate 700 */
            --border-light: #475569;   /* Slate 600 */

            --radius-sm: 8px;
            --radius-md: 16px;
            --radius-lg: 24px;

            --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.3), 0 2px 4px -2px rgba(0, 0, 0, 0.3);
            --shadow-glow: 0 0 20px var(--primary-glow);

            --ease: cubic-bezier(0.4, 0, 0.2, 1);
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Inter', sans-serif;
        }

        body {
            background-color: var(--bg-body);
            background-image: 
                radial-gradient(at 0% 0%, rgba(99, 102, 241, 0.15) 0px, transparent 50%),
                radial-gradient(at 100% 100%, rgba(16, 185, 129, 0.1) 0px, transparent 50%);
            background-attachment: fixed;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            padding: 40px 20px;
            gap: 24px;
            color: var(--text-main);
        }

        /* ============ HEADER BAR ============ */
        .header-bar {
            width: 100%;
            max-width: 760px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: var(--bg-card);
            padding: 16px 28px;
            border-radius: 50px; /* Pill shape */
            box-shadow: var(--shadow-md);
            border: 1px solid var(--border);
        }

        .header-bar span {
            font-size: 14.5px;
            color: var(--text-muted);
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .header-bar strong {
            color: var(--text-main);
            font-weight: 600;
        }

        .btn {
            text-decoration: none;
            padding: 8px 20px;
            font-size: 14px;
            font-weight: 600;
            border-radius: 50px;
            transition: all 0.3s var(--ease);
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        .btn-login {
            background: var(--primary);
            color: #ffffff;
            border: 1px solid transparent;
        }

        .btn-login:hover {
            background: var(--primary-hover);
            box-shadow: var(--shadow-glow);
            transform: translateY(-1px);
        }

        .btn-logout {
            background: var(--danger-bg);
            color: var(--danger);
            border: 1px solid var(--danger);
            margin-left: 8px;
        }

        .btn-logout:hover {
            background: var(--danger);
            color: #ffffff;
            box-shadow: 0 0 15px rgba(244, 63, 94, 0.4);
            transform: translateY(-1px);
        }

        .admin-badge {
            background: linear-gradient(135deg, #F43F5E, #9F1239);
            color: white;
            font-size: 11px;
            font-weight: 800;
            padding: 4px 12px;
            border-radius: 20px;
            text-transform: uppercase;
            letter-spacing: 1px;
            box-shadow: 0 2px 4px rgba(244, 63, 94, 0.3);
        }

        /* ============ MAIN CONTAINER ============ */
        .container {
            background: var(--bg-card);
            width: 100%;
            max-width: 760px;
            padding: 48px;
            border-radius: var(--radius-lg);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.4);
            border: 1px solid var(--border);
        }

        h2 {
            text-align: center;
            font-size: 32px;
            font-weight: 800;
            background: linear-gradient(to right, #818CF8, #A78BFA);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 40px;
            letter-spacing: -1px;
        }

        /* ============ MENUS ============ */
        .menu-section {
            background: rgba(15, 23, 42, 0.4);
            border: 1px solid var(--border);
            border-radius: var(--radius-md);
            padding: 24px;
            margin-bottom: 24px;
        }

        .menu-section:last-child {
            margin-bottom: 0;
        }

        h3 {
            font-size: 13px;
            color: var(--text-muted);
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        h3::after {
            content: "";
            flex: 1;
            height: 1px;
            background: var(--border-light);
        }

        .menu {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .menu a {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 16px 20px;
            font-size: 15px;
            font-weight: 500;
            text-decoration: none;
            color: var(--text-main);
            background: var(--bg-card);
            border-radius: var(--radius-sm);
            border: 1px solid var(--border);
            transition: all 0.3s var(--ease);
            position: relative;
            overflow: hidden;
        }

        /* Hiệu ứng line trượt khi hover */
        .menu a::before {
            content: '';
            position: absolute;
            left: 0;
            top: 0;
            bottom: 0;
            width: 4px;
            background: var(--primary);
            transform: scaleY(0);
            transition: transform 0.3s var(--ease);
            transform-origin: center;
        }

        .menu a::after {
            content: "\2192";
            opacity: 0;
            transform: translateX(-15px);
            transition: all 0.3s var(--ease);
            color: var(--primary-hover);
            font-size: 18px;
        }

        .menu a:hover {
            border-color: var(--border-light);
            background-color: var(--bg-card-hover);
            transform: translateX(4px);
        }

        .menu a:hover::before {
            transform: scaleY(1);
        }

        .menu a:hover::after {
            opacity: 1;
            transform: translateX(0);
        }

        /* Menu Admin Tùy chỉnh */
        .admin-menu a::before {
            background: var(--danger);
        }
        
        .admin-menu a:hover::after {
            color: var(--danger-hover);
        }

        /* ============ RESPONSIVE ============ */
        @media (max-width: 640px) {
            .header-bar {
                flex-direction: column;
                align-items: flex-start;
                border-radius: var(--radius-md);
                gap: 16px;
            }
            .container {
                padding: 32px 24px;
            }
            .menu-section {
                padding: 16px;
            }
            h2 {
                font-size: 26px;
                margin-bottom: 30px;
            }
        }
    </style>
</head>
<body>

    <!-- THANH THÔNG BÁO & ĐĂNG NHẬP -->
    <div class="header-bar">
        <span>
            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    Xin chào: <strong>${sessionScope.user.fullname}</strong>
                    <c:if test="${sessionScope.user.admin}">
                        <span class="admin-badge">Admin</span>
                    </c:if>
                    <a href="${pageContext.request.contextPath}/logout" class="btn btn-logout">Đăng xuất</a>
                </c:when>
                <c:otherwise>
                    <i>Bạn chưa đăng nhập</i>
                    <a href="${pageContext.request.contextPath}/login" class="btn btn-login">Đăng nhập</a>
                </c:otherwise>
            </c:choose>
        </span>
        <span>Lượt truy cập: <strong>${applicationScope.visitors != null ? applicationScope.visitors : 0}</strong></span>
    </div>

    <div class="container">
        <h2>Hệ thống Quản lý Video - PolyOE</h2>

        <div class="menu">
            <!-- MENU 1: CHỨC NĂNG CÔNG KHAI -->
            <div class="menu-section public-menu">
                <h3>&#127760; Chức năng công khai</h3>
                <div class="menu">
                    <a href="${pageContext.request.contextPath}/video/list">Danh sách Video</a>
                    <a href="${pageContext.request.contextPath}/video-search">Tìm kiếm Video theo từ khóa</a>
                    <a href="${pageContext.request.contextPath}/text-chat.html">&#128172; Phòng Chat Cơ bản (Text)</a>
                    <a href="${pageContext.request.contextPath}/json-chat.html">&#128172; Phòng Chat Nâng cao (JSON)</a>
                </div>
            </div>

            <!-- MENU 2: CHỨC NĂNG NGƯỜI DÙNG -->
            <c:if test="${not empty sessionScope.user}">
                <div class="menu-section user-menu">
                    <h3>&#128100; Chức năng cá nhân (User)</h3>
                    <div class="menu">
                        <a href="${pageContext.request.contextPath}/account/edit-profile">Cập nhật hồ sơ cá nhân</a>
                        <a href="${pageContext.request.contextPath}/account/change-password">Đổi mật khẩu</a>
                        <a href="${pageContext.request.contextPath}/user-favorites">Xem Video yêu thích của tôi</a>
                    </div>
                </div>
            </c:if>

            <!-- MENU 3: CHỨC NĂNG QUẢN TRỊ -->
            <c:if test="${not empty sessionScope.user and sessionScope.user.admin}">
                <div class="menu-section admin-menu">
                    <h3>&#9881;&#65039; Chức năng quản trị (Admin)</h3>
                    <div class="menu">
                        <a href="${pageContext.request.contextPath}/admin/video">Quản lý Video</a>
                        <a href="${pageContext.request.contextPath}/admin/user">Quản lý Người dùng</a>
                        <a href="${pageContext.request.contextPath}/all-favorites">Thống kê tất cả lượt thích</a>
                        <a href="${pageContext.request.contextPath}/share-report">Báo cáo lượt chia sẻ Video</a>
                    </div>
                </div>
            </c:if>
        </div>
    </div>

</body>
</html>