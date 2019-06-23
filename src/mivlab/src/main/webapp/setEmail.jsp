<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
String path = request.getContextPath();String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%	request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>基于GitHub的教学管理系统——绑定邮箱</title>
</head>
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">    
    <meta name="msapplication-TileColor" content="#2d89ef">
    <meta name="theme-color" content="#4188c9">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="HandheldFriendly" content="True">
    <meta name="MobileOptimized" content="320">
    <link rel="icon" href="./favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" type="image/x-icon" href="./favicon.ico" />
    <!-- Generated: 2018-04-06 16:27:42 +0200 -->
    <title>平台入口</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!--    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,500,500i,600,600i,700,700i&amp;subset=latin-ext"> --> 
    <script src="<%=basePath%>assets/js/require.min.js"></script>
   
    <!-- Dashboard Core -->
    <link href="<%=basePath%>assets/css/dashboard.css" rel="stylesheet" />
    <script src="<%=basePath%>assets/js/dashboard.js"></script>
    <!-- c3.js Charts Plugin -->
    <link href="<%=basePath%>assets/plugins/charts-c3/plugin.css" rel="stylesheet" />
    <script src="<%=basePath%>assets/plugins/charts-c3/plugin.js"></script>
    <!-- Google Maps Plugin -->
    <link href="<%=basePath%>assets/plugins/maps-google/plugin.css" rel="stylesheet" />
    <script src="<%=basePath%>assets/plugins/maps-google/plugin.js"></script>
    <!-- Input Mask Plugin -->
    <script src="<%=basePath%>assets/plugins/input-mask/plugin.js"></script>
  </head>
<body class="">

<div class="page">
      <div class="page-single">
        <div class="container">
          <div class="row">
            <div class="col col-login mx-auto">
              <div class="text-center mb-6">
                
              </div>
              <div class="card" >
                <div class="card-body p-6">
                  <div class="card-title">设置用户邮箱</div>
                  <div class="form-group">
                    <label class="form-label">账号</label>
                    <input type="text" class="form-control" id="uname" name="uname" value="${userNum}">
                    <input type="hidden"  id="tbname" name="tbname" value="${userTable}">
                    <input type="hidden"  id="id" name="id" value="${userinfo.id}">
                  </div>
                  <div class="form-group">
                     <label class="form-label">
	               		       邮箱	                      
                    </label>
                    <input type="email" class="form-control" name='email'  id="email" aria-describedby="emailHelp" placeholder="请输入邮箱">
                  </div>
                  
                  <div class="form-footer">
                    <button class="btn btn-primary btn-block" onclick="sendMail()">发送邮件到您邮箱</button>
                  </div>
                </div>
              </div>
              
            </div>
          </div>
        </div>
      </div>
    </div>
	<script>
	 
	 //用户登录
	
	function sendMail(){
	
	var email=$("#email").val();		
	
	if( email=="" ){
		alert("请输入邮箱");
		return ;
	}else{
		var tbname=$("#tbname").val();	
		var name =$("#uname").val();
		var id=$("#id").val();			
		$.ajax({
			url:'<%=basePath %>SendEmailSvlt',
			type:'post',
			dataType:'json',
			data:{"tbname":tbname,"id":id,"name":name,"email":email},
			success:function(data){	
				if(data.msg=="1"){
					alert("发送成功，请到邮箱修改密码");
					
				}else{
					alert("请重新操作");
				}
				
			}
		});
		}
	};
	
	</script> 
</body>
</html>