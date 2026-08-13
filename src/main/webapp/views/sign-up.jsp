<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập & Đăng Ký</title>
    <style>
        /* === RESET & BIẾN CSS TÙY CHỈNH === */
        :root {
            --primary-orange: #f39c12;
            --hover-orange: #e67e22;
            --bg-color: #f4f7f6;
            --text-color: #333;
            --border-color: #ddd;
            --header-bg: #2c3e50;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
            background-color: var(--bg-color);
            color: var(--text-color);
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
            padding: 50px 20px;
        }

        /* === BỐ CỤC CHÍNH CỦA TRANG === */
        .page-wrapper {
            display: flex;
            gap: 30px;
            flex-wrap: wrap;
            max-width: 1000px;
            width: 100%;
            justify-content: center;
        }

        /* === STYLE CHO FORM CONTAINER === */
        .form-container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: 100%;
            max-width: 450px; /* Giới hạn chiều rộng mỗi form */
            display: flex;
            flex-direction: column;
        }

        .form-header {
            background-color: var(--header-bg);
            color: #fff;
            padding: 20px;
            font-size: 20px;
            font-weight: 600;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .form-body {
            padding: 30px 25px;
            flex: 1;
        }

        /* === CÁC THÀNH PHẦN TRONG FORM === */
        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #555;
            font-size: 14px;
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid var(--border-color);
            border-radius: 5px;
            font-size: 15px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary-orange);
            box-shadow: 0 0 5px rgba(243, 156, 18, 0.3);
        }

        /* Dành cho checkbox Remember Me */
        .checkbox-group {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
        }

        .checkbox-group input[type="checkbox"] {
            width: 16px;
            height: 16px;
            cursor: pointer;
        }

        .checkbox-group label {
            text-transform: uppercase;
            font-size: 13px;
            font-weight: 600;
            color: #666;
            cursor: pointer;
        }

        /* === GRID TRONG FORM ĐĂNG KÝ === */
        .form-row {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
        }

        .form-row .form-group {
            flex: 1;
            margin-bottom: 0;
        }

        /* === THÔNG BÁO ALERT === */
        .message-alert {
            color: #e74c3c;
            font-size: 14px;
            text-align: center;
            margin-bottom: 15px;
            font-weight: 500;
            min-height: 20px; /* Giữ layout không bị giật khi có/không có lỗi */
        }

        /* === BUTTON === */
        .form-footer {
            padding: 0 25px 30px;
        }

        .btn-orange {
            background-color: var(--primary-orange);
            color: #fff;
            border: none;
            width: 100%;
            padding: 14px;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 600;
            text-transform: uppercase;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.1s ease;
        }

        .btn-orange:hover {
            background-color: var(--hover-orange);
        }

        .btn-orange:active {
            transform: scale(0.98);
        }

        /* === RESPONSIVE (Dành cho điện thoại) === */
        @media (max-width: 768px) {
            .form-row {
                flex-direction: column;
                gap: 20px;
            }
            .page-wrapper {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
</head>
<body>

    <!-- FORM ĐĂNG KÝ -->
    <div class="form-container">
        <div class="form-header">Registration</div>
        <form action="${pageContext.request.contextPath}/account/sign-up" method="post">
            <div class="form-body">
                <div class="message-alert">${message}</div>
                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label">Username</label>
                        <input type="text" name="username" class="form-control" placeholder="Choose a username" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Password</label>
                        <input type="password" name="password" class="form-control" placeholder="Create a password" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label">Fullname</label>
                        <input type="text" name="fullname" class="form-control" placeholder="John Doe" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Email Address</label>
                        <input type="email" name="email" class="form-control" placeholder="name@example.com" required>
                    </div>
                </div>
            </div>
            <div class="form-footer">
                <button type="submit" class="btn-orange">Sign Up</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>