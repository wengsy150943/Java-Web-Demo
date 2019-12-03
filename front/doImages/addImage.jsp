<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>addImage</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <form name="simpleform" action="img" method="POST">
    <input type="hidden" name="oper2" value="add" />
	 <table border="1" style="width:400px;cellspacing:1px">
                <tr>
                    <td class="lalel">图片名称</td>
                    <td class="controler"><input type="text" name="name" /></td>
                </tr>
                <tr>
                    <td class="label">国家</td>
                    <td class="controler"><input type="text" name="country" ></td>
                    
                </tr>
                
                <tr>
                    <td class="label">位置</td>
                    <td class="controler">
                    <select name="position">
					  <option value ="东">东部</option>
					  <option value ="西">西部</option>
					  <option value ="南">南部</option>
					  <option value ="北">北部</option>
					</select>
                	</td>                    
                </tr>
                <tr>
                    <td class="label">分辨率</td>
                    <td class="controler"><input type="text" name="resolution" ></td>        
                </tr>
                <tr>
                    <td class="label">经度</td>
                    <td class="controler"><input type="text" name="longitude" ></td>        
                </tr>
                <tr>
                    <td class="label">纬度</td>
                    <td class="controler"><input type="text" name="latitude" ></td>        
                </tr>
                <tr>
                    <td class="label">上传日期</td>
                    <td class="controler"><input type="text" name="acquisition_time" ></td>        
                </tr>
                <tr>
                    <td class="label">比例尺</td>
                    <td class="controler"><input type="text" name="scale" ></td>        
                </tr>
                <tr>
                    <td class="lalel">上传图片</td>
                    <td class="controler"><input type="file" name="Resume" />
                    </td>
                </tr>
                <tr>
                    <td class="lalel"></td>
                    <td class="controler"><button type="submit">ok</button>
                    </td>
                </tr>
		</table>
	</form>
  </body>
</html>
