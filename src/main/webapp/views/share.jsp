<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chia sẻ Video - PolyOE</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        /* ============ MODERN DARK THEME TOKENS ============ */
        :root {
            --bg-body: #0F172A;
            --bg-card: #1E293B;
            
            --primary: #6366F1;
            --primary-hover: #818CF8;
            
            --danger: #F43F5E;
            --danger-hover: #FB7185;
            
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
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* === BỐ CỤC CARD === */
        .form-container {
            background: var(--bg-card);
            border: 1px solid var(--border);
            border-radius: var(--radius-lg);
            width: 100%;
            max-width: 450px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.3);
            padding: 40px 32px;
            margin-top: 40px;
            animation: fadeIn 0.5s var(--ease);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .form-header {
            text-align: center;
            font-size: 26px;
            font-weight: 800;
            background: linear-gradient(to right, #818CF8, #A78BFA);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid var(--border);
            text-transform: uppercase;
            letter-spacing: -0.5px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            font-size: 13px;
            color: var(--text-muted);
            text-transform: uppercase;
            font-weight: 600;
            letter-spacing: 1px;
        }

        /* Form Control cho ô Input */
        .form-control {
            width: 100%;
            padding: 14px 16px;
            background: var(--bg-body);
            border: 1px solid var(--border);
            border-radius: 8px;
            color: var(--text-main);
            font-size: 15px;
            font-family: 'Inter', sans-serif;
            transition: all 0.3s ease;
            box-sizing: border-box;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.2);
        }

        .text-muted {
            font-size: 12px;
            color: var(--text-muted);
            margin-top: 8px;
            display: block;
            font-style: italic;
        }

        .message-alert:not(:empty) {
            color: var(--danger-hover);
            background: rgba(244, 63, 94, 0.1);
            border: 1px solid rgba(244, 63, 94, 0.3);
            padding: 12px;
            border-radius: 8px;
            font-style: italic;
            margin-bottom: 20px;
            font-weight: 500;
            text-align: center;
            font-size: 14px;
        }

        /* Nút Send */
        .btn-submit {
            width: 100%;
            padding: 14px 20px;
            font-weight: 600;
            font-size: 15px;
            color: white;
            background: var(--primary);
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            justify-content: center;
            align-items: center;
            margin-top: 10px;
        }

        .btn-submit:hover {
            background: var(--primary-hover);
            transform: translateY(-2px);
        }
        
        @media (max-width: 480px) {
            .form-container {
                padding: 30px 24px;
                margin-top: 20px;
            }
        }
    </style>
</head>
<body>

<div class="main-container">
    <!-- Nhúng thanh Menu dùng chung -->
    <jsp:include page="menu.jsp" />
    
    <div class="form-container">
        
        <div class="form-header">Share Video</div>
        
        <!-- Action trỏ đúng về VideoServlet kèm ID video -->
        <form action="${pageContext.request.contextPath}/video/share/${videoId}" method="POST">
            
            <!-- Vùng hiển thị thông báo lỗi/thành công -->
            <div class="message-alert">${message}</div>
            
            <!-- Truyền ngầm videoId về Server -->
            <input type="hidden" name="videoId" value="${videoId}">
            
            <div class="form-group">
                <label class="form-label">Your friend's email?</label>
                <input type="email" name="email" class="form-control" placeholder="example@gmail.com, test@fpt.edu.vn" required>
                <span class="text-muted">Có thể gửi nhiều email, phân cách bằng dấu phẩy (,)</span>
            </div>
            
            <button type="submit" class="btn-submit">Send</button>
            
        </form>
    </div>
</div>

</body>
</html>