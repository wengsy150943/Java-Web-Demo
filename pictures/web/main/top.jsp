<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="../css/styles.css" rel="stylesheet" type="text/css" />

<script language="JavaScript" src="../js/jquery.js"></script>
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

<body style="background-color:#1a2933;height:50px;">


  <button id="out" onclick="$()" style="background-color: inherit;border: 0;float:right;height:50px;line-height:50px;width:100px;color:white;font-size:18px;">
    	退出
    </button>
  <div class="button" style="float:right;height:50px;line-height:50px;width:auto;color:white;font-size:18px;">
    	${curUsername}
    </div>

    </div>

</body>
</html>
