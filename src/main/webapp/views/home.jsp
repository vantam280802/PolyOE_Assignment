<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Chủ - PolyOE</title>
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
            
            --accent: #10B981;
            
            --danger: #F43F5E;
            
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

        /* Container chính chứa toàn bộ nội dung */
        .main-container {
            width: 100%;
            max-width: 1100px;
            margin: 0 auto;
        }

        /* Lưới hiển thị Video */
        .video-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 30px;
            margin-top: 30px;
        }

        .video-card {
            background: var(--bg-card);
            border: 1px solid var(--border);
            border-radius: var(--radius-md);
            padding: 16px;
            transition: all 0.3s var(--ease);
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            display: flex;
            flex-direction: column;
        }

        .video-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 20px rgba(0,0,0,0.2);
            border-color: var(--border-light);
        }

        .video-poster {
            width: 100%;
            height: 220px;
            object-fit: cover;
            border-radius: 8px;
            margin-bottom: 16px;
            transition: opacity 0.3s ease;
        }

        .video-poster:hover {
            opacity: 0.85;
        }

        .video-title {
            font-size: 16px;
            font-weight: 600;
            color: var(--text-main);
            margin-bottom: 16px;
            line-height: 1.4;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            flex-grow: 1;
        }

        /* Nút hành động */
        .video-actions {
            display: flex;
            gap: 12px;
            margin-top: auto;
        }

        .btn {
            flex: 1;
            padding: 10px;
            text-align: center;
            text-decoration: none;
            font-weight: 600;
            font-size: 14px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .btn-like {
            background: var(--primary);
            color: white;
        }

        .btn-like:hover {
            background: var(--primary-hover);
        }

        .btn-share {
            background: var(--bg-card-hover);
            color: var(--text-main);
            border: 1px solid var(--border-light);
        }

        .btn-share:hover {
            background: var(--border-light);
        }

        /* Phân trang */
        .pagination {
            display: flex;
            justify-content: center;
            gap: 8px;
            margin-top: 40px;
            margin-bottom: 20px;
        }

        .page-link {
            padding: 10px 16px;
            background: var(--bg-card);
            border: 1px solid var(--border);
            color: var(--text-muted);
            text-decoration: none;
            font-weight: 600;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .page-link:hover {
            background: var(--primary);
            color: white;
            border-color: var(--primary);
        }
        
        @media (max-width: 600px) {
            .video-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    
    <div class="main-container">
        <!-- Include Menu -->
        <jsp:include page="menu.jsp" />

        <!-- Lưới hiển thị Video -->
        <div class="video-grid">
            <c:forEach var="v" items="${videos}">
                <div class="video-card">
                    <a href="${pageContext.request.contextPath}/video/detail/${v.id}">
                        <c:choose>
                            <c:when test="${fn:startsWith(v.poster, 'http')}">
                                <img src="${v.poster}" alt="POSTER" class="video-poster">
                            </c:when>
                            <c:when test="${fn:contains(v.poster, '.png') or fn:contains(v.poster, '.jpg')}">
                                <img src="${pageContext.request.contextPath}/images/${v.poster}" alt="POSTER" class="video-poster">
                            </c:when>
                            <c:otherwise>
                                <img src="https://img.youtube.com/vi/${v.id}/hqdefault.jpg" alt="POSTER" class="video-poster">
                            </c:otherwise>
                        </c:choose>
                    </a>
                    
                    <div class="video-title">${v.title}</div>
                    
                    <div class="video-actions">
                        <a href="${pageContext.request.contextPath}/video/like/${v.id}" class="btn btn-like">Thích</a>
                        <a href="${pageContext.request.contextPath}/video/share/${v.id}" class="btn btn-share">Chia sẻ</a>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- Phân trang -->
        <div class="pagination">
            <a href="?page=1" class="page-link">|&lt;</a>
            <a href="?page=${currentPage > 1 ? currentPage - 1 : 1}" class="page-link">&lt;&lt;</a>
            <a href="?page=${currentPage < totalPages ? currentPage + 1 : totalPages}" class="page-link">&gt;&gt;</a>
            <a href="?page=${totalPages}" class="page-link">&gt;|</a>
        </div>
    </div>
</body>
</html>