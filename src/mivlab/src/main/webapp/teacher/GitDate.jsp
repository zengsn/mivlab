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
    <title>基于GitHub的教学管理系统——GitHub实验信息管理</title>
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
    <!-- jquery -->
    <script type="text/javascript" src="<%=basePath%>js/jquery-3.3.1.min.js"></script>
	<!-- 翻页-->
	<script type="text/javascript" src="<%=basePath %>js/syssmp.js"></script>
    

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
                    
                    <a class="dropdown-item" href="<%=basePath %>InitSvlt?flgs=1&tbname=teacherInfo">
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
		                	GitHub实验信息管理
		              </h1>
		          </div>                
                   <div class="row ">
                     <div class="col-md-12 col-lg-12 ">                      	
                       <div class="card-body">	                    
                        <div class="row gutters-xs">
                          <div class="col-4 col-lg-2 col-md-6">
                            <select id="cktermsid" class="form-control custom-select">
                            <option value="0">选择学期</option>
                            <c:forEach var="a" items="${termslist }">
                              <option value="${a.id }">${a.termname }</option>	               
                            </c:forEach>
                            </select>
                          </div>
                          <div class="col-4 col-lg-2 col-md-6">
                            <select id="ckclassinfoid" class="form-control custom-select">
							<option value="0">选择班级</option>
							<c:forEach var="s" items="${classinfolist }">
								<option value="${s.id }">${s.classname }</option>
							</c:forEach>
                            </select>
                          </div>
                          <div class="col-4 col-lg-2 col-md-6">
                            <select id="ccoursesid" class="form-control custom-select">
							<option value="0">选择课程</option>
                            <c:forEach var="s" items="${courselist }">
                              <option value="${s.id }">${s.cname }</option>	               
                            </c:forEach>
                            </select>
                          </div>
                          <div class="col-4 col-lg-2 col-md-6">	
                          	<input type="search" class="form-control header-search"  id="ckunum" placeholder="请输入学号&hellip;" tabindex="1">			                                                                                      	                             
                          	<div class="input-icon-addon" >
			                   <i class="fe fe-search" ></i>
			                </div>                       	
                          </div>
                          <div class="col-4 col-lg-1 col-md-6">	                          
                             <button class="btn btn-block"  onclick="cktj();return false;">查询</button>	                            	                             
                          </div>
                          <div class="col-4 col-lg-1 col-md-6">	                          
                             <button class="btn btn-block"  onclick="addsbt();return false;">新增</button>	                            	                             
                          </div>	 
                          <div class="col-4 col-lg-1 col-md-6">	                          
                             <button class="btn btn-block"  onclick="delsbt();return false;">删除</button>	                            	                             
                          </div>
                          <div class="col-4 col-lg-1 col-md-6">	                          
                             <button class="btn btn-block alertTest"  >导出数据</button>	                            	                             
                          </div>                       
                      	 </div>                     	    
       			   </div>        			  
       			 </div>
       			<div class="col-12">
                <div class="card">                 
                  <div class="table-responsive">
                    <table class="table card-table table-vcenter text-nowrap">
                      <thead>
                        <tr>
                          <th ></th>
                          <th >序号</th>
                          <th >学期</th>
                          <th >班级</th>
                          <th >课程</th>
                          <th >学号</th>
                          <th>姓名</th>
                          <th >Pulls</th>
               			  <th >Done</th>
               			  <th >Good</th>
               			  <th >Late</th>
               			  <th >Copy</th>
               			  <th >Bad</th>
               			  <th >Bug</th>
               			  <th >Demo</th>
               			  <th >Interesting</th>
               			  <th >Commits</th>
               			  <th >ChangedFiles</th>
               			  <th >Comments</th>
               			  <th>成绩</th>
                          <th></th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="git" items="${alist }" varStatus="index">
		              <tr>
		                <td><input name="delid" type="checkbox" value="${git.id }"/></td>                
		                <td>${index.count }</td>
						<td>${git.termname }</td>
						<td>${git.classname }</td>
						<td>${git.cname }</td>
						<td>${git.num }</td>
						<td>${git.sname }</td>
						<td>${git.pulls }</td>
						<td>${git.pullDone }</td>
						<td>${git.pullGood }</td>
						<td>${git.pullLate }</td>
						<td>${git.pullCopy }</td>
						<td>${git.pullBad }</td>
						<td>${git.pullDemo}</td>
						<td>${git.pullInteresting }</td>
						<td>${git.pullBug }</td>
						<td>${git.commits }</td>
						<td>${git.changedFiles }</td>
						<td>${git.comments }</td>
						<td>${git.score }</td>
		                <td class="text-right">
                            <a href="javascript:void(0);"  onclick="updbt('${git.id}');return false;" class="btn btn-secondary btn-sm">修改成绩</a>                            
                        </td>
		              </tr>
		              </c:forEach>
                      </tbody>
                    </table>                   
                   </div>
                  </div>
                  <div class="row align-items-center flex-row-reverse">
            		<div class="col-auto ml-lg-auto">
		              <div class="row align-items-center">		                
		                <div class="col-auto">
					                   共有 ${allnums } 条记录
					      
		                </div>
		              </div>
		            </div>  		               
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
      <!-- dialog  start -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>                  
                </div>
                <div class="modal-body">
                	<div class="form-group">
                        <label for="gterms_id">选择学期</label>                      
                           <select id="gterms_id" name="gterms_id" class="form-control custom-select">                          
                           <option value="0">选择学期</option>
							<c:forEach var='a' items='${termslist}'>
								<option value="${a.id }">${a.termname }</option>
							</c:forEach>
                           </select>                                                 
                    </div>               
                    <div class="form-group">
                        <label for="gcourse_id">选择课程</label>                      
                            <select id="gcourse_id" name="gcourse_id"  class="form-control custom-select">
							<option value="0">选择课程</option>
								<c:forEach var='a' items='${courselist}'>
									<option value="${a.id }">${a.cname }</option>
								</c:forEach>
                            </select>                     
                    </div>
                    <div class="form-group">
                        <label for="gorg">组织库</label>
                        <input type="text" id="gorg" name="gorg"  class="form-control" placeholder="组织库名称">
                    </div>
                    <div class="form-group">
                        <label for="gproj">实验库</label>
                        <input type="text" id="gproj"  name="gproj"  class="form-control"  placeholder="实验库名称">
                    </div>
                     <div class="form-group">
                        <label for="gsno">学号</label>
                        <input type="text" id="gsno" name="gsno"  class="form-control" placeholder="学号" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
                    </div>
                    <div class="form-group">
                        <label for="gPulls">Pulls</label>
                        <input type="text" id="gPulls"  name="gPulls"  class="form-control"  placeholder="Pulls" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
                    </div>
                    <div class="form-group">
                        <label for="gPullDone">Done</label>
                        <input type="text" id="gPullDone" name="gPullDone"  class="form-control" placeholder="Done" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
                    </div>
                    <div class="form-group">
                        <label for="gPullGood">Good</label>
                        <input type="text" id="gPullGood"  name="gPullGood"  class="form-control"  placeholder="Good" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
                    </div>
                     <div class="form-group">
                        <label for="gPullLate">Late</label>
                        <input type="text" id="gPullLate" name="gPullLate"  class="form-control" placeholder="Late" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
                    </div>
                    <div class="form-group">
                        <label for="gPullCopy">Copy</label>
                        <input type="text" id="gPullCopy"  name="gPullCopy"  class="form-control"  placeholder="Copy" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
                    </div>
                     <div class="form-group">
                        <label for="gPullBad">Bad</label>
                        <input type="text" id="gPullBad"  name="gPullBad"  class="form-control"  placeholder="Bad" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
                    </div>
                     <div class="form-group">
                        <label for="gPullBug">Bug</label>
                        <input type="text" id="gPullBug" name="gPullBug"  class="form-control" placeholder="Bug" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
                    </div>
                    <div class="form-group">
                        <label for="gPullDemo">Demo</label>
                        <input type="text" id="gPullDemo"  name="gPullDemo"  class="form-control"  placeholder="Demo" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
                    </div>
                    <div class="form-group">
                        <label for="gPullInteresting">Interesting</label>
                        <input type="text" id="gPullInteresting" name="gPullInteresting"  class="form-control" placeholder="Interesting" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
                    </div>
                    <div class="form-group">
                        <label for="gCommits">Commits</label>
                        <input type="text" id="gCommits"  name="gCommits"  class="form-control"  placeholder="Commits" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
                    </div>
                     <div class="form-group">
                        <label for="gChangedFiles">ChangedFiles</label>
                        <input type="text" id="gChangedFiles" name="gChangedFiles"  class="form-control" placeholder="ChangedFiles" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
                    </div>
                    <div class="form-group">
                        <label for="gComments">Comments</label>
                        <input type="text" id="gComments"  name="gComments"  class="form-control"  placeholder="Comments" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
                    </div>
                    <div class="form-group">
                        <label for="gScore">Score</label>
                        <input type="text" id="gScore"  name="gScore"  class="form-control"  placeholder="Score" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                    <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal" onclick="gltj();return false;"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
                </div>
            </div>
          </div>
       </div>
       <!-- dialog  end  -->
       <!-- dialog changeScore start -->
      <div class="modal fade" id="changeScore" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>                  
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="score">更新成绩</label>
                        <input type="text" id="score" name="score"  class="form-control" placeholder="成绩为整数">
                        <input type="hidden" id="changeid" name="changeid"  class="form-control" >
                    </div>                                       
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                    <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal" onclick="changeScore();return false;"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
                </div>
            </div>
          </div>
       </div>
       <!-- dialog  changeScore end  -->
    </div>
 <script type="text/javascript">
	 function updbt(id){	//更新实验成绩
		   
		   $("#changeid").val(id);
		   $('#changeScore').modal();
	 }
	 function changeScore(){
		   var id=$("#changeid").val();
		   var score=$("#score").val();	   
		   $.ajax({
				url:'UpdSvlt',
				type:'post',
				dataType:'json',
				data:{"tbname":"changeScore","id":id,"score":score},
				success:function(data){	
					alert(data.msg);
					window.location.href="InitSvlt?tbname=tGitDate";
				}
			});
	 }
	function gltj(){	//点击添加按钮，手动添加实验成绩信息
		var terms_id=$("#gterms_id").val();
		var course_id=$("#gcourse_id").val();
		var org=$("#gorg").val();
		var proj=$("#gproj").val();
		var sno=$("#gsno").val();
		var pulls=$("#gPulls").val();
		var pullDone=$("#gPullDone").val();
		var pullGood=$("#gPullGood").val();
		var pullLate=$("#gPullLate").val();
		var pullCopy=$("#gPullCopy").val();
		var pullBad=$("#gPullBad").val();
		var pullBug=$("#gPullBug").val();
		var pullDemo=$("#gPullDemo").val();
		var pullInteresting=$("#gPullInteresting").val();
		var Commits=$("#gCommits").val();
		var ChangedFiles=$("#gChangedFiles").val();
		var Comments=$("#gComments").val();
		var score=$("#gScore").val();
		if(terms_id=="0"||course_id=="0"||org=="" ||proj=="" ||sno =="" || pulls==""||pullDone==""||pullGood==""||pullLate =="" ||pullCopy==""||pullBad==""||pullBug==""||pullDemo ==""|| pullInteresting=="" ||Commits==""|| ChangedFiles==""||  Comments=="" || score==""){
			alert('请将信息填写完整');
			return;
		}
	
			$.ajax({
				url:'AddSvlt',
				type:'post',
				data:{"tbname":"reposdate","terms_id":terms_id,"org":org,"proj":proj,"course_id":course_id,"sno":sno,"pulls":pulls,"pullDone":pullDone,"pullGood":pullGood,"pullLate":pullLate,"pullCopy":pullCopy,"pullBad":pullBad,"pullBug":pullBug,"pullDemo":pullDemo,"pullInteresting":pullInteresting,"Commits":Commits,"ChangedFiles":ChangedFiles,"Comments":Comments,"score":score},
				dataType:'json',
				success:function(data){
						alert(data.msg);
						window.location.href="<%=basePath %>InitSvlt?tbname=tGitDate";
				}
			});
		
	
	}
	//查询
	function cktj(){
		var userid=${userid};
		var tbname="reposdate";
		var sqls="select students.sname, terms.termname,course.cname,classinfo.classname,"+tbname+".* from "+tbname+",students,course,terms,classinfo  where classinfo.id=students.classinfo_id and students.sno=Num and course_id=course.id and "+tbname+".terms_id=terms.id  and "+tbname+".tid="+userid ;
		var termsid=$("#cktermsid").val();
		if(termsid!="0"){
			sqls+=" and terms_id="+termsid;
		}
		var classinfoid=$("#ckclassinfoid").val();
		if(classinfoid!="0"){
			sqls+=" and classinfo.id="+classinfoid;
		}
		var courseid=$("#ccoursesid").val();
		if(courseid!="0"){
			sqls+=" and course_id="+courseid;
		}
		var  ckunum=$("#ckunum").val();
		if(ckunum != ""){
			sqls+=" and Num="+ckunum;
		}
		sqls+=" order by Num ASC ";			
		$.ajax({
			url:'CkSvlt',
			type:'post',
			data:{"sql":sqls},
			dataType:'json',
			success:function(data){
				if(data.msg==1){
					window.location.href="<%=basePath %>InitSvlt?tbname=tGitDate";
				}else{
					alert(data.msg);
				}
			}
		});
	}
	function delsbt(){
		var ids="";
		$("input:checkbox").each(
			function(){
				if($(this).prop("checked")){
					var nm=$(this).prop("name");
					if(nm.indexOf("delid")==0){
						ids+=$(this).val()+",";
					}
				}
			}
		);
		if(ids==""){
			alert("请选择所要删除的数据.");
			return;
		};
		//alert(ids);
		$.ajax({
			url:'DelSvlt',
			type:'post',
			dataType:'json',
			data:{"ids":ids,"tbname":"reposdate"},
			success:function(data){
				window.location.href="<%=basePath %>InitSvlt?flgs=1&tbname=tGitDate";
				alert(data.msg);
			}
		});
		}
	function addsbt(){
		//添加信息。点击添加之后，获取多选框中数组值的第一个数据给对应的id；
			$("#flagi").val("add");
			$("#gterms_id").val('0');
			$("#gclassinfo_id").val('0');
			$("#gcourse_id").val('0');
			$("#gteacher_id").val('0');
			$('#myModal').modal();
		
	}
	
	//取消
	function rst(){
	window.location.href="<%=basePath %>InitSvlt?flgs=1&tbname=tGitDate";
	}
	$(document).ready(function(){
			  $(".exportSelect").click(function(){
				  $("#flagi").val("select");
					$("#gterms_id").val('0');
					$("#gclassinfo_id").val('0');
					$("#gcourse_id").val('0');
					$('#myModal').modal();
			  });
			  $(".alertTest").click(function(){
				  var jsonData = ${alistJson };
					 
				    //列标题，逗号隔开，每一个逗号就是隔开一个单元格
				    let str = `班级,课程,姓名,学号,Pulls,PullDone,PullGood,PullLate,PullCopy,PullBad,PullBug,PullDemo,PullInteresting,Commits,Additions,Deletions,ChangedFiles,Comments,成绩\n`;
				    //增加\t为了不让表格显示科学计数法或者其他格式
				    for(let i = 0 ; i < jsonData.length ; i++ ){
				      for(let item in jsonData[i]){
				      	if(item=="classname"){			        
				          str+=jsonData[i][item] + '\t'+',';   
				          }  
				      }
				      for(let item in jsonData[i]){
					      	if(item=="cname"){			        
					          str+=jsonData[i][item] + '\t'+',';   
					          }  
					  }
				      for(let item in jsonData[i]){
					      	if(item=="sname"){			        
					          str+=jsonData[i][item] + '\t'+',';   
					          }  
					   }
				      for(let item in jsonData[i]){
					      	if(item=="num"){			        
					          str+=jsonData[i][item] + '\t'+',';   
					          }  
					  }
				      for(let item in jsonData[i]){
				      	if(item=="pulls"){			        
				          str+=jsonData[i][item] + '\t'+',';   
				          }  
				      }
				      for(let item in jsonData[i]){
					      	if(item=="pullDone"){			        
					          str+=jsonData[i][item] + '\t'+',';   
					          }  
					  }
				      for(let item in jsonData[i]){
					      	if(item=="pullGood"){			        
					          str+=jsonData[i][item] + '\t'+',';   
					          }  
					   }
				      for(let item in jsonData[i]){
					      	if(item=="pullLate"){			        
					          str+=jsonData[i][item] + '\t'+',';   
					          }  
					  }
				      for(let item in jsonData[i]){
					      	if(item=="pullCopy"){			        
					          str+=jsonData[i][item] + '\t'+',';   
					          }  
					      }
				      for(let item in jsonData[i]){
					      	if(item=="pullBad"){			        
					          str+=jsonData[i][item] + '\t'+',';   
					          }  
					  }
				      for(let item in jsonData[i]){
					      	if(item=="pullBug"){			        
					          str+=jsonData[i][item] + '\t'+',';   
					          }  
					   }
				      for(let item in jsonData[i]){
					      	if(item=="pullDemo"){			        
					          str+=jsonData[i][item] + '\t'+',';   
					          }  
					  }
					      
				      for(let item in jsonData[i]){
					      	if(item=="pullInteresting"){			        
					          str+=jsonData[i][item] + '\t'+',';   
					          }  
					      }
				      for(let item in jsonData[i]){
					      	if(item=="commits"){			        
					          str+=jsonData[i][item] + '\t'+',';   
					          }  
					  }
				      for(let item in jsonData[i]){
					      	if(item=="additions"){			        
					          str+=jsonData[i][item] + '\t'+',';   
					          }  
					   }
				      for(let item in jsonData[i]){
					      	if(item=="deletions"){			        
					          str+=jsonData[i][item] + '\t'+',';   
					      	}
				      }
					     
				      for(let item in jsonData[i]){
					      	if(item==" changedFiles"){			        
					          str+=jsonData[i][item] + '\t'+',';   
					          }  
					  }
				      for(let item in jsonData[i]){
					      	if(item=="comments"){			        
					          str+=jsonData[i][item] + '\t'+',';   
					          }  
					   }
				      for(let item in jsonData[i]){
					      	if(item=="reviewComments"){			        
					          str+=jsonData[i][item] + '\t'+',';   
					      	}
				      }
				      //将成绩排在最后一列
				      for(let item in jsonData[i]){
				      	if(item=="score"){			        
				          str+=jsonData[i][item] + '\t'+',';   
				          }  
				      }
				      str+='\n';
				    }
				    
				   
				    //encodeURIComponent解决中文乱码
				    let uri = 'data:text/csv;charset=utf-8,\ufeff' + encodeURIComponent(str);
				    //通过创建a标签实现
				    var link = document.createElement("a");
				    link.href = uri;
				    //对下载的文件命名
				    link.download =  "成绩单.csv";
				    document.body.appendChild(link);
				    link.click();
				    document.body.removeChild(link);	
				    jsonData = [];
			  });
	});
	
	
	
	
	
	</script>
  </body>
</html>