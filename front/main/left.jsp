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
<title>无标题文档</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menu-son .header").click(function(){
		var $parent = $(this).parent();
		$(".menu-son>li.active").not($parent).removeClass("active open").find('.sub-menus').hide();
		
		$parent.addClass("active");
		if(!!$(this).next('.sub-menus').size()){
			if($parent.hasClass("open")){
				$parent.removeClass("open").find('.sub-menus').hide();
			}else{
				$parent.addClass("open").find('.sub-menus').show();	
			}
			
			
		}
	});
	
	// 三级菜单点击
	$('.sub-menus li').click(function(e) {
        $(".sub-menus li.active").removeClass("active")
		$(this).addClass("active");
    });
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('.menu-son').slideUp();
		if($ul.is(':visible')){
			$(this).next('.menu-son').slideUp();
		}else{
			$(this).next('.menu-son').slideDown();
		}
	});
})	
</script>


</head>

<body>
	<div class="left-top"><span></span>通讯录</div>
    
    <dl class="left-menu">
        
    <div class="group" style="margin-top:-1px;line-height: 35px;font-weight: bold;	font-size: 14px;"> 
    <div class="title">
    <span><img src="images/leftico01.png" style="margin:10px 10px;"/></span>个人信息
    </div>
    	<ul class="menu-son">
        <li><cite></cite><a href="user/userInfo.jsp" target="rightFrame">查看个人信息</a></li>
         <li><cite></cite><a href="user/reg.jsp" target="body">修改密码</a></li>
        </ul>    
    </div>
	   <div class="group" style="line-height: 35px;	font-weight: bold;	font-size: 14px;">
	    <div class="title">
	    <span><img src="images/leftico01.png" /></span>管理信息
	    </div>
	    	<ul class="menu-son">
	        <li><cite></cite><a href="user?oper=show" target="rightFrame">查看用户信息</a><i></i></li>
	        </ul>    
	    </div>
	    
	    
	    <div class="group" style="line-height: 35px;	font-weight: bold;	font-size: 14px;">
	    <div class="title">
	    <span><img src="images/leftico01.png" /></span>管理信息
	    </div>
	    	
    	<ul class="menu-son">
        <li><cite></cite><a href="doImages/addImage.jsp" target="rightFrame">图片上传</a><i></i></li>
        <li><cite></cite><a href="doImages/watchImage.jsp" target="rightFrame">图片查找</a><i></i></li>
        </ul>    
    </dl>
</body>
</html>
 