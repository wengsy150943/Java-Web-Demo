<%@ page language="java" import="java.util.*,pojo.User" pageEncoding="utf-8"%>
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
<link href="../css/styles.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });

  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});
</script>


</head>


<body class="addWrap">

  <div class="headerTag">
    <li style="margin-left:10px;font-size:18px;">位置：

    <a href="#" style="color:silver;">首页</a>
    <a href="#" style="color:silver;">个人信息</a>
    <a href="#" style="color:silver;">查看个人信息</a>
    </li>
  </div>


      <div class="addForm">
        <table border="1" style="border-radius: 5px; width:400px;cellspacing:1px">
                     <tr>
                         <td class="label">用户名</td>
                         <td class="controler"><%=((User)session.getAttribute("user")).getUsername() %></td>
                     </tr>

     		</table>


      </div>



    </div>


</body>

</html>
