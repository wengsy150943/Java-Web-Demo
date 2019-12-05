<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>signup</title>
    <link rel="stylesheet" href="../css/styles.css">
    <script src="../js/signup.js"></script>
  </head>
<body style="background: url('../img/0.jpeg') no-repeat center;background-size:cover;">
    <div class="login-wrap">


    <div class="login-html">
      <label class="sign-up tab">CHANGE PASSWORD</label>



      <form class="login-form" action="../main/main.jsp" method="post">

        <div class="group">
            <label for="name" class="label">Name</label>
            <input id="name" name="uname" type="text" class="input" value="" required="">
        </div>
        
        <div class="group">
            <label for="old-password" class="label" id="passwordLabel">Old Password</label>
            <input id="old-password" name="pwd" type="password" class="input" data-type="password" required="" minlength="6">
        </div>

        <div class="group">
            <label for="password" class="label" id="passwordLabel">Password</label>
            <input id="password" name="pwd" type="password" class="input" data-type="password" required="" minlength="6">
        </div>


        <div class="group">
            <label for="password-confirm" class="label">Repeat Password</label>
            <input id="password-confirm" name="password-confirm" type="password" class="input" data-type="password" required="" minlength="6" onblur="checkPasswd();">
        </div>
        <div id="repeat-passwd-notice"style="display:none;height:20px;width:200px;color:red;font-size:5px;">
            请输入相同的密码！
        </div>
            
        
              
        <div class="group">
            <input type="submit" class="button" value="Sign Up">
        </div>
      </form>
    </div>

    </div>
  </body>
</html>
