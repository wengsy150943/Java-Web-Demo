<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>信息管理系统界面</title>
</head>
<frameset rows="88,*,31" cols="*" frameborder="no" border="0"
          framespacing="0">
    <frame src="top.jsp" name="topFrame" scrolling="no"
           noresize="noresize" id="topFrame" title="topFrame" style="height:50px;margin-bottom:0;"/>
    <frameset cols="187,*" frameborder="no" border="0" framespacing="0">
        <frame src="left.html" name="leftFrame" scrolling="no"
               noresize="noresize" id="leftFrame" title="leftFrame" />
        <frame src="../user/change.jsp" name="rightFrame" id="rightFrame"
               title="rightFrame" />
    </frameset>
    <frame src="footer.html" name="bottomFrame" scrolling="no"
           noresize="noresize" id="bottomFrame" title="bottomFrame" />
</frameset>
<noframes>
    <body>
    </body>
</noframes>
</html>
