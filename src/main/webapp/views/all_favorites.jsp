<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách Video được yêu thích - PolyOE</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        /* ============ DESIGN TOKENS (đồng bộ hệ thống) ============ */
        :root {
            --primary: #4F46E5;
            --primary-hover: #4338CA;
            --primary-light: #EEF2FF;
            --accent: #EC4899;

            --bg-gradient: linear-gradient(135deg, #eef2ff 0%, #f5f3ff 45%, #fdf2f8 100%);
            --card-bg: rgba(255, 255, 255, 0.9);
            --card-border: rgba(255, 255, 255, 0.6);

            --text-main: #1f2937;
            --text-muted: #6b7280;
            --text-faint: #9ca3af;

            --border: #e5e7eb;

            --radius-sm: 10px;
            --radius-md: 16px;
            --radius-lg: 24px;

            --shadow-sm: 0 4px 6px -1px rgba(0, 0, 0, 0.08), 0 2px 4px -1px rgba(0, 0, 0, 0.04);
            --shadow-lg: 0 20px 25px -5px rgba(0, 0, 0, 0.08), 0 10px 10px -5px rgba(0, 0, 0, 0.03);

            --ease: cubic-bezier(0.4, 0, 0.2, 1);
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: var(--bg-gradient);
            background-attachment: fixed;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 24px;
            color: var(--text-main);
        }

        /* Khung chứa bảng */
        .container {
            background-color: var(--card-bg);
            width: 100%;
            max-width: 800px;
            padding: 40px;
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-lg);
            backdrop-filter: blur(12px);
            border: 1px solid var(--card-border);
        }

        /* Tiêu đề chính */
        h2 {
            text-align: center;
            background: linear-gradient(to right, var(--primary), var(--accent));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 30px;
            font-size: 26px;
            font-weight: 800;
            letter-spacing: -0.5px;
        }

        /* Lớp bọc bảng để bo góc mượt mà */
        .table-wrapper {
            border-radius: 12px;
            overflow: hidden;
            box-shadow: var(--shadow-sm);
            border: 1px solid var(--border);
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff;
        }

        th, td {
            padding: 16px;
            text-align: left;
            border-bottom: 1px solid #f3f4f6;
        }

        /* Định dạng Header bảng */
        th {
            background-color: #f8fafc;
            font-weight: 700;
            color: var(--text-muted);
            text-transform: uppercase;
            font-size: 12.5px;
            letter-spacing: 0.5px;
        }

        /* Hiệu ứng khi hover từng dòng trong bảng */
        tbody tr {
            transition: background-color 0.2s ease;
        }

        tbody tr:last-child td {
            border-bottom: none;
        }

        tbody tr:hover {
            background-color: var(--primary-light);
        }

        td {
            color: var(--text-main);
            font-size: 15px;
        }

        td:first-child {
            font-weight: 600;
        }

        /* Trạng thái không có dữ liệu */
        .empty-state {
            text-align: center;
            padding: 48px 16px;
            color: var(--text-faint);
            font-style: italic;
            font-size: 14.5px;
        }

        /* Định dạng nút bấm Quay lại */
        .back-btn-container {
            text-align: center;
        }

        .back-btn {
            display: inline-flex;
            align-items: center;
            padding: 12px 24px;
            background-color: #ffffff;
            color: var(--text-main);
            text-decoration: none;
            border-radius: var(--radius-sm);
            font-weight: 600;
            font-size: 15px;
            border: 1px solid var(--border);
            transition: all 0.25s var(--ease);
            box-shadow: var(--shadow-sm);
        }

        .back-btn:hover {
            border-color: var(--primary);
            color: var(--primary);
            background-color: var(--primary-light);
            transform: translateY(-2px);
            box-shadow: var(--shadow-sm), 0 10px 15px -3px rgba(79, 70, 229, 0.15);
        }

        .back-btn span {
            margin-right: 8px;
            font-size: 18px;
        }

        @media (max-width: 640px) {
            .container {
                padding: 24px 20px;
            }
            h2 {
                font-size: 22px;
            }
            th, td {
                padding: 12px 10px;
                font-size: 13.5px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Danh sách các video được yêu thích</h2>

        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>Video Title</th>
                        <th>Người thích</th>
                        <th>Ngày thích</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${empty favorites}">
                            <tr>
                                <td colspan="3" class="empty-state">Chưa có video nào được yêu thích</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="favorite" items="${favorites}">
                                <tr>
                                    <td>${favorite.video.title}</td>
                                    <td>${favorite.user.fullname}</td>
                                    <td>${favorite.likeDate}</td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>

        <div class="back-btn-container">
            <a href="${pageContext.request.contextPath}/" class="back-btn">
                <span>&#8592;</span> Quay lại trang chủ
            </a>
        </div>
    </div>
</body>
</html>