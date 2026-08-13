<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý Video - Admin</title>
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
            --accent-hover: #34D399;
            
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

        /* Container */
        .box {
            background: var(--bg-card);
            border: 1px solid var(--border);
            border-radius: 0 0 var(--radius-lg) var(--radius-lg);
            padding: 30px;
            width: 100%;
            max-width: 1000px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.3);
        }

        /* Tabs */
        .tabs {
            display: flex;
            width: 100%;
            max-width: 1000px;
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

        .tab-content { display: none; }
        .tab-content.active { display: block; }

        /* Forms */
        .form-group {
            margin-bottom: 20px;
            flex: 1;
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
            padding: 12px 16px;
            background: var(--bg-body);
            border: 1px solid var(--border);
            border-radius: 8px;
            color: var(--text-main);
            transition: all 0.3s ease;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        textarea.form-control {
            resize: vertical;
            min-height: 100px;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.2);
        }

        .form-control[readonly] {
            background: rgba(15, 23, 42, 0.4) !important;
            color: var(--text-muted);
            cursor: not-allowed;
            border-color: transparent;
        }

        .checkbox-group {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-top: 25px;
        }

        /* Image Preview Area */
        .poster-preview {
            border: 2px dashed var(--border-light);
            border-radius: var(--radius-md);
            height: 240px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: rgba(15, 23, 42, 0.4);
            margin-bottom: 15px;
            overflow: hidden;
            position: relative;
        }

        .poster-preview img {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
        }

        .poster-preview span {
            color: var(--text-muted);
            font-weight: 600;
            letter-spacing: 1px;
        }

        /* Tables */
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 8px;
            overflow: hidden;
            border: 1px solid var(--border);
        }

        th, td {
            padding: 14px 16px;
            text-align: left;
            border-bottom: 1px solid var(--border);
        }

        th {
            background: rgba(15, 23, 42, 0.8);
            color: var(--text-muted);
            font-size: 13px;
            text-transform: uppercase;
            font-weight: 600;
        }

        td { background: var(--bg-card); }
        tr:last-child td { border-bottom: none; }
        
        tr:hover td { background: var(--bg-card-hover); }

        td a {
            color: var(--primary-hover);
            text-decoration: none;
            font-weight: 600;
        }
        td a:hover { text-decoration: underline; }

        /* Buttons */
        .btn-group {
            text-align: right; 
            border-top: 1px solid var(--border); 
            padding-top: 20px;
            margin-top: 10px;
            display: flex;
            justify-content: flex-end;
            gap: 12px;
        }

        .btn {
            padding: 10px 20px;
            font-weight: 600;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            transition: all 0.3s ease;
            font-size: 14px;
        }

        .btn-create { background: var(--accent); color: white; }
        .btn-create:hover:not([disabled]) { background: var(--accent-hover); transform: translateY(-2px); }
        .btn-create[disabled] { opacity: 0.5; cursor: not-allowed; }

        .btn-update { background: var(--primary); color: white; }
        .btn-update:hover:not([disabled]) { background: var(--primary-hover); transform: translateY(-2px); }
        .btn-update[disabled] { opacity: 0.5; cursor: not-allowed; }
        
        .btn-delete { background: var(--danger); color: white; }
        .btn-delete:hover:not(.disabled) { background: var(--danger-hover); transform: translateY(-2px); }
        .btn-delete.disabled { opacity: 0.5; cursor: not-allowed; pointer-events: none; }
        
        .btn-reset { background: var(--border-light); color: white; }
        .btn-reset:hover { background: var(--text-muted); transform: translateY(-2px); }

        .message-alert {
            color: var(--danger-hover);
            font-style: italic;
            margin-bottom: 15px;
            font-weight: 500;
        }
    </style>
</head>
<body>

    <!-- Nhúng Menu Admin -->
    <jsp:include page="../admin-menu.jsp" />

    <c:if test="${not empty message}">
        <div class="message-alert">${message}</div>
    </c:if>

    <!-- TABS -->
    <div class="tabs">
        <a class="tab active" onclick="openTab(event, 'List')">VIDEO LIST</a>
        <a class="tab" onclick="openTab(event, 'Edition')">VIDEO EDITION</a>
    </div>

    <!-- NỘI DUNG TAB: LIST (TAB 1) -->
    <div id="List" class="box tab-content active">
        <table>
            <thead>
                <tr>
                    <th>Youtube Id</th>
                    <th>Video Title</th>
                    <th>View Count</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="v" items="${videos}">
                    <tr>
                        <td>${v.id}</td>
                        <td style="font-weight: 500;">${v.title}</td>
                        <td>${v.views}</td>
                        <td>
                            <span style="padding: 4px 8px; border-radius: 4px; background: ${v.active ? 'rgba(16, 185, 129, 0.2)' : 'rgba(244, 63, 94, 0.2)'}; color: ${v.active ? 'var(--accent)' : 'var(--danger-hover)'}; font-size: 12px; font-weight: bold;">
                                ${v.active ? 'Active' : 'Inactive'}
                            </span>
                        </td>
                        <td><a href="${pageContext.request.contextPath}/admin/video/edit?id=${v.id}">Edit</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- NỘI DUNG TAB: EDITION (TAB 2) -->
    <div id="Edition" class="box tab-content">
        <form action="${pageContext.request.contextPath}/admin/video/${isEdit ? 'update' : 'create'}" method="post">
            <div style="display: flex; gap: 30px; flex-wrap: wrap;">
                <!-- Cột trái: Poster -->
                <div style="flex: 1; min-width: 280px; text-align: center;">
                    <div class="poster-preview">
                        <img src="${not empty video.poster ? pageContext.request.contextPath.concat('/images/').concat(video.poster) : ''}" alt="POSTER" style="${empty video.poster ? 'display:none;' : ''}" id="posterImg">
                        <span style="${not empty video.poster ? 'display:none;' : ''}" id="posterText">POSTER PREVIEW</span>
                    </div>
                    <div class="form-group" style="text-align: left;">
                        <input type="text" name="poster" value="${video.poster}" class="form-control" placeholder="Tên file ảnh (vd: poster.png)..." oninput="document.getElementById('posterImg').src='${pageContext.request.contextPath}/images/' + this.value; document.getElementById('posterImg').style.display='block'; document.getElementById('posterText').style.display='none';">
                    </div>
                </div>

                <!-- Cột phải: Thông tin -->
                <div style="flex: 2; min-width: 300px;">
                    <div class="form-group">
                        <label>YOUTUBE ID?</label>
                        <input type="text" name="id" value="${video.id}" class="form-control" ${isEdit ? 'readonly' : 'required'}>
                    </div>
                    <div class="form-group">
                        <label>VIDEO TITLE?</label>
                        <input type="text" name="title" value="${video.title}" class="form-control" required>
                    </div>
                    <div style="display: flex; gap: 20px;">
                        <div class="form-group" style="flex: 1;">
                            <label>VIEW COUNT?</label>
                            <input type="number" name="views" value="${empty video.views ? 0 : video.views}" class="form-control" required>
                        </div>
                        <div class="checkbox-group" style="flex: 1;">
                            <label style="margin-bottom: 0; color: var(--text-main);"><b>STATUS:</b></label>
                            <input type="checkbox" name="active" value="true" ${video.active ? 'checked' : ''} style="accent-color: var(--primary); width: 18px; height: 18px;"> 
                            <span>Active</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group" style="margin-top: 10px;">
                <label>DESCRIPTION?</label>
                <textarea name="description" class="form-control" rows="4">${video.description}</textarea>
            </div>

            <div class="btn-group">
                <button type="submit" class="btn btn-create" ${isEdit ? 'disabled' : ''}>Create</button>
                <button type="submit" formaction="${pageContext.request.contextPath}/admin/video/update" class="btn btn-update" ${!isEdit ? 'disabled' : ''}>Update</button>
                <a href="${pageContext.request.contextPath}/admin/video/delete?id=${video.id}" class="btn btn-delete ${!isEdit ? 'disabled' : ''}" onclick="return confirm('Xác nhận xóa video này?');">Delete</a>
                <a href="${pageContext.request.contextPath}/admin/video/reset" class="btn btn-reset">Reset</a>
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
            
            setTimeout(() => {
                document.getElementById(tabName).classList.add("active");
            }, 10);
            
            evt.currentTarget.className += " active";
        }
    </script>
</body>
</html>