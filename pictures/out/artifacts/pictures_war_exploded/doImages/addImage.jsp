<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>addImage</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <link rel="stylesheet" type="text/css" href="../css/styles.css">

</head>

<body>
<div class="headerTag" style="position:fixed;width:100%;z-index:5500;">
    <li style="margin-left:10px;font-size:18px;">位置：
        <a href="#" style="color:silver;">首页</a>
    </li>
</div>
<form name="simpleform" action="../servlet/UploadServlet" method="POST" enctype="multipart/form-data">
    <input type="hidden" name="oper2" value="add"/>
    <table class="addForm" border="0" style="color: darkgrey;border-radius: 5px; width:auto; cellspacing:1px">
        <tr>
            <td class="label">图片名称</td>
            <td class="label">国家</td>
            <td class="label">位置</td>
        </tr>
        <tr>
            <td class="controler"><input type="text" name="name"/></td>
            <td class="controler"><input type="text" name="country"></td>
            <td class="controler">
                <select margin:0 20%; name="position">
                    <option value="东">东部</option>
                    <option value="西">西部</option>
                    <option value="南">南部</option>
                    <option value="北">北部</option>
                </select>
            </td>
        </tr>

        <tr>
            <td class="label">分辨率</td>
            <td class="label">经度</td>
            <td class="label">纬度</td>
        </tr>
        <tr>
            <td class="controler"><input type="text" name="resolution"></td>
            <td class="controler"><input type="text" name="longitude"></td>
            <td class="controler"><input type="text" name="latitude"></td>
        </tr>
        <tr>
            <td class="label">上传日期</td>
            <td class="label">比例尺</td>
            <td class="label">上传图片</td>

        </tr>
        <tr>
            <td class="controler"><input type="text" name="acquisition_time"></td>
            <td class="controler"><input type="text" name="scale"></td>
            <td class="controler"><input type="file" name="filename" multiple/></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="controler">
                <button class="button" style="width:100%;" type="submit">完成</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
