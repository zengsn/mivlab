<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>退出登录</title>
</head>
<body>
<% 
 session.removeAttribute("other");  //前台展示的内容
 session.removeAttribute("userid");
 session.removeAttribute("utype");
 session.removeAttribute("navlist");
 session.removeAttribute("snavlist");
 session.removeAttribute("userinfo");
 
 
 response.sendRedirect("index.jsp"); 
 %>
</body>
</html>