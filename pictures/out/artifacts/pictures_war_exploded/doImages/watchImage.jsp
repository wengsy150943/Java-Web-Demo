<%@ page import="dao.PicDao" %>
<%@ page import="pojo.Pic" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>mainpage</title>
    <link rel="stylesheet" href="../css/mainpage.css">
    <link rel="stylesheet" href="../css/styles.css">
    <script src="../js/mainpage.js"></script>
    <script language="JavaScript" src="../js/jquery.js"></script>
    <script type="text/javascript">
        $(function () {
            $("img").click(function () {
                var $tar = $(this).next("");
                $tar.next().next().show();
            });

            $(".fullSrceen .button").click(function () {
                $(".fullSrceen").hide();
            });


        })

        function del() {
            var msg = "请确认删除信息！";
            if (confirm(msg) == true) {
                $(".fullSrceen").hide();
                return true;
            } else {
                return false;
            }
        }
    </script>
</head>
<body>
<div class="headerTag" style="position:fixed;width:100%;z-index:5500;">
    <li style="margin-left:10px;font-size:18px;">位置：<a href="#" style="color:silver;">首页</a></li>
</div>

<div style="padding-top:50px;overflow:hidden;">

    <div class="selectBox">


        <form action="watchImage.jsp" method="post">
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
                    <td class="label">关键词</td>

                </tr>
                <tr>
                    <td class="controler"><input type="text" name="acquisition_time"></td>
                    <td class="controler"><input type="text" name="scale"></td>
                    <td class="controler"><input type="text" name="key_word"/></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="controler">
                        <button class="button" style="width:100%;" type="submit">查询</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>

    <div class="gallery">
        <!-- 图片加载在这里-->
        <%
            PicDao picDao = new PicDao();
            ArrayList<Pic> li = picDao.getPicturesByName(request.getParameter("key_word"));

            for (Pic pic : li) {
                System.out.println(pic);
                String name, country, position, resolution, scale, longitude, latitude, acquisition_time;
                name = request.getParameter("name");
                country = request.getParameter("country");
                position = request.getParameter("position");
                resolution = request.getParameter("resolution");
                longitude = request.getParameter("longitude");
                latitude = request.getParameter("latitude");
                acquisition_time = request.getParameter("acquisition_time");
                scale = request.getParameter("scale");

                if (name != null && !name.equals("") && !name.equals(pic.getName())) continue;
                if (country != null && !country.equals("") && !country.equals(pic.getCountry())) continue;
                if (position != null && !position.equals("") && !position.equals(pic.getPosition())) continue;
                if (resolution != null && !resolution.equals("") && !resolution.equals(pic.getResolution())) continue;
                if (scale != null && !scale.equals("") && !scale.equals(pic.getScale())) continue;
                if (acquisition_time != null && !acquisition_time.equals("") && !acquisition_time.equals(pic.getAcquisition_time()))
                    continue;
                if (latitude != null && !latitude.equals("") && !latitude.equals(pic.getLatitude())) continue;
                if (longitude != null && !longitude.equals("") && !longitude.equals(pic.getLongitude())) continue;
        %>

        <div>
            <img src="../pictures/<%= pic.getId() %>" width="300" style="background: rgba(0,0,0,.7);padding: 10px 10px;"/>
            <li><%= pic.getName() %>
            </li>
            <%
                if (((User) session.getAttribute("user")).isAdmin()) {
            %>
            <form action="../servlet/DeleteServlet" method="POST" style="float:left;">
                <input type="text" name="id" value="<%= pic.getId()%>" style="display:none;">
                <input type="submit" value="删除" class="button"
                       onclick="del()" style="color:red;">
            </form>
            <%} %>
            <div class="fullSrceen" style="top:0;
            left:0;
            width:100%;
            height:100%;
            position: fixed;
            overflow:auto;
            z-index: 5500;
            background-color: rgba(10,10,10,.5);
            display:none;
            text-align:center;">
                <div class="box">
                    <img src="../pictures/<%= pic.getId() %>"/>
                    <ul>
                        <li>国家：<%= pic.getCountry() %>
                        </li>
                        <li>位置：<%= pic.getPosition() %>
                        </li>
                        <li>分辨率：<%= pic.getResolution() %>
                        </li>
                        <li>经度：<%= pic.getLongitude() %>
                        </li>
                        <li>纬度：<%= pic.getLatitude() %>
                        </li>
                        <li>上传时间：<%= pic.getAcquisition_time() %>
                        </li>

                        <button class="button" style="float:left;">退出</button>
                        <%
                            if (((User) session.getAttribute("user")).isAdmin()) {
                        %>
                        <form action="../servlet/DeleteServlet" method="POST" style="float:left;">
                            <input type="text" name="id" value="<%= pic.getId()%>" style="display:none;">
                            <input type="submit" value="删除" class="button"
                                   onclick="del()" style="color:red;">
                        </form>
                        <%} %>
                    </ul>
                </div>
            </div>
        </div>
        <%}%>
    </div>
</div>
</div>
</body>
</html>
