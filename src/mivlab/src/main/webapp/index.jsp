<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html >
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基于GitHub的实验教学管理平台</title>
<script src="<%=basePath%>js/jquery-3.3.1.min.js"></script>
</head>
<body>
<script>
window.onload=function(){
	$.ajax({				
		url:'<%=basePath%>HomePage',
		type:'post',				
		success:function(data){	
			
			window.location.href="<%=basePath%>indexShow.jsp";
			
		}
	}) 

 }
</script> 

</body>
</html>