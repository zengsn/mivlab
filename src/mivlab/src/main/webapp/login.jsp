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
 <title>平台入口</title>

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
              <form class="card" >
                <div class="card-body p-6">
                  <div class="card-title">平台入口</div>
                  <div class="form-group">
                    <label class="form-label">账号</label>
                    <input type="text" class="form-control" id="uname" name="uname" aria-describedby="emailHelp" placeholder="输入账号">
                  </div>
                  <div class="form-group">
                     <label class="form-label">
	               		       密码
	                      <a href="<%=basePath%>FindPwd.jsp" class="float-right small">I forgot password</a>
                    </label>
                    <input type="password" class="form-control" id="upassword" name="upassword" placeholder="密码">
                  </div>
                  <div class="form-group">
                        <label for="utype">角色</label>
                        <select id="utype" name="utype" class="form-control custom-select">
                       		 <option value="admin">管理员</option>
							<option value="tea">教师</option>
							<option value="stu">学生</option> 							
            
                        </select>
                    </div>
                  
                  <div class="form-footer">
                    <button type="submit" class="btn btn-primary btn-block" onclick="lgtj();return false;">登  录</button>
                  </div>
                </div>
              </form>
              
            </div>
          </div>
        </div>
      </div>
    </div>
	<script>
	 
	 //用户登录
	
	function lgtj(){
		var uname=$("#uname").val();
		var upassword=$("#upassword").val();
		var utype=$("#utype").val();
		if(uname==""||upassword==""){
			alert("请输入账号和密码");
			return;
		}
		var re = /^[0-9]+.?[0-9]*$/; //判断字符串是否为数字 //判断正整数 /^[1-9]+[0-9]*]*$/
		if(!re.test(uname)){
			alert("请输入正确的账号");
			return ;
		}else{
			$.ajax({
				
				url:'LoginSvlt',
				type:'post',
				data:{"username":uname,"password":upassword,"userType":utype},
				dataType:'json',
				success:function(data){
					
					if(data.msg=='2'){
						window.location.href="<%=basePath %>setEmail.jsp";
					}else
					if(data.msg==1){
						if(utype=="tea"){
							window.location.href="<%=basePath %>teacher/main.jsp";
						}else if(utype=="stu"){
							window.location.href="<%=basePath %>InitSvlt?flgs=1&tbname=stutaskinfoLogin";
						}else if(utype=="admin"){
							window.location.href="<%=basePath %>InitSvlt?flgs=1&tbname=homepage";
						}
					}else {
						alert(data.msg);
					}
				}
			});
		}
	 }
	
	</script> 
</body>
</html>