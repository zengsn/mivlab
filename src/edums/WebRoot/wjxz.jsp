<%@ page language="java" import="java.util.*,java.io.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'wjxz.jsp' starting page</title>
    
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
<%
    out.clear();
    out = pageContext.pushBody();
    response.setContentType("application/x-msdownload");
    String wjm  = request.getParameter("wjm");
    response.addHeader("Content-Disposition","attachment;fileName="+wjm);
    OutputStream os = response.getOutputStream(); 
    String filepath = getServletContext().getRealPath("")+java.io.File.separator+"stufile"+java.io.File.separator+wjm;
    FileInputStream fis = new FileInputStream(filepath); 
    try{
        byte[] b = new byte[1024]; 
        int m = 0;
        while ( (m = fis.read(b)) > 0 ){ 
            os.write(b, 0, m); //写文件
        } 
        fis.close(); 
        os.flush(); 
        os.close(); 
    }
    catch(Exception e){
        fis.close();
        os.flush();
        os.close();
    }
    
%>
  </body>
</html>
