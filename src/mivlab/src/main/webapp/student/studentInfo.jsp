<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%	request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<base href="<%=basePath%>">
	
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Language" content="en" />
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
    <title>基于GitHub的教学管理系统——首页</title>
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
    <script type="text/javascript" src="<%=basePath%>js/jquery-3.3.1.min.js"></script>
   
</head>
<body class="">
<div class="page">
      <div class="page-main">
        <div class="header py-4">
          <div class="container">
            <div class="d-flex">
              <a class="header-brand" href="<%=basePath %>InitSvlt?flgs=1&tbname=homepage">
                <img src="${other.logoPath }" class="header-brand-img" alt="tabler logo">
                <!-- 惠州学院logo -->
                <span class="other_title">${other.title }</span>
              </a>
              <div class="d-flex order-lg-2 ml-auto">
                <div class="nav-item d-none d-md-flex">
                  <a href="" class="btn btn-sm btn-outline-primary" target="_blank">前端主页</a>
                  <!-- 点击前往前端主页面 -->
                </div>
               
                <div class="dropdown">
                  <a href="#" class="nav-link pr-0 leading-none" data-toggle="dropdown">
                    <span class="avatar" style="background-image: url(./images/avatar-6.jpg)"></span>
                    <span class="ml-2 d-none d-lg-block">
                      <span class="text-default">${userinfo.sname }</span><!-- 用户名 -->
                      <small class="text-muted d-block mt-1">学生</small><!-- 用户身份 -->
                    </span>
                  </a>
                  <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                    
                    <a class="dropdown-item" href="<%=basePath %>InitSvlt?flgs=1&tbname=studentInfo">
                      <i class="dropdown-icon fe fe-settings"></i> 设 置
                    </a>
                    
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="<%=basePath %>teacher/help.html" target="_blank">
                      <i class="dropdown-icon fe fe-help-circle"></i> 帮 助
                    </a>
                    <a class="dropdown-item" href="<%=basePath %>loginOut.jsp">
                      <i class="dropdown-icon fe fe-log-out"></i> 退 出
                    </a>
                  </div>
                </div>
              </div>
              <a href="#" class="header-toggler d-lg-none ml-3 ml-lg-0" data-toggle="collapse" data-target="#headerMenuCollapse">
                <span class="header-toggler-icon"></span>
              </a>
            </div>
          </div>
        </div>
        <div class="header collapse d-lg-flex p-0" id="headerMenuCollapse">
          <div class="container">
            <div class="row align-items-center">
             
             <!-- 导航栏 start -->
              <div class="col-lg order-lg-first">
                <ul class="nav nav-tabs border-0 flex-column flex-lg-row">
                  <li class="nav-item">
                    <a href="<%=basePath %>InitSvlt?flgs=1&tbname=stucourse" class="nav-link active"><i class="fe fe-home"></i> 我的课程</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a href="<%=basePath %>InitSvlt?flgs=1&tbname=stutaskinfo" class="nav-link"><i class="fe fe-file"></i> 实验任务</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a href="<%=basePath %>InitSvlt?flgs=1&tbname=mstutask" class="nav-link"><i class="fe fe-file"></i> 实验记录</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a href="<%=basePath %>InitSvlt?flgs=1&tbname=Sscore" class="nav-link"><i class="fe fe-file"></i> 查看成绩</a>
                  </li>
                                   
                </ul>
              </div>
              <!-- 导航栏 end -->
            </div>
          </div>
        </div>
        <div class="my-3 my-md-5">
          <div class="container">
            <div class="row row-cards">
              <div class="col-12 card">              
                  <div class="page-header">
		              <h1 class="page-title">
		                	设置
		              </h1>
		          </div>
                  <div class="card-body">
                    <div class="row ">
                      <div class="col-md-6 col-lg-12 card">
                      	<div class="card-header">
		                    <h3 class="card-title">1、修改密码</h3>
		                </div>
                        <div class="card-body">
	                    <fieldset class="form-fieldset">
		                    <input type='hidden' name='num' id="num" value="${userinfo.id}" >
							<input type='hidden' name='pwd' id="pwd" value="${userinfo.spassword}" >
	                        <div class="form-group">
	                          <label class="form-label">原始密码</label>
	                          <input  type='password' name='oldPwd' id="oldPwd" onblur="ckOldPwd(this)" class="form-control" />
	                        </div>
	                        <div class="form-group">
	                          <label class="form-label">新密码</label>
	                          <input type='password' name='newPwd'  id="newPwd" class="form-control" />
	                        </div>
	                        <div class="form-group mb-0">
	                          <label class="form-label">确认密码</label>
	                          <input type='password' name='ckNewPwd' id="ckNewPwd" class="form-control" />
	                        </div>
	                        <div class="form-footer">
		                      <button class="btn btn-primary btn-block" onclick="SubmitPwd()">更  改</button>
		                    </div>                       
	                      </fieldset>
                      </div>
        			 </div>
        			  <div class="col-md-6 col-lg-12 card">
                        <div class="card-header">
			               <h3 class="card-title">2、基本信息</h3>
			            </div>		                  
			            <div class="card-body">			                  	
		                    <fieldset class="form-fieldset">			                   
		                        <div class="form-group">
		                          <label class="form-label"> 学号</label>
		                          <input type='text' name='no' id="no" value="${userinfo.sno}" disabled="" class="form-control">
		                        </div>
		                        <div class="form-group">
		                          <label class="form-label"> 姓名</label>
		                          <input type='text' name='name' id="name" value="${userinfo.sname}"  disabled="" class="form-control">
		                        </div>
		                        <div class="form-group">
		                          <label class="form-label"> 班级</label>
		                          <input type='text' name='classname' id="classname" value="${userinfo.classname }"  disabled="" class="form-control">
		                        </div>
		                        <div class="form-group mb-0">
		                          <label class="form-label"> 性别</label>
		                          <input type='text' class="form-control" name='sgender' id="sgender"  value="${userinfo.sgender }" disabled=""> 
		                        </div>
		                        <div class="form-group mb-0">
		                          <label class="form-label"> 电话</label>
		                          <input class="form-control" type='text' name='sphone' id="sphone" value="${userinfo.sphone }" > 	  	 	 
		                        </div>
		                        <div class="form-footer">
			                      <button class="btn btn-primary btn-block" onclick="Submit()">更  新</button>
			                    </div>		                        
		                      </fieldset>		
		                  </div>
		                </div> 
		                <div class="col-md-6 col-lg-12 card">
                        <div class="card-header">
			               <h3 class="card-title">3、修改邮箱</h3>
			            </div>		                  
			            <div class="card-body">			                  	
		                    <fieldset class="form-fieldset">			                   
		                        <div class="form-group">
		                          <label class="form-label"> 邮箱</label>
		                          <input type="email" class="form-control" name='email'  id="email" aria-describedby="emailHelp" value="${userinfo.email }"placeholder="请输入邮箱">
		                          
		                        </div>
		                        <input type="hidden" class="form-control" id="uname" name="uname" value="${userinfo.sno}">
			                    <input type="hidden"  id="tbname" name="tbname" value="students">
			                    <input type="hidden"  id="id" name="id" value="${userinfo.id}">
		                        <div class="form-footer">
			                      <button class="btn btn-primary btn-block" onclick="sendMail()">更  新</button>
			                    </div>		                        
		                      </fieldset>		
		                  </div>
		                </div>  
        			  </div>
        			</div>
        		   </div>        		 
        		 </div>
        		</div>
        	   </div>
        	 
               				     
      <footer class="footer">
        <div class="container">
          <div class="row align-items-center flex-row-reverse">
            <div class="col-auto ml-lg-auto">
              <div class="row align-items-center">
                
                <div class="col-auto">
                   <a href="." target="_blank">基于GitHub的实验教学系统</a>
                </div>
              </div>
            </div>
            <div class="col-12 col-lg-auto mt-3 mt-lg-0 text-center">
               建设单位：<a href="" target="_blank" title="建设单位">${other.footer_name}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 地址： <a href="" title="addr" target="_blank"> ${other.footer_Addr }</a> 
            </div>
          </div>
        </div>
      </footer>
    </div>
    

	<script type="text/javascript">
	//检查是否知道原始密码
	function ckOldPwd(e){
		var ckPwd=$("#pwd").val();
		var pwd=$("#oldPwd").val();
		if(pwd!=ckPwd){
			alert("与原密码不一致");
			return ;
		}			
	};
	
	function Submit(){
	
	var num=$("#num").val();
	var sphone=$("#sphone").val();
	if( sphone==""){
		alert("请填写电话号码");
		return ;
	}
	var checkPhone=/^1[3|4|5|7|8]\d{9}$/ ;
	if(!checkPhone.test(sphone)){
		alert("请输入有效手机号码")
	    return ;
	}
	$.ajax({
		url:'<%=basePath %>UpdSvlt',
		type:'post',
		dataType:'json',
		data:{"tbname":"stuInfo","id":num,"sphone":sphone,"flag":"sphone"},
		success:function(data){	
			if(data.msg=="修改成功"){
				alert("修改成功，重新登录后生效");
				$("#sphone").val(data.sphone);
				//window.location.href="./teacherInfo.jsp";					 
			}else{
				alert("请重新提交");
			}
			
		}
	});
	
	};
	//修改密码
	function showChangePwd(){
	$(".form2").css("display","block");
	}
	function SubmitPwd(){
	
	var num=$("#num").val();
	var name=$("#name").val();		
	var pwd=$("#pwd").val();	//初始密码对照值
	var oldpwd=$("#oldPwd").val();
	var newpwd=$("#newPwd").val();
	var ckNewPwd=$("#ckNewPwd").val();		
	if(name=="" || oldpwd=="" || newpwd=="" || ckNewPwd=="" ){
		alert("请将信息填写完整");
		return ;
	}
	
	if(pwd==newpwd){
		alert("新密码不能与原密码相同");
		return ;			
	}
	var regx =/^(?!([a-zA-Z]+|\d+)$)[a-zA-Z\d]{6,20}$/;
	if((newpwd.match(regx)==null) || newpwd.length<6  || newpwd.length>16){
		alert("新密码应含有字母、数字，且长度为6-16个字符");
		return ;
	}
	if(newpwd!=ckNewPwd){
		alert("新密码与确认密码不一致");
		return;
	}
	$.ajax({
		url:'<%=basePath %>UpdSvlt',
		type:'post',
		dataType:'json',
		data:{"tbname":"stuInfo","id":num,"name":name,"newpwd":newpwd,"flag":"pwd"},
		success:function(data){	
			if(data.msg=="修改成功"){
				alert("修改成功,请重新登录");
				//window.location.href="./login.jsp";
				window.parent.frames.location.href="<%=basePath %>loginOut.jsp" 
			}else{
				alert("请重新提交");
			}
			
		}
	});
	
	};
	//更改邮箱
	function sendMail(){
		var email=$("#email").val();		
		var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$"); //邮箱正则表达式
		if( email=="" ){
			alert("请输入邮箱");
			return ;
		}
		
		else if(!reg.test(email)){
			alert("邮箱格式不正确");
			return ;
		}else
		{
			var tbname=$("#tbname").val();	
			var name =$("#uname").val();
			var id=$("#id").val();		
			$.ajax({
				url:'<%=basePath %>ChangeEmailSvlt',
				type:'post',
				dataType:'json',
				data:{"tbname":tbname,"id":id,"name":name,"email":email},
				success:function(data){	
					if(data.msg=="1"){
						alert("发送成功，请到邮箱进行认证");
						
					}else{
						alert("请重新操作");
					}
					
				}
			});
		}
	}
	
	
	</script>
  </body>
</html>