<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý Người dùng - Admin</title>
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
            --danger-hover: #FB7185;
            
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
        }

        .message-alert {
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
            width: 100%;
            max-width: 900px;
        }

        .message-alert:empty {
            display: none;
        }

        /* Container */
        .box {
            background: var(--bg-card);
            border: 1px solid var(--border);
            border-radius: 0 0 var(--radius-lg) var(--radius-lg);
            padding: 30px;
            width: 100%;
            max-width: 900px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.3);
        }

        /* Tabs */
        .tabs {
            display: flex;
            width: 100%;
            max-width: 900px;
            margin-top: 20px;
        }

        .tab {
            padding: 14px 24px;
            background: rgba(15, 23, 42, 0.6);
            color: var(--text-muted);
            font-weight: 600;
            cursor: pointer;
            border-radius: var(--radius-md) var(--radius-md) 0 0;
            border: 1px solid transparent;
            border-bottom: none;
            transition: all 0.3s var(--ease);
            letter-spacing: 0.5px;
            text-decoration: none;
        }

        .tab.active {
            background: var(--bg-card);
            color: var(--primary-hover);
            border-color: var(--border);
            border-bottom: 2px solid var(--primary);
        }

        .tab:hover:not(.active) {
            background: var(--bg-card-hover);
            color: var(--text-main);
        }

        /* Hỗ trợ ẩn/hiện Tab */
        .tab-content { display: none; }
        .tab-content.active { display: block; animation: fadeIn 0.3s ease; }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(5px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Forms & Inputs */
        .form-group { margin-bottom: 20px; flex: 1; }
        .form-group label {
            display: block; margin-bottom: 8px; font-size: 13px;
            color: var(--text-muted); text-transform: uppercase; font-weight: 600;
        }
        .form-control {
            width: 100%; padding: 12px 16px; background: var(--bg-body);
            border: 1px solid var(--border); border-radius: 8px;
            color: var(--text-main); box-sizing: border-box; transition: all 0.3s ease;
        }
        .form-control:focus {
            outline: none; border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.2);
        }
        .form-control[readonly] { background: rgba(15, 23, 42, 0.4) !important; color: var(--text-muted); border-color: transparent; }

        .checkbox-group {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
        }

        /* Tables */
        table { width: 100%; border-collapse: separate; border-spacing: 0; border: 1px solid var(--border); border-radius: 8px; overflow: hidden; }
        th, td { padding: 14px 16px; text-align: left; border-bottom: 1px solid var(--border); }
        th { background: rgba(15, 23, 42, 0.8); color: var(--text-muted); font-size: 13px; text-transform: uppercase; font-weight: 600; }
        td { background: var(--bg-card); }
        tr:last-child td { border-bottom: none; }
        tr:hover td { background: var(--bg-card-hover); }
        td a { color: var(--primary-hover); text-decoration: none; font-weight: 600; }

        /* Buttons */
        .btn-group {
            text-align: right; 
            border-top: 1px solid var(--border); 
            padding-top: 20px;
            display: flex;
            justify-content: flex-end;
            gap: 12px;
        }

        .btn { padding: 10px 20px; font-weight: 600; border: none; border-radius: 8px; cursor: pointer; transition: all 0.3s ease; font-size: 14px; text-decoration: none; display: inline-flex; align-items: center; }
        .btn-update { background: var(--primary); color: white; }
        .btn-update:hover:not([disabled]) { background: var(--primary-hover); transform: translateY(-1px); }
        .btn-update[disabled] { opacity: 0.5; cursor: not-allowed; }
        
        .btn-delete { background: var(--danger); color: white; }
        .btn-delete:hover:not(.disabled) { background: var(--danger-hover); transform: translateY(-1px); }
        .btn-delete.disabled { opacity: 0.5; cursor: not-allowed; pointer-events: none; }
        
        .btn-reset { background: var(--border-light); color: white; }
        .btn-reset:hover { background: var(--text-muted); }
    </style>
</head>
<body>

    <!-- Nhúng Menu Admin -->
    <jsp:include page="admin-menu.jsp" />

    <div class="message-alert">${message}</div>

    <!-- TABS -->
    <div class="tabs">
        <a class="tab active" onclick="openTab(event, 'List')">USER LIST</a>
        <a class="tab" onclick="openTab(event, 'Edition')">USER EDITION</a>
    </div>

    <!-- TAB 1: LIST -->
    <div id="List" class="box tab-content active">
        <table>
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Fullname</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="u" items="${users}">
                    <tr>
                        <td>${u.id}</td>
                        <td>******</td>
                        <td>${u.fullname}</td>
                        <td>${u.email}</td>
                        <td>
                            <span style="padding: 4px 8px; border-radius: 4px; background: ${u.admin ? 'rgba(244, 63, 94, 0.2)' : 'rgba(99, 102, 241, 0.2)'}; color: ${u.admin ? 'var(--danger-hover)' : 'var(--primary-hover)'}; font-size: 12px; font-weight: bold;">
                                ${u.admin ? 'Admin' : 'User'}
                            </span>
                        </td>
                        <td><a href="${pageContext.request.contextPath}/admin/user/edit?id=${u.id}">Edit</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- TAB 2: EDITION -->
    <div id="Edition" class="box tab-content">
        <form action="${pageContext.request.contextPath}/admin/user/update" method="post">
            <div style="display: flex; gap: 20px;">
                <div class="form-group">
                    <label>USERNAME?</label>
                    <input type="text" name="username" value="${user.id}" class="form-control" readonly placeholder="Chọn User từ danh sách để sửa">
                </div>
                <div class="form-group">
                    <label>PASSWORD?</label>
                    <input type="password" name="password" value="${user.password}" class="form-control" required>
                </div>
            </div>

            <div style="display: flex; gap: 20px;">
                <div class="form-group">
                    <label>FULLNAME?</label>
                    <input type="text" name="fullname" value="${user.fullname}" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>EMAIL ADDRESS?</label>
                    <input type="email" name="email" value="${user.email}" class="form-control" required>
                </div>
            </div>

            <div class="checkbox-group">
                <label style="margin-bottom: 0; color: var(--text-main);"><b>ROLE:</b></label>
                <input type="checkbox" name="admin" value="true" ${user.admin ? 'checked' : ''} style="accent-color: var(--primary); width: 18px; height: 18px;"> 
                <span>Administrator</span>
            </div>

            <div class="btn-group">
                <button type="submit" class="btn btn-update" ${!isEdit ? 'disabled' : ''}>Update</button>
                <a href="${pageContext.request.contextPath}/admin/user/delete?id=${user.id}" class="btn btn-delete ${!isEdit ? 'disabled' : ''}" onclick="return confirm('Bạn có chắc muốn xóa user này?');">Delete</a>
                <a href="${pageContext.request.contextPath}/admin/user/reset" class="btn btn-reset">Reset</a>
            </div>
        </form>
    </div>

    <script>
        function openTab(evt, tabName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tab-content");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
                tabcontent[i].classList.remove("active");
            }
            tablinks = document.getElementsByClassName("tab");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(tabName).style.display = "block";
            
            // Timeout nhỏ để kích hoạt CSS animation
            setTimeout(() => {
                document.getElementById(tabName).classList.add("active");
            }, 10);
            
            evt.currentTarget.className += " active";
        }
    </script>
</body>
</html>