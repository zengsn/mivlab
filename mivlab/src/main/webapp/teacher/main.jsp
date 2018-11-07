<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>后台模板</title>
		
		<script src="./js/jquery-3.3.1.min.js"></script>
</head>
<body>
<script>
window.onload=function(){
	$.ajax({				
		url:'HomePage',
		type:'post',				
		success:function(data){
			window.location.href="<%=basePath %>InitSvlt?flgs=1&tbname=teacourse";
		}
	}) 

 }
</script> 
</head>
<body>	
	
	</body>
	
</html>



