<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Khôi phục mật khẩu - PolyOE</title>
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

            --danger: #dc2626;
            --danger-bg: #fef2f2;
            --danger-border: #fecaca;

            --success: #059669;
            --success-bg: #ecfdf5;
            --success-border: #a7f3d0;

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
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 24px;
            gap: 24px;
            color: var(--text-main);
        }

        /* ============ FORM CONTAINER ============ */
        .form-container {
            width: 100%;
            max-width: 440px;
            background: var(--card-bg);
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-lg);
            backdrop-filter: blur(12px);
            border: 1px solid var(--card-border);
            overflow: hidden;
        }

        .form-header {
            text-align: center;
            background: linear-gradient(to right, var(--primary), var(--accent));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            padding: 28px 24px 6px;
            font-size: 24px;
            font-weight: 800;
            letter-spacing: -0.3px;
        }

        .form-subtext {
            text-align: center;
            padding: 0 32px 20px;
            color: var(--text-muted);
            font-size: 13.5px;
            line-height: 1.5;
        }

        .form-body {
            padding: 8px 32px 0;
            display: flex;
            flex-direction: column;
            gap: 18px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .form-label {
            font-weight: 600;
            font-size: 14px;
            color: var(--text-main);
        }

        .form-control {
            padding: 12px 16px;
            border: 1px solid #cbd5e1;
            border-radius: var(--radius-sm);
            font-size: 15px;
            font-family: inherit;
            outline: none;
            transition: all 0.25s var(--ease);
            width: 100%;
        }

        .form-control:hover {
            border-color: #94a3b8;
        }

        .form-control:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.15);
        }

        /* ============ THÔNG BÁO ============ */
        .message-alert {
            font-size: 14px;
            line-height: 1.5;
        }

        .message-alert:not(:empty) {
            padding: 12px 16px;
            border-radius: var(--radius-sm);
            background-color: var(--danger-bg);
            border: 1px solid var(--danger-border);
            color: var(--danger);
            font-weight: 500;
        }

        /* ============ FOOTER / NÚT SUBMIT ============ */
        .form-footer {
            padding: 24px 32px 32px;
        }

        .btn-orange {
            width: 100%;
            padding: 13px 20px;
            border: none;
            border-radius: var(--radius-sm);
            font-size: 15px;
            font-weight: 700;
            font-family: inherit;
            cursor: pointer;
            color: #ffffff;
            background: linear-gradient(to right, var(--primary), #6366f1);
            box-shadow: var(--shadow-sm);
            transition: all 0.25s var(--ease);
        }

        .btn-orange:hover {
            background: linear-gradient(to right, var(--primary-hover), var(--primary));
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(79, 70, 229, 0.3);
        }

        .btn-orange:active {
            transform: translateY(0);
        }

        @media (max-width: 480px) {
            .form-header {
                padding: 24px 20px 6px;
                font-size: 21px;
            }
            .form-body {
                padding: 8px 22px 0;
            }
            .form-footer {
                padding: 20px 22px 26px;
            }
        }
    </style>
</head>
<body>

    <!-- Nhúng thanh Menu và CSS dùng chung -->
    <jsp:include page="menu.jsp" />

    <!-- Form Quên Mật Khẩu -->
    <div class="form-container">
        <div class="form-header">Khôi phục mật khẩu</div>
        <p class="form-subtext">Nhập tên đăng nhập và email đã đăng ký để lấy lại mật khẩu của bạn.</p>

        <form action="${pageContext.request.contextPath}/account/forgot-password" method="post">
            <div class="form-body">
                <!-- Vùng hiển thị thông báo lỗi hoặc thành công từ Servlet -->
                <div class="message-alert">${message}</div>

                <div class="form-group">
                    <label class="form-label">Tên đăng nhập</label>
                    <input type="text" name="username" class="form-control" placeholder="Nhập tên đăng nhập..." required>
                </div>

                <div class="form-group">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" placeholder="Nhập email đã đăng ký..." required>
                </div>
            </div>

            <div class="form-footer">
                <button type="submit" class="btn-orange">Khôi phục</button>
            </div>
        </form>
    </div>

</body>
</html>