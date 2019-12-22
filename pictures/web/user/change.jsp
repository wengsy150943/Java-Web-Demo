<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>changePasswd</title>
    <link rel="stylesheet" href="../css/styles.css">
    <script src="../js/signup.js"></script>
</head>
<body>
<div class="headerTag" style="position:fixed;width:100%;">
    <li style="margin-left:10px;font-size:18px;">位置：<a href="#" style="color:silver;">修改密码</a></li>
</div>

<div style="padding:50px;overflow:hidden;">

    <div class="wrap" style="float:left;">


        <div class="loginHtml">


            <form class="loginForm" action="../servlet/ChangePasswordServlet" method="post">¨¨</form>
        </div>
    </div>
</div>
</body>
</html>
