<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>欢迎登录后台管理系统</title>
    <script language="JavaScript" src="./js/jquery.js"></script>
    <link rel="stylesheet" href="./css/styles.css">
    <link rel="stylesheet" href="./css/start.css">

    <script src="./js/signin.js"></script>
    <script language="javascript">
        $(function(){
            $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
            $(window).resize(function(){
                $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
            })
        });
    </script>

</head>

<body class="bg">




<div class="Wrap">



    <div class="loginHtml">

        <span class="sign-up tab">欢迎登录J2EE期末作业平台</span>
        <br/>
        <label class="sign-up tab">登陆</label>
        <label class="sign-up tab"><a href="user/signup.jsp">注册</a></label>


        <form action="servlet/LoginServlet" method="post"  class="login-form">
            <input type="hidden" name="oper" value="login" />
            <ul>

                <div class="group">
                    <label for="name" class="label">姓名</label>
                    <input id="name" name="username" type="text" class="input" value="" required="" pattern="[A-z0-9À-ž]+-?[A-z0-9À-ž]+" title="Name doesn&#39;t follow the pattern. Only latin letters are allowed.">
                </div>

                <div class="group">
                    <label for="password" class="label" id="passwordLabel">密码</label>
                    <input id="password" name="password" type="password" class="input" data-type="password" required="" minlength="6">
                </div>

                <div class="group">
                    <input type="submit" class="button" value="Sign In">
                </div>

        </form>

        <span style="color: red; ">${status }</span>


    </div>
</div>



</body>

</html>
