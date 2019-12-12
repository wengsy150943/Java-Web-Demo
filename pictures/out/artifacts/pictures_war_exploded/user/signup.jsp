<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>register</title>
    <link rel="stylesheet" href="../css/styles.css">
    <script src="../js/signup.js"></script>
</head>
<body style="background: url('../img/0.jpeg') no-repeat center;background-size:cover;">
<div class="wrap">


    <div class="loginHtml">
        <label class="sign-up tab">注册</label>


        <form class="loginForm" action="../servlet/RegisterServlet" method="post">

            <div class="group">
                <label for="name" class="label">姓名</label>
                <input id="name" name="username" type="text" class="input" value="" required="">
            </div>



            <div class="group">
                <label for="password" class="label" id="passwordLabel">密码</label>
                <input id="password" name="password" type="password" class="input" data-type="password" required=""
                       minlength="6">
            </div>


            <div class="group">
                <label for="password-confirm" class="label">重复密码</label>
                <input id="password-confirm" name="password-confirm" type="password" class="input" data-type="password"
                       required="" minlength="6" onblur="checkPasswd();">
            </div>
            <div id="repeat-passwd-notice" style="display:none;height:20px;width:200px;color:red;font-size:10px;">
                请输入相同的密码！
            </div>

            <div class="group">
                <input type="submit" class="button" value="Sign Up">
            </div>
            <span style="color: red; ">${status}</span>

        </form>
    </div>

</div>
</body>
</html>
