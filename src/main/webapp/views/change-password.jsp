<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt lại mật khẩu - PolyOE</title>
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
            
            --text-main: #F8FAFC;
            --text-muted: #94A3B8;
            
            --border: #334155;
            --border-light: #475569;

            --radius-md: 12px;
            --radius-lg: 16px;
            --ease: cubic-bezier(0.4, 0, 0.2, 1);
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-body);
            color: var(--text-main);
            margin: 0;
            padding: 40px 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        /* Container đồng bộ với ảnh 2 */
        .box {
            background: var(--bg-card);
            border: 1px solid var(--border);
            border-radius: var(--radius-lg);
            padding: 40px 32px;
            width: 100%;
            max-width: 440px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.3);
        }

        /* Tiêu đề có hiệu ứng Gradient */
        .form-header {
            text-align: center;
            font-size: 24px;
            font-weight: 800;
            background: linear-gradient(to right, #818CF8, #A78BFA);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid var(--border); /* Đã xóa vạch cam, thay bằng viền xám tối */
            letter-spacing: -0.5px;
            text-transform: uppercase;
        }

        /* Forms */
        .form-group {
            margin-bottom: 20px;
            width: 100%;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-size: 13px;
            color: var(--text-muted);
            text-transform: uppercase;
            letter-spacing: 1px;
            font-weight: 600;
        }

        .form-control {
            width: 100%;
            padding: 14px 16px;
            background: var(--bg-body); /* Nền tối đồng bộ */
            border: 1px solid var(--border); /* Viền xám tối, không còn màu cam */
            border-radius: 8px;
            color: var(--text-main);
            transition: all 0.3s ease;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
            font-size: 15px;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.2);
        }

        /* Buttons */
        .btn {
            width: 100%;
            padding: 14px 20px;
            font-weight: 600;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            justify-content: center;
            align-items: center;
            transition: all 0.3s ease;
            font-size: 15px;
            margin-top: 10px;
        }

        .btn-submit { 
            background: var(--primary); 
            color: white; 
        }
        
        .btn-submit:hover { 
            background: var(--primary-hover); 
            transform: translateY(-2px); 
        }

        .message-alert:not(:empty) {
            color: var(--danger);
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

        @media (max-width: 480px) {
            .box {
                padding: 30px 24px;
            }
        }
    </style>
</head>
<body>

    <!-- Nhúng thanh Menu -->
    <jsp:include page="menu.jsp" />

    <!-- Form Đặt Lại Mật Khẩu -->
    <div class="box">
        <div class="form-header">Reset Password</div>

        <form action="${pageContext.request.contextPath}/account/reset-password" method="post">
            <div class="message-alert">${message}</div>

            <!-- Input ẩn để truyền token về Server -->
            <input type="hidden" name="token" value="${token}">

            <div class="form-group">
                <label>New Password</label>
                <input type="password" name="newPassword" class="form-control" placeholder="Enter new password" required>
            </div>

            <div class="form-group">
                <label>Confirm New Password</label>
                <input type="password" name="confirmPassword" class="form-control" placeholder="Confirm your password" required>
            </div>

            <button type="submit" class="btn btn-submit">Confirm Reset</button>
        </form>
    </div>

</body>
</html>