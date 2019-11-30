<%@ page language="java" import="java.util.*,com.bjsxt.pojo.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/mainpage.css" rel="stylesheet" type="text/css" />

<script language="JavaScript" src="js/jquery.js"></script>
<script type="text/javascript">
$(function(){
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})
	//退出功能
	$("#out").click(function(){
		var flag=window.confirm("你真的要退出吗?");
		if(flag){
			window.top.location.href="user?oper=out";
		}
	})


})
</script>


</head>

<body style="background-color:black;">



    <button class="button" onclick="$()" style="float:right;height:70px;line-height:70px;width:100px;color:white;font-size:18px;">
    	退出
    </button>



    <div class="button" style="float:right;height:70px;line-height:70px;width:auto;color:white;font-size:18px;">
    	这里需要返回当前用户名
    </div>

    </div>

</body>
</html>
