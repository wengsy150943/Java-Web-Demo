<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>signup</title>
    <link rel="stylesheet" href="../css/styles.css">
    <script src="../js/signup.js"></script>
</head>
<body>
<div class="left-top" style="position:fixed;width:100%;">
    <li style="margin-left:10px;font-size:18px;">位置：<a href="#" style="color:silver;">首页</a></li>
</div>

<div style="padding:50px;overflow:hidden;">

    <div class="login-wrap" style="float:left;">


        <div class="login-html">
            <label class="sign-up tab">CHANGE PASSWORD</label>


            <form class="login-form" action="../servlet/ChangePasswordServlet" method="post">

                <div class="group">
                    <label for="name" class="label">Name</label>
                    <input id="name" name="username" type="text" class="input" value="" required="">
                </div>

                <div class="group">
                    <label for="old-password" class="label" id="passwordLabel">Old Password</label>
                    <input id="old-password" name="oldPassword" type="password" class="input" data-type="password"
                           required="" minlength="6">
                </div>

                <div class="group">
                    <label for="password" class="label" id="passwordLabel">Password</label>
                    <input id="password" name="newPassword" type="password" class="input" data-type="password"
                           required=""
                           minlength="6">
                </div>


                <div class="group">
                    <label for="password-confirm" class="label">Repeat Password</label>
                    <input id="password-confirm" name="password-confirm" type="password" class="input"
                           data-type="password" required="" minlength="6" onblur="checkPasswd();">
                </div>
                <div id="repeat-passwd-notice" style="display:none;height:20px;width:200px;color:red;font-size:10px;">
                    请输入相同的密码！
                </div>

                <div id="status" style="height:20px;width:200px;color:red;font-size:10px;">
                    ${status }
                </div>


                <div class="group">
                    <input type="submit" class="button" value="Sign Up">
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
