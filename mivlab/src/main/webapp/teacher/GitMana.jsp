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
<title>GitHub实验管理</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="<%=basePath%>js/jquery-3.3.1.min.js"></script>



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
<!-- jQueryUI -->

<link href="<%=basePath%>jqueryUIcustom/css/base/jquery-ui-1.9.2.custom.css" rel="stylesheet">
<style> 
  .banner, .footer {
      background-color: ${other.bgColor};
     /* background-image:${other.imgPath};   */
      color: ${other.wordColor};     
    }
    .hiddenli{
  display:none !important;
  
  }
 
  .backward{   	
    	color:#71b6f9;
    }
   .backward:hover{
   	cursor:pointer;
   	color:blue;
   }
   .titlename{
		display:block;
		padding:5px;
		background:#fafcff;
		box-shadow: 0 1px 1px 0 rgba(0,0,0,0.2), 0 1px 1px 0 rgba(0,0,0,0.19);
		margin:20px 0px;
	}
	.td{
		padding:5px;
	}
	table {
    border: 1px solid #ccc;
    width: 80%;
    margin:0;
    padding:0;
    border-collapse: collapse;
    border-spacing: 0;
    margin: 0 auto;
  }

  table tr {
    border: 1px solid #ddd;
    padding: 5px;
  }

  table th, table td {
    padding: 10px 0px;
    text-align: center;
  }

  table th {
    text-transform: uppercase;
    font-size: 14px;
    letter-spacing: 1px;
  }
  table  tr td input {
      width:80px;
    }
  
  @media screen and (max-width: 640px) {
   .hiddenli{
  display:block !important;
  
  }
    
  }
  @media screen and (max-width: 600px) {

    

    table  tr td input {
      width:50px;
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
function onlyNumber(obj){	//只允许输入小数
	//得到第一个字符是否为负号
	var t = obj.value.charAt(0);
	//先把非数字的都替换掉，除了数字和.
	obj.value = obj.value.replace(/[^\d\.]/g,'');
	//必须保证第一个为数字而不是.
	obj.value = obj.value.replace(/^\./g,'');
	//保证只有出现一个.而没有多个.
	obj.value = obj.value.replace(/\.{2,}/g,'.');
	//保证.只出现一次，而不能出现两次以上
	obj.value = obj.value.replace('.','$#$').replace(/\./g,'').replace('$#$','.');
	//如果第一位是负号，则允许添加
	if(t == '-'){
	//obj.value = '-'+obj.value;
	alert("请输入非负小数");
	
	}
}
function submitGitdate(){
	var org=$("#org").val();
	var proj=$("#proj").val();
	var cktermsid=$("#cktermsid").val();
	var ccoursesid=$("#ccoursesid").val();
	
	var pulls=$("#pulls").val();
	var pullsFull=$("#pullsFull").val();
	var commits=$("#commits").val();
	var commitsFull=$("#commitsFull").val();
	var files=$("#files").val();
	var filesFull=$("#filesFull").val();
	var comments=$("#comments").val();
	var commentsFull=$("#commentsFull").val();
	//alert("termsid="+cktermsid+"***cid="+ccoursesid);
	if(org =="" || proj=="" || cktermsid=="0" || ccoursesid=="0" || pulls=="" || pullsFull=="" || commits=="" || commitsFull=="" || files=="" || filesFull=="" || comments=="" || commentsFull==""){
		alert("请将信息填写完整");
		return ;
	}
	var sum=parseFloat(pulls)+parseFloat(commits)+parseFloat(files)+parseFloat(comments);
	//alert(sum);
	if(sum != 1){
		alert("“Pulls+Commits+Files+Comments”的和不等于1，请检查")
		return ;
	}
	alert("统计时间为几十分钟至几小时，请耐心等待,若完成后操作无反应，请重新登录...")
	$.ajax({
		url:'<%=basePath %>GitSlvt',
		type:'post',
		data:{"org":org,"proj":proj,"cktermsid":cktermsid,"ccoursesid":ccoursesid,"pulls":pulls,"pullsFull":pullsFull,"commits":commits,"commitsFull":commitsFull,"files":files,"filesFull":filesFull,"comments":comments,"commentsFull":commentsFull,},
		dataType:'json',
		success:function(data){			
				alert(data.msg);
				if(data.msg=="所有数据更新完毕"){
					window.location.href="<%=basePath %>GetDataSvlt?tbname=tGitDate&org="+org+"&proj="+proj;
				}			
		}
	});
}

$(function() {
    $( ".tabs-2" ).click(function(){
    	window.location.href="<%=basePath %>InitSvlt?flgs=1&tbname=tGitDate";
    });
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

					<li><h4 class="page-title">Git实验管理</h4></li>
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
	                            <img src="<%=basePath%>assets/img/avatar-7.jpg" alt="user-img" title="${userinfo.tName }" class="img-circle img-thumbnail img-responsive">
	                            <div class="user-status offline"><i class="am-icon-dot-circle-o" aria-hidden="true"></i></div>
	                        </div>
	                        <h5>${userinfo.tName } </h5>
	                        <ul class="list-inline">
	                        	<li>
	                                <a href="<%=basePath %>teacher/help.html" target="_blank" class="text-custom">
	                                    <i class="fa fa-question-circle" aria-hidden="true"> 帮助</i>
	                                </a>
	                            </li>
	                            <li>
	                                <a href="<%=basePath %>InitSvlt?flgs=1&tbname=teacherInfo" class="text-custom">
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
						    
						    <li class="admin-parent">
						      <a class="am-cf" data-am-collapse="{target: '#collapse-nav1'}"><span class="am-icon-th-list"></span> 教学管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
						      <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav1">
						        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=teacourse" class="am-cf"> 我的课程</span></a></li>
						        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=tshiyan" class="am-cf"> 实验管理</span></a></li>
						        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=tGitmana"> 统计GitHub实验信息</a></li>
						        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=tGitDate"> GitHub实验信息管理</a></li>
						        <li class="hiddenli"><a href="<%=basePath %>InitSvlt?flgs=1&tbname=teacherInfo"> 个人设置</a></li>
						        <li class="hiddenli"><a href="<%=basePath %>teacher/help.html"> 帮助</a></li>
						        <li class="hiddenli"><a href="<%=basePath %>loginOut.jsp"> 退出登录</a></li>
						      </ul>
						    </li>						    
						    
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
								
								<div id="tabs"  >
								  <ul>
								    <li><a href="#tabs-1">GitHub实验成绩录入</a></li>
								    <li><a href="#tabs-2" class="tabs-2">查看实验数据</a></li>
								    
								  </ul>
								  <div id="tabs-1" >
								  		<form >
								  			
											<p>组织库名称：<input type="text" name="org" id="org"></p>
											<p>实验库名称：<input type="text" name="proj" id="proj"></p>
											<span class="titlename">请选择关联到的课程信息：</span>
											<p>	
												学期：<select id="cktermsid" name="cktermsid" class="ckinput easyui-combobox">
														<option value="0">选择学期</option>
														<c:forEach var="a" items="${termslist }">
													    <option value="${a.id }">${a.termname }</option>
														</c:forEach>
													</select>
											</p>
											<p>	
												课程：<select id="ccoursesid" name="ccoursesid" class="ckinput easyui-combobox">
														<option value="0">选择课程</option>
														<c:forEach var="a" items="${courselist }">
													    <option value="${a.id }">${a.cname }</option>
														</c:forEach>
													</select>
											</p>
											<span class="titlename">设置分值比重：（Pulls+Commits+Files+Comments=1)</span>
											<table >
												<tr>
												  <th>评分参数</th>
												  <th>比例 </th>
												  <th>满分次数</th>
												</tr>
												<tr >
													<th >Pulls：</th>
													<td ><input name="pulls" id="pulls" onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" value="0.4"/></td>						
													<td  ><input  name="pullsFull" id="pullsFull" onkeyup="this.value=this.value.replace(/\D/g,'')" onblur="this.value=this.value.replace(/\D/g,'')"/>次</td>		
												</tr>
												<tr >
													<th  >Commits：</th>
													<td ><input  name="commits" id="commits" onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" value="0.4"/></td>						
													<td ><input  name="commitsFull" id="commitsFull" onkeyup="this.value=this.value.replace(/\D/g,'')" onblur="this.value=this.value.replace(/\D/g,'')"/>次</td>		
												</tr>
												<tr >
													<th  >Files：</th>
													<td ><input  name="files" id="files" onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" value="0.1"/></td>						
													<td><input  name="filesFull" id="filesFull" onkeyup="this.value=this.value.replace(/\D/g,'')" onblur="this.value=this.value.replace(/\D/g,'')"/>次</td>		
												</tr>
												<tr >
													<th >Comments：</th>
													<td ><input  name="comments" id="comments" onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" value="0.1"/></td>						
													<td ><input  name="commentsFull" id="commentsFull" onkeyup="this.value=this.value.replace(/\D/g,'')" onblur="this.value=this.value.replace(/\D/g,'')"/>次</td>		
												</tr>
												<tr><td align="center" colspan="3" for="sub"><input type="button" value="统计数据" onclick="submitGitdate()" id="sub" title="提交前，请核对您的GitHub身份认证信息、组织库、实验库信息是否正确，否则无法获取实验数据"></td></tr>							
											</table>
							
											
										</form>
								  </div>
								  <div id="tabs-2">
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

	
	
		
<script type="text/javascript" src="<%=basePath%>assets/js/jquery-2.1.0.js" ></script>
<script type="text/javascript" src="<%=basePath%>assets/js/amazeui.min.js"></script>
<script type='application/javascript' src='<%=basePath%>assets/js/fastclick.js'></script>
<script type="text/javascript" src="<%=basePath%>assets/js/app.js" ></script>
<script type="text/javascript" src="<%=basePath%>assets/js/blockUI.js" ></script>

<script src="<%=basePath%>jqueryUIcustom/js/jquery-ui-1.9.2.custom.js"></script>
</body>
</html>