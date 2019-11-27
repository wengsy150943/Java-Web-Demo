
<!--
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>signin</title>
    <link rel="stylesheet" href="css/styles.css">
    <script src="js/signin.js"></script>
  </head>
  <body>
    <div class="login-wrap">


    <div class="login-html">
      <label class="sign-up tab">SIGN IN</label>
      <label class="sign-up tab"><a href="signup.html">SIGN UP</a></label>



      <form class="login-form" action="index.html" method="post">

        <div class="group">
            <label for="name" class="label">Name</label>
            <input id="name" name="uname" type="text" class="input" value="" required="" pattern="[A-z0-9À-ž]+-?[A-z0-9À-ž]+" title="Name doesn&#39;t follow the pattern. Only latin letters are allowed.">
        </div>

        <div class="group">
            <label for="password" class="label" id="passwordLabel">Password</label>
            <input id="password" name="pwd" type="password" class="input" data-type="password" required="" minlength="6" onblur="checkPasswd">
        </div>
        <div id="passwd-notice"style="display:none;height:20px;width:200px;color:red;font-size:5px;">
            密码和用户名不一致或用户不存在！请重新检查输入！
        </div>
        <div class="group">
            <input type="submit" class="button" value="Sign Up">
        </div>
      </form>
    </div>

    </div>
  </body>
</html>

-->

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎登录后台管理系统</title>
<script language="JavaScript" src="js/jquery.js"></script>
<script src="js/cloud.js" type="text/javascript"></script>
<link rel="stylesheet" href="css/styles.css">
<script src="js/signin.js"></script>
<script language="javascript">
	$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })
});
</script>

</head>

<body >



    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>


<div class="login-wrap">



    <div class="login-html">

			<span class="sign-up tab">欢迎登录J2EE期末作业平台</span>
			<br/>
			<label class="sign-up tab">SIGN IN</label>
			<label class="sign-up tab"><a href="signup.html">SIGN UP</a></label>


    <span class="systemlogo"></span>
    <br />
    <%
    	//声明java代码块进行错误提示语的逻辑校验
    	Object obj=request.getAttribute("flag");
    	if(obj!=null){
    %>
	    <div style="text-align: center;">
	     <span style="font-size: 15px;color:darkred;font-weight: bold;">用户名或者密码错误</span>
	    </div>
    <%} %>
   <%
    	//声明java代码块进行密码修改提示语
    	Object pwd=session.getAttribute("pwd");
    	if(pwd!=null){
    %>
	    <div style="text-align: center;">
	     <span style="font-size: 15px;color:darkred;font-weight: bold;">密码修改成功</span>
	    </div>
    <%}
    	session.removeAttribute("pwd");
    %>
       <%
    	//声明java代码块进行注册提示语
    	Object reg=session.getAttribute("reg");
    	if(reg!=null){
    %>
	    <div style="text-align: center;">
	     <span style="font-size: 15px;color:darkred;font-weight: bold;">注册成功</span>
	    </div>
    <%}
    	session.removeAttribute("reg");
    %>



    <form action="user" method="post"  class="login-form">
    	<input type="hidden" name="oper" value="login" />
    	<ul>

			<div class="group">
					<label for="name" class="label">Name</label>
					<input id="name" name="uname" type="text" class="input" value="" required="" pattern="[A-z0-9À-ž]+-?[A-z0-9À-ž]+" title="Name doesn&#39;t follow the pattern. Only latin letters are allowed.">
			</div>

			<div class="group">
					<label for="password" class="label" id="passwordLabel">Password</label>
					<input id="password" name="pwd" type="password" class="input" data-type="password" required="" minlength="6" onblur="checkPasswd">
			</div>
			<div id="passwd-notice"style="display:none;height:20px;width:200px;color:red;font-size:5px;">
					密码和用户名不一致或用户不存在！请重新检查输入！
			</div>
			<div class="group">
					<input type="submit" class="button" value="Sign Up">
			</div>
			<!--
	    <li><input name="uname" type="text" placeholder="用户名" class="loginuser"  /></li>
	    <li><input name="pwd" type="password" placeholder="密码" class="loginpwd"  /></li>
	    <li class="yzm">
	    <span><input name="" type="text" value="验证码" onclick="JavaScript:this.value=''"/></span><cite>X3D5S</cite>
	    </li>
	    <li><input name="" type="submit" class="loginbtn" value="登录"  onclick="javascript:window.location='main.html'"  /><label><a href="user/reg.jsp">注册</a></label><label><a href="#">忘记密码？</a></label></li>
	   </ul>
	 -->
    </form>

		<div class="loginbm">版权所有 yhh <a href="http://www.ecnu.edu.cn">点这里访问我的学校主页</a>  期末作业加油！</div>

    </div>
  </div>



</body>

</html>
