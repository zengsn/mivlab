<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'subm.jsp' starting page</title>
    <title></title>
    <style type="text/css">
        a:link, a:visited {
            color: #EEEEEE;
            text-decoration: none;
            font-family: 微软雅黑;
            font-size:11pt;
            font-weight: bold;
        }

        a:hover {
            color: #FFFFFF;
            text-decoration: none;
            font-family: 微软雅黑;
            font-size:11pt;
            font-weight: bold;
        }

        a:active {
            color: #EEEEEE;
            text-decoration: none;
            font-family: 微软雅黑;
            font-size:11pt;
            font-weight: bold;
        }

        div {
            color: #EEEEEE;
            font-family: 微软雅黑;
        }
    </style>
</head>
<body style="margin: 0px 0px 0px 0px;">
	<img width="100%" height="98%" alt="" src="<%=basePath%>images/g1.jpg">
</body>
</html>
