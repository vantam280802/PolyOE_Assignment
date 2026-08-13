<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Video - PolyOE</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        /* ============ MODERN DARK THEME TOKENS ============ */
        :root {
            --bg-body: #0F172A;
            --bg-card: #1E293B;
            --bg-card-hover: #334155;
            
            --primary: #6366F1;
            --primary-hover: #818CF8;
            
            --text-main: #F8FAFC;
            --text-muted: #94A3B8;
            
            --border: #334155;
            --border-light: #475569;

            --radius-md: 12px;
            --radius-lg: 16px;
            --ease: cubic-bezier(0.4, 0, 0.2, 1);
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-body);
            color: var(--text-main);
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .main-container {
            width: 100%;
            max-width: 1100px;
            margin: 0 auto;
        }

        /* Bố cục 2 cột */
        .layout-grid {
            display: flex;
            gap: 24px;
            margin-top: 24px;
        }

        /* CỘT TRÁI: Video Detail */
        .video-detail-col {
            flex: 7;
            background: var(--bg-card);
            border: 1px solid var(--border);
            border-radius: var(--radius-lg);
            overflow: hidden;
            box-shadow: 0 10px 25px rgba(0,0,0,0.3);
            display: flex;
            flex-direction: column;
        }

        .video-player-wrapper {
            width: 100%;
            height: 600px;
            background-color: #000;
        }

        .video-player-wrapper iframe {
            width: 100%;
            height: 100%;
            border: none;
        }

        .video-info {
            padding: 24px;
        }

        .video-title {
            font-size: 22px;
            font-weight: 700;
            color: var(--text-main);
            margin-bottom: 16px;
            line-height: 1.4;
        }

        .video-desc {
            font-size: 15px;
            color: var(--text-muted);
            line-height: 1.6;
            min-height: 80px;
            margin-bottom: 24px;
        }

        .video-actions {
            display: flex;
            gap: 12px;
            padding-top: 20px;
            border-top: 1px solid var(--border);
        }

        .btn {
            padding: 12px 24px;
            font-weight: 600;
            font-size: 14px;
            border-radius: 8px;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
        }

        .btn-like {
            background: var(--primary);
            color: white;
        }

        .btn-like:hover {
            background: var(--primary-hover);
            transform: translateY(-2px);
        }

        .btn-share {
            background: var(--bg-card-hover);
            color: var(--text-main);
            border: 1px solid var(--border-light);
        }

        .btn-share:hover {
            background: var(--border-light);
            transform: translateY(-2px);
        }

        /* CỘT PHẢI: Video Đã Xem */
        .viewed-col {
            flex: 3;
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .viewed-header {
            background: linear-gradient(to right, #818CF8, #A78BFA);
            color: white;
            padding: 14px;
            font-weight: 700;
            text-align: center;
            border-radius: var(--radius-md);
            text-transform: uppercase;
            letter-spacing: 0.5px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .viewed-item {
            display: flex;
            gap: 12px;
            background: var(--bg-card);
            border: 1px solid var(--border);
            border-radius: var(--radius-md);
            padding: 10px;
            text-decoration: none;
            transition: all 0.3s ease;
            align-items: center;
        }

        .viewed-item:hover {
            background: var(--bg-card-hover);
            border-color: var(--border-light);
            transform: translateX(4px);
        }

        .viewed-thumb {
            width: 110px;
            height: 75px;
            object-fit: cover;
            border-radius: 6px;
            border: 1px solid var(--border-light);
        }

        .viewed-title {
            color: var(--text-main);
            font-size: 14px;
            font-weight: 600;
            line-height: 1.4;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        /* Đáp ứng màn hình nhỏ (Mobile/Tablet) */
        @media (max-width: 860px) {
            .layout-grid {
                flex-direction: column;
            }
            .video-player-wrapper {
                height: 400px;
            }
        }
        
        @media (max-width: 600px) {
            .video-player-wrapper {
                height: 250px;
            }
        }
    </style>
</head>
<body>

<div class="main-container">
    <!-- Nhúng thanh Menu -->
    <jsp:include page="menu.jsp" />

    <div class="layout-grid">
        <!-- Cột trái: Chi tiết Video -->
        <div class="video-detail-col">
            
            <!-- TRÌNH PHÁT YOUTUBE -->
            <div class="video-player-wrapper">
                <iframe src="https://www.youtube.com/embed/${video.id}?autoplay=1" 
                        title="YouTube video player" 
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
                        allowfullscreen>
                </iframe>
            </div>

            <div class="video-info">
                <div class="video-title">${video.title}</div>
                
                <div class="video-desc">${video.description}</div>
                
                <div class="video-actions">
                    <a href="${pageContext.request.contextPath}/video/like/${video.id}" class="btn btn-like">Thích</a>
                    <a href="${pageContext.request.contextPath}/video/share/${video.id}" class="btn btn-share">Chia sẻ</a>
                </div>
            </div>
        </div>

        <!-- Cột phải: Video đã xem (Từ Cookie) -->
        <div class="viewed-col">
            <div class="viewed-header">
                Video Đã Xem
            </div>
            
            <c:forEach var="vv" items="${viewedList}">
                <a href="${pageContext.request.contextPath}/video/detail/${vv.id}" class="viewed-item">
                    
                    <!-- Xử lý thông minh để hiện thị Poster chính xác ở cột phải -->
                    <c:choose>
                        <%-- Nếu chuỗi poster bắt đầu bằng http (đã là URL hoàn chỉnh) --%>
                        <c:when test="${fn:startsWith(vv.poster, 'http')}">
                            <img src="${vv.poster}" alt="POSTER" class="viewed-thumb">
                        </c:when>
                        <%-- Ngược lại, tự động sinh link lấy ảnh thumbnail gốc từ YouTube --%>
                        <c:otherwise>
                            <img src="https://img.youtube.com/vi/${vv.id}/hqdefault.jpg" alt="POSTER" class="viewed-thumb">
                        </c:otherwise>
                    </c:choose>

                    <div class="viewed-title">${vv.title}</div>
                </a>
            </c:forEach>
        </div>
    </div>
</div>

</body>
</html>