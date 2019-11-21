<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="user.User" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>My JSP 'success.jsp' starting page</title>
</head>
<body>
<%User user = (User) session.getAttribute("user");%>
"Congratulations! Login success!";<br>
username:<%= user.getName()%> <br>
password:<%= user.getPassword() %> <br>
basePath: <%=basePath%><br>
path:<%=path%><br>
</body>
</html>