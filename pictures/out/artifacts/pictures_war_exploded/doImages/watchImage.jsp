<%@ page import="dao.PicDao" %>
<%@ page import="pojo.Pic" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
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

            $(".fullsrceen .button").click(function () {
                $(".fullsrceen").hide();
            });


        })

        function del() {
            var msg = "您真的确定要删除吗？\n\n请确认！";
            if (confirm(msg) == true) {
                $(".fullsrceen").hide();
                return true;
            } else {
                return false;
            }
        }
    </script>
</head>
<body>
<div class="left-top" style="position:fixed;width:100%;z-index:5500;">
    <li style="margin-left:10px;font-size:18px;">位置：<a href="#" style="color:silver;">首页</a></li>
</div>

<div style="padding-top:50px;overflow:hidden;">

    <div class="select-box">


        <form action="" method="post">
            <button type="button" id="button" onclick="getTag('country');" style="display:none;"></button>
            <label for="button" style="margin-top:10px;">COUNTRY</label>
            <div id="country" style="margin:0;height:auto;"></div>

            <p>KEY WORD</p>
            <input type="text" name="" value="" class="inputBox">
            <input id="submit" type="submit" name="" value="" style="display:none;">
            <label for="submit" class="tag" style="height:50px;width:100px;">SUBMIT</label>
        </form>
    </div>

    <div class="gallery">
        <!-- 图片加载在这里-->
        <%
            ArrayList<Pic> li = (ArrayList<Pic>) PicDao.getAllPictures();
            for (Pic pic : li) {
        %>

        <div>
            <img src="../img/0.jpeg" width="300"/>
            <li><%= pic.getId() %>
            </li>
            <%
                if (((User) session.getAttribute("user")).isAdmin()) {
            %>
            <button class="submit-button" onclick="javascript:return del();" style="background-color:red;color:black;">
                删除
            </button>
            <%} %>
            <div class="fullsrceen" style="top:0;
            left:0;
            width:100%;
            height:100%;
            position: fixed;
            z-index: 5500;
            background-color: rgba(10,10,10,.5);
            display:none;
            text-align:center;">
                <div class="box">
                    <img src="../img/0.jpeg"/>
                    <ul>
                        <li><%= pic.getId() %>
                        </li>
                        <li><%= pic.getPosition() %>
                        </li>
                        <li><%= pic.getResolution() %>
                        </li>
                        <li><%= pic.getLatitude() %>
                        </li>
                        <li><!--<%= pic.getAcquisition_time() %>--></li>
                        <li><%= pic.getScale() %>
                        </li>
                        <button class="button">退出</button>
                        <%
                            if (((User) session.getAttribute("user")).isAdmin()) {
                        %>
                        <button class="submit-button" onclick="javascript:return del();"
                                style="background-color:red;color:black;">删除
                        </button>
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
