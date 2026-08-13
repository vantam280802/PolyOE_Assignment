<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Tìm kiếm Video - PolyOE</title>
    <style>
        /* Tái sử dụng hệ thống biến màu sắc */
        :root {
            --primary: #4F46E5;
            --primary-hover: #4338CA;
            --bg-gradient: linear-gradient(135deg, #f3f4f6 0%, #e5e7eb 100%);
            --card-bg: rgba(255, 255, 255, 0.95);
            --text-main: #1f2937;
            --text-muted: #6b7280;
            --shadow-sm: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --shadow-lg: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: var(--bg-gradient);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
            color: var(--text-main);
        }

        /* Khung chứa nội dung chính */
        .container {
            background-color: var(--card-bg);
            width: 100%;
            max-width: 850px;
            padding: 40px;
            border-radius: 24px;
            box-shadow: var(--shadow-lg);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.5);
        }

        /* Tiêu đề chính */
        h2 {
            text-align: center;
            background: linear-gradient(to right, #4F46E5, #EC4899);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 25px;
            font-size: 26px;
            font-weight: 800;
            text-transform: uppercase;
        }

        /* Định dạng Form tìm kiếm */
        .search-form {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 12px;
            margin-bottom: 30px;
            background-color: #f8fafc;
            padding: 20px;
            border-radius: 16px;
            border: 1px solid #e5e7eb;
        }

        .search-form label {
            font-weight: 600;
            color: var(--text-main);
            font-size: 15px;
        }

        .search-input {
            padding: 12px 16px;
            border: 1px solid #cbd5e1;
            border-radius: 10px;
            width: 100%;
            max-width: 350px;
            font-size: 15px;
            outline: none;
            transition: all 0.3s ease;
            color: var(--text-main);
        }

        .search-input:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.15);
        }

        .search-btn {
            padding: 12px 24px;
            background-color: var(--primary);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: var(--shadow-sm);
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .search-btn:hover {
            background-color: var(--primary-hover);
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(79, 70, 229, 0.2);
        }

        /* Tiêu đề phụ */
        .subtitle {
            font-weight: 600;
            color: var(--text-muted);
            margin-bottom: 15px;
            font-size: 15px;
        }

        /* Lớp bọc bảng */
        .table-wrapper {
            border-radius: 12px;
            overflow: hidden;
            box-shadow: var(--shadow-sm);
            border: 1px solid #e5e7eb;
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

        th {
            background-color: #f8fafc;
            font-weight: 600;
            color: var(--text-muted);
            text-transform: uppercase;
            font-size: 13px;
            letter-spacing: 0.5px;
        }

        tbody tr {
            transition: background-color 0.2s ease;
        }

        tbody tr:hover {
            background-color: #f8fafc;
        }

        td {
            color: var(--text-main);
            font-size: 15px;
        }

        /* Căn giữa cột Số lượt thích và Trạng thái */
        td:nth-child(2), th:nth-child(2),
        td:nth-child(3), th:nth-child(3) {
            text-align: center;
        }

        /* Huy hiệu (Badge) cho trạng thái */
        .badge {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 600;
        }
        
        .badge-active {
            background-color: #dcfce7;
            color: #166534;
        }
        
        .badge-inactive {
            background-color: #fee2e2;
            color: #991b1b;
        }

        /* Nút Quay lại */
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
            border-radius: 10px;
            font-weight: 500;
            font-size: 15px;
            border: 1px solid #e5e7eb;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: var(--shadow-sm);
        }

        .back-btn:hover {
            border-color: var(--primary);
            color: var(--primary);
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(79, 70, 229, 0.15);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Bài 3: Tìm kiếm Video</h2>
        
        <form class="search-form" action="${pageContext.request.contextPath}/video-search" method="GET">
            <label for="keyword">Từ khóa:</label>
            <input type="text" id="keyword" name="keyword" value="${keyword}" class="search-input" placeholder="Nhập tên video cần tìm...">
            <button type="submit" class="search-btn">
                <span>&#128269;</span> Tìm kiếm
            </button>
        </form>

        <c:if test="${not empty videos}">
            <p class="subtitle">Kết quả tìm kiếm:</p>
            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th>Tiêu đề video</th>
                            <th>Số lượt thích</th>
                            <th>Còn hiệu lực</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="video" items="${videos}">
                            <tr>
                                <td>${video.title}</td>
                                <td><strong>${fn:length(video.favorites)}</strong></td>
                                <td>
                                    <span class="badge ${video.active ? 'badge-active' : 'badge-inactive'}">
                                        ${video.active ? 'Có' : 'Không'}
                                    </span>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
        
        <c:if test="${empty videos and not empty keyword}">
            <p style="text-align: center; color: var(--text-muted); margin-bottom: 30px; font-style: italic;">
                Không tìm thấy video nào khớp với từ khóa "${keyword}".
            </p>
        </c:if>

        <div class="back-btn-container">
            <a href="${pageContext.request.contextPath}/" class="back-btn">
                <span>&#8592;</span> Quay lại trang chủ
            </a>
        </div>
    </div>
</body>
</html>