<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cập nhật hồ sơ - PolyOE</title>
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

        /* Container chuẩn hệ thống */
        .box {
            background: var(--bg-card);
            border: 1px solid var(--border);
            border-radius: var(--radius-lg);
            padding: 40px 32px;
            width: 100%;
            max-width: 650px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.3);
            animation: fadeIn 0.5s var(--ease);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Tiêu đề Form */
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
            letter-spacing: -0.5px;
            text-transform: uppercase;
        }
        
        /* Chừa sẵn CSS cho form ở bước sau */
    </style>
</head>
<body>

    <!-- Nhúng thanh Menu -->
    <jsp:include page="menu.jsp" />

    <!-- Form Cập nhật tài khoản -->
    <div class="box">
        <div class="form-header">Edit Profile</div>
        
        <!-- Code form sẽ được chèn ở đây -->
    </div>

</body>
</html>