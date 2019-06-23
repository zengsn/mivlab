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
<title>基于GitHub的教学管理系统——重设密码</title>
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
                  <div class="card-title">重新设置密码</div>
                  <div class="form-group">
                    <label class="form-label">账号</label>
                    <input type="text" class="form-control" id="num" name="num" value="${num}">
                    <input type="hidden"  id="id" name="id" value="${id}">
                    <input type="hidden"  id="tbname" name="tbname" value="${tbname}">
                    <input type="hidden"  id="name" name="name" value="${name}">
                    <input type="hidden"  id="email" name="email" value="${email}">
                  </div>
                  <div class="form-group">
                     <label class="form-label">
	               		       新密码	                      
                    </label>
                    <input type="password" class="form-control" name='newPwd'  id="newPwd" placeholder="密码" >
                  </div>
                  <div class="form-group">
                     <label class="form-label">
	               		       确认密码	                      
                    </label>
                    <input type="password" class="form-control" name='ckNewPwd' id="ckNewPwd" placeholder="确认密码">
                  </div>
                  
                  <div class="form-footer">
                    <button class="btn btn-primary btn-block" onclick="Submit()">提 交  </button>
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
	
	function Submit(){
		
	var id=$("#id").val();
	var num=$("#num").val();
	var name=$("name").val();
	var tbname=$("#tbname").val();
	var newpwd=$("#newPwd").val();
	var ckNewPwd=$("#ckNewPwd").val();
	var email=$("#email").val();
	if( newpwd=="" || ckNewPwd==""){
		alert("请输入密码");
		return ;
	}
	
	var regx =/^(?!([a-zA-Z]+|\d+)$)[a-zA-Z\d]{6,20}$/;
	if((newpwd.match(regx)==null) || newpwd.length<6  || newpwd.length>16){
		alert("新密码应含有字母、数字，且长度为6-16个字符");
		return ;
	}else
	if(newpwd!=ckNewPwd){
		alert("新密码与确认密码不一致");
		return;
	}else{
		
		$.ajax({
			url:'<%=basePath %>UpdSvlt',
			type:'post',
			dataType:'json',
			data:{"tbname":tbname,"id":id,"name":name,"newpwd":newpwd,"email":email},
			success:function(data){	
				if(data.msg=="修改成功"){
					alert("修改成功,请重新登录");
					
					window.parent.frames.location.href="<%=basePath %>login.jsp" 
				}else{
					alert("请重新提交");
				}
				
			}
		});
	}
	};
	
	</script> 
</body>
</html>