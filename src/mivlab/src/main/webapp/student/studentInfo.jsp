<%@page import="bean.Snav"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生个人信息</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="<%=basePath%>js/jquery-3.3.1.min.js"></script>
<script src="<%=basePath%>ckeditor5/ckeditor.js"></script>		<!-- 引入web在线文本编辑器的配置文件 -->


<!-- amaze ui -->
<link rel="stylesheet" href="<%=basePath%>assets/css/amazeui.css" />
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=basePath%>assets/css/core.css" />
<link rel="stylesheet" href="<%=basePath%>assets/css/menu.css" />
<link rel="stylesheet" href="<%=basePath%>assets/css/index.css" />
<link rel="stylesheet" href="<%=basePath%>assets/css/admin.css" />
<link rel="stylesheet" href="<%=basePath%>assets/css/page/typography.css" />
<link rel="stylesheet" href="<%=basePath%>assets/css/page/form.css" />

<!--  -->	
<script type="text/javascript" src="<%=basePath%>js/jquery.min.js.下载"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js.下载"></script>
<!-- 头部底部 -->
<link rel="stylesheet" href="<%=basePath%>css/titleFooter.css" />

<style> 
  .banner, .footer {
      background-color: ${other.bgColor};
     /* background-image:${other.imgPath};   */
      color: ${other.wordColor};     
    }
  p{
		text-align:center;
	}
/*表单*/
	.form{
		width:85%;
		margin-left:auto;
		margin-right:auto;
		padding:30px 50px;
		background:#f3f4fc;
		border-radius:25px;
		box-shadow: 5px 5px 2px #d9dbdc;
		
	}
 .hiddenli{
  display:none !important;
  
  }
  @media screen and (max-width: 640px) {
   .hiddenli{
  display:block !important;
  
  }
</style>

<%	request.setCharacterEncoding("UTF-8");		
%>

<style>
	
</style>

<script>
$(function() {
	  $( "#tabs" ).tabs();
	});
	

</script>

</head>
<body>
<header class="am-topbar am-topbar-fixed-top">	
			<!-- 顶部标题栏 -->
			<div class="banner" id="banner" >				        
		    	<div class="banner-title">${other.title }</div>        
			</div>	
			<div class="am-topbar-left am-hide-sm-only">
                <a href="index.html" class="logo"><span>Admin<span>to</span></span><i class="zmdi zmdi-layers"></i></a>
            </div>
	
			<div class="contain">
				<ul class="am-nav am-navbar-nav am-navbar-left">

					<li><h4 class="page-title">学生个人信息</h4></li>
				</ul>
				
				
			</div>
		</header>
		<!-- end page -->
		
		
		<div class="admin">
			<!--<div class="am-g">-->
		<!-- ========== Left Sidebar Start ========== -->
		<!--<div class="left side-menu am-hide-sm-only am-u-md-1 am-padding-0">
			<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 548px;">
				<div class="sidebar-inner slimscrollleft" style="overflow: hidden; width: auto; height: 548px;">-->
                  <!-- sidebar start -->
				  <div class="admin-sidebar am-offcanvas  am-padding-0" id="admin-offcanvas">
				    <div class="am-offcanvas-bar admin-offcanvas-bar">
				    	<!-- User -->
						<div class="user-box am-hide-sm-only">
	                        <div class="user-img">
	                            <img src="<%=basePath%>assets/img/avatar-6.jpg" alt="user-img" title="${userinfo.sname } " class="img-circle img-thumbnail img-responsive">
	                            <div class="user-status offline"><i class="am-icon-dot-circle-o" aria-hidden="true"></i></div>
	                        </div>
	                        <h5>${userinfo.sname } </h5>
	                        <ul class="list-inline">
	                        	<li>
	                                <a href="<%=basePath %>teacher/help.html" target="_blank" class="text-custom">
	                                    <i class="fa fa-question-circle" aria-hidden="true"> 帮助</i>
	                                </a>
	                            </li>
	                            <li>
	                                <a href="<%=basePath %>InitSvlt?flgs=1&tbname=studentInfo" class="text-custom">
	                                    <i class="fa fa-cog" aria-hidden="true"> 设置</i>
	                                </a>
	                            </li>
								<li>
	                                <a href="<%=basePath %>loginOut.jsp" class="text-custom">
	                                    <i class="fa fa-sign-out" aria-hidden="true"> 退出</i>
	                                </a>
	                            </li>
	
	                            
	                        </ul>
	                    </div>
	                    <!-- End User -->
	            
						<ul class="am-list admin-sidebar-list">
						    <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=stucourse" class="am-cf"> 我的课程</span></a></li>
					        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=stutaskinfo" class="am-cf"> 实验任务</span></a></li>
					        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=mstutask"> 实验记录</a></li>
					        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=Sscore"> 查看成绩</a></li>						    
						    <li class="hiddenli"><a href="<%=basePath %>InitSvlt?flgs=1&tbname=studentInfo"> 个人设置</a></li>
					        <li class="hiddenli"><a href="<%=basePath %>teacher/help.html"> 帮助</a></li>
					        <li class="hiddenli"><a href="<%=basePath %>loginOut.jsp"> 退出登录</a></li>	
						  </ul>
				</div>
				  </div>
				  <!-- sidebar end -->
    
				<!--</div>
			</div>
		</div>-->
<!--	<div class="am-g">-->
		<!-- ============================================================== -->
		<!-- Start right Content here -->
		<div class="content-page">
			<!-- Start content -->
			<div class="content">
				<div class="am-g">
					<!-- Row start -->
						<div class="am-u-sm-12">
							<div class="card-box">
								 <div data-am-widget="tabs" class="am-tabs am-tabs-default">
							      <ul class="am-tabs-nav am-cf">
							          <li class="am-active"><a href="[data-tab-panel-0]">基本信息</a></li>
							          <li class=""><a href="[data-tab-panel-1]">修改密码</a></li>
							          
							      </ul>
							      <div class="am-tabs-bd">
							          <div data-tab-panel-0 class="am-tab-panel am-active">
							          
							          	<form >	
										  <input type='hidden' name='num' id="num" value="${userinfo.id}" >
										   <input type='hidden' name='pwd' id="pwd" value="${userinfo.spassword}" >
										  <p>  学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：<input type='text' name='no' id="no" value="${userinfo.sno}" disabled="disabled" > </p>
										  <p>  姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<input type='text' name='name' id="name" value="${userinfo.sname}"  disabled="disabled"> </p>
										  <p>  班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级：<input type='text' name='classname' id="classname" value="${userinfo.classname }"  disabled="disabled"> </p>
										  <p>  性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：<input type='text' name='sgender' id="sgender"  value="${userinfo.sgender }" disabled="disabled"> </p>
										  <p>  电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：<input type='text' name='sphone' id="sphone" value="${userinfo.sphone }" > </p>	  	 	 
										  <p style="text-align:center;"><input type='button' value='更新' onclick="Submit()">
										 
									 	 </p>
									    
										</form>
							          </div>
							          <div data-tab-panel-1 class="am-tab-panel ">
							          	<form  class="form2">
											<p>  原始密码：<input type='password' name='oldPwd' id="oldPwd" onblur="ckOldPwd(this)"> </p>	  
										    <p>  新&nbsp;&nbsp;密&nbsp;&nbsp;码：<input type='password' name='newPwd'  id="newPwd"  >  </p>	 
										    <p>  确认密码：<input type='password' name='ckNewPwd' id="ckNewPwd"  > </p>	
										    <p style="text-align:center;"><input type='button' value='更新' onclick="SubmitPwd()"></p>
										</form>
							          </div>
							          
							      </div>
							  </div>
								
								
								
								
							</div>
						</div>
					<!-- Row end -->
				</div>			
			</div>
			<div class="am-g">
		<!-- 底部信息 -->
		<div class="footer">
		    <span class="school">建设单位：${other.footer_name}</span>
		    <span class="address">${other.footer_Addr }</span>
		</div>
   		</div>	
		</div>
		
		<!-- end right Content here -->
		<!--</div>-->
		</div>
			
		</div>
		
		<!-- navbar -->
		<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"><!--<i class="fa fa-bars" aria-hidden="true"></i>--></a>
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
			alert("修改成功");
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
			window.parent.frames.location.href="<%=basePath %>/index.jsp" 
		}else{
			alert("请重新提交");
		}
		
	}
});

};

	
	</script>
	
	
		
<script type="text/javascript" src="<%=basePath%>assets/js/jquery-2.1.0.js" ></script>
<script type="text/javascript" src="<%=basePath%>assets/js/amazeui.min.js"></script>
<script type='application/javascript' src='<%=basePath%>assets/js/fastclick.js'></script>
<script type="text/javascript" src="<%=basePath%>assets/js/app.js" ></script>
<script type="text/javascript" src="<%=basePath%>assets/js/blockUI.js" ></script>


</body>
</html>