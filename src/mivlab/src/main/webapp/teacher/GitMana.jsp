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
    <title>基于GitHub的教学管理系统——统计GitHub实验信息</title>
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
              <a class="header-brand" href="<%=basePath %>InitSvlt?flgs=1&tbname=teacourse">
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
                    <span class="avatar" style="background-image: url(./images/avatar-7.jpg)"></span>
                    <span class="ml-2 d-none d-lg-block">
                      <span class="text-default">${userinfo.tName }</span><!-- 用户名 -->
                      <small class="text-muted d-block mt-1">教师</small><!-- 用户身份 -->
                    </span>
                  </a>
                  <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                    
                    <a class="dropdown-item" href="<%=basePath %>InitSvlt?flgs=1&tbname=teacherInfo" >
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
                    <a href="<%=basePath %>InitSvlt?flgs=1&tbname=teacourse" class="nav-link active"><i class="fe fe-home"></i> 我的课程</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a href="<%=basePath %>InitSvlt?flgs=1&tbname=tshiyan" class="nav-link"><i class="fe fe-file"></i> 实验管理</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a href="<%=basePath %>InitSvlt?flgs=1&tbname=tGitmana" class="nav-link"><i class="fe fe-file"></i> 统计GitHub实验信息</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a href="<%=basePath %>InitSvlt?flgs=1&tbname=tGitDate" class="nav-link"><i class="fe fe-file"></i> GitHub实验信息管理</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a href="<%=basePath %>InitSvlt?flgs=1&tbname=TeagitRawdate" class="nav-link"><i class="fe fe-file"></i> 原始实验数据</a>
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
		                	统计GitHub实验信息
		              </h1>
		              
		          </div>
		          <div class="alert alert-icon " role="alert">
					  <i class="fe fe-bell mr-2" aria-hidden="true"></i> 统计前请先在“<a href="<%=basePath %>InitSvlt?flgs=1&tbname=teacherInfo">设置</a>”中完善GitHub用户信息 
				  </div>
                  <div class="card-body">
                    <div class="row ">
                      <div class="col-md-6 col-lg-12 card">
                      	<div class="card-header">
		                    <h3 class="card-title">第一步：关联到GitHub实验库</h3>
		                    
		                </div>
                        <div class="card-body">
	                    <fieldset class="form-fieldset">
		                    <div class="form-group">
	                          <label class="form-label">组织库名称</label>
	                          <input type='text' name='org'  id="org"  class="form-control" />
	                        </div>
	                        <div class="form-group mb-0">
	                          <label class="form-label">实验库名称</label>
	                          <input type='text' name='proj' id="proj" class="form-control" />
	                        </div>
	                        <div class="form-group">
	                          <label class="form-label">选择学期</label>
	                          <select id="cktermsid" name="cktermsid" class="form-control custom-select">
	                            <option value="0">选择学期</option>
	                            <c:forEach var="a" items="${termslist }">
	                              <option value="${a.id }">${a.termname }</option>	               
	                            </c:forEach>
	                          </select>
	                        </div>
	                        <div class="form-group">
	                          <label class="form-label">选择课程</label>
	                          <select id="ccoursesid" name="ccoursesid"  class="form-control custom-select">
								<option value="0">选择课程</option>
								<c:forEach var="a" items="${courselist }">
							    <option value="${a.id }">${a.cname }</option>
								</c:forEach>
							  </select>
	                        </div>	                        	                                               
	                      </fieldset>
                      </div>
        			 </div>
        			  <div class="col-md-6 col-lg-12 card">
                        <div class="card-header">
			               <h3 class="card-title">第二步：设置分值比重</h3>
			            </div>		                  
			            <div class="card-body">			                  	
		                    <fieldset class="form-fieldset">
		                    	<div class="table-responsive">
		                    	分值设置
                    			<table class="table card-table table-vcenter text-nowrap">                    			
                      			<thead>
                        		<tr>
                        			<th>评分参数</th>
									<th>比例 </th>
									<th>满分次数</th>
                        		</tr>
                        		<tr>
                        			<td>Pulls：</td>
									<td ><input name="pulls" id="pulls" onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" value="0.4"/></td>						
									<td  ><input  name="pullsFull" id="pullsFull" onkeyup="this.value=this.value.replace(/\D/g,'')" onblur="this.value=this.value.replace(/\D/g,'')"/>次</td>											
                        		</tr>
                        		<tr >
									<td  >Commits：</td>
									<td ><input  name="commits" id="commits" onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" value="0.4"/></td>						
									<td ><input  name="commitsFull" id="commitsFull" onkeyup="this.value=this.value.replace(/\D/g,'')" onblur="this.value=this.value.replace(/\D/g,'')"/>次</td>		
								</tr>
								<tr >
									<td  >Files：</td>
									<td ><input  name="files" id="files" onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" value="0.1"/></td>						
									<td><input  name="filesFull" id="filesFull" onkeyup="this.value=this.value.replace(/\D/g,'')" onblur="this.value=this.value.replace(/\D/g,'')"/>次</td>		
								</tr>
								<tr >
									<td >Comments：</td>
									<td ><input  name="comments" id="comments" onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" value="0.1"/></td>						
									<td ><input  name="commentsFull" id="commentsFull" onkeyup="this.value=this.value.replace(/\D/g,'')" onblur="this.value=this.value.replace(/\D/g,'')"/>次</td>		
								</tr>
                        		</thead>
                        		</table>
                        		加分项
                    			<table class="table card-table table-vcenter text-nowrap">                    			
                      			<thead>
                        		<tr>
                        			<th>参数</th>
									<th>每次加分值</th>									
                        		</tr>
                        		<tr >
									<td >Done：</td>
									<td ><input name="pullDone" id="pullDone" onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" value="0"/></td>																
								</tr>
								<tr >
									<td  >Good：</td>
									<td ><input  name="pullGood" id="pullGood" onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" value="0"/></td>															
								</tr>
								<tr >
									<td  >Dome：</td>
									<td ><input  name="pullDemo" id="pullDemo" onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" value="0"/></td>								
								</tr>
								<tr >
									<td >Interest：</td>
									<td ><input  name="pullInterest" id="pullInterest" onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" value="0"/></td>										
								</tr>
                        		</thead>
                        		</table>
                        		减分项
                    			<table class="table card-table table-vcenter text-nowrap">                    			
                      			<thead>
                        		<tr>
                        			<th>参数</th>
									<th>每次减分值</th>									
                        		</tr>
                        		<tr >
									<td  >Late：</td>
									<td ><input  name="pullLate" id="pullLate" onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" value="0"/></td>															
								</tr>
								<tr >
									<td >Copy：</td>
									<td ><input  name="pullCopy" id="pullCopy" onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" value="0"/></td>									
								</tr>
								<tr >
									<td >Bad：</td>
									<td ><input name="pullBad" id="pullBad" onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" value="0"/></td>						
								</tr>
								<tr >
									<td  >Bug：</td>
									<td ><input  name="pullBug" id="pullBug" onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" value="0"/></td>															
								</tr>
                        		</thead>
                        		</table>
                        		</div>			                   
		                       
		                        <div class="form-footer">
			                      <button class="btn btn-primary btn-block" onclick="submitGitdate()" title="提交前，请核对您的GitHub身份认证信息、组织库、实验库信息是否正确，否则无法获取实验数据">	统计</button>
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
    <script>
	
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
		
		var pullDone=$("#pullDone").val();
		var pullDoneFull=$("#pullDoneFull").val();
		var pullGood=$("#pullGood").val();
		var pullGoodFull=$("#pullGoodFull").val();
		var pullLate=$("#pullLate").val();
		var pullLateFull=$("#pullLateFull").val();
		var pullCopy=$("#pullCopy").val();
		var pullCopyFull=$("#pullCopyFull").val();
		var pullBad=$("#pullBad").val();
		var pullBadFull=$("#pullBadFull").val();
		var pullBug=$("#pullBug").val();
		var pullBugFull=$("#pullBugFull").val();
		var pullDemo=$("#pullDemo").val();
		var pullDemoFull=$("#pullDemoFull").val();
		var pullInterest=$("#pullInterest").val();
		var pullInterestFull=$("#pullInterestFull").val();
		
		
		//alert("termsid="+cktermsid+"***cid="+ccoursesid);
		if(org =="" || proj=="" || cktermsid=="0" || ccoursesid=="0" || pulls=="" || pullsFull=="" || commits=="" || commitsFull=="" || files=="" || filesFull=="" || comments=="" || commentsFull=="" || pullDone=="" || pullDoneFull==""	|| pullGood=="" || pullGoodFull=="" || pullLate=="" || pullLateFull=="" || pullCopy=="" || pullCopyFull=="" || pullBad=="" || pullBadFull=="" || pullBug=="" || pullBugFull=="" || pullDemo=="" || pullDemoFull=="" || pullInterest=="" || pullInterestFull==""	){
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
			data:{"org":org,"proj":proj,"uType":"teacher","cktermsid":cktermsid,"ccoursesid":ccoursesid,"pulls":pulls,"pullsFull":pullsFull,"commits":commits,"commitsFull":commitsFull,"files":files,"filesFull":filesFull,"comments":comments,"commentsFull":commentsFull,"pullDone":pullDone,"pullDoneFull":pullDoneFull,"pullGood":pullGood,"pullGoodFull":pullGoodFull,"pullLate":pullLate,"pullLateFull":pullLateFull,"pullCopy":pullCopy,"pullCopyFull":pullCopyFull,"pullBad":pullBad,"pullBadFull":pullBadFull,"pullBug":pullBug,"pullBugFull":pullBugFull,"pullDemo":pullDemo,"pullDemoFull":pullDemoFull,"pullInteresting":pullInterest,"pullInterestingFull":pullInterestFull},
			dataType:'json',
			success:function(data){			
					alert(data.msg);
					if(data.msg=="所有数据更新完毕"){
						window.location.href="<%=basePath %>GetDataSvlt?tbname=tGitDate&org="+org+"&proj="+proj;
					}			
			}
		});
	}
	
	
	
	</script>

	
  </body>
</html>