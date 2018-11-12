<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">		
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>课程安排</title>
							
		<script type="text/javascript" src="<%=basePath%>js/jquery-3.3.1.min.js"></script>	
		<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js.下载"></script>
		<!-- 翻页-->
		<script type="text/javascript" src="<%=basePath %>js/syssmp.js"></script>
		<!-- 头部底部 -->
		<link rel="stylesheet" href="<%=basePath%>css/titleFooter.css" />
<!-- 对话框 -->
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/demo.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/easyui.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/icon.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/syscss.css">
		
		<script type="text/javascript" src="<%=basePath%>js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="<%=basePath %>js/syssmp.js"></script>
<!-- 大体布局 -->		
		<link rel="stylesheet" href="<%=basePath%>assets/css/amazeui.css" />
		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="<%=basePath%>assets/css/core.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/menu.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/index.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/admin.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/page/typography.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/page/form.css" />
		
	
<style> 
  .banner, .footer {
      background-color: ${other.bgColor};
     /* background-image:${other.imgPath};   */
      color: ${other.wordColor};     
    }
   .hiddenli{
  display:none !important;
  
  }
  @media screen and (max-width: 640px) {
   .hiddenli{
  display:block !important;
  
  } 
  
</style>
<script type="text/javascript">
function addbt(){	//添加信息。点击添加之后，获取多选框中数组值的第一个数据给对应的id；
	$("#flagi").val("add");
	$("#gterms_id").combobox('setValue','0');
	$("#gclassinfo_id").combobox('setValue','0');
	$("#gcourse_id").combobox('setValue','0');
	$("#gteacher_id").combobox('setValue','0');
	$("#dlg").dialog('open');
	$("#dlg").dialog({modal:true});
}
function updbt(id){	//更新信息，点击修改按钮之后，获取所选对象的值
	$.ajax({
	url:'GetDataSvlt',
	type:'post',
	dataType:'json',
	data:{"tbname":"courseplan","id":id},
	success:function(data){	
		var ob=data.ob;
		$("#flagi").val("upd");
		$("#idi").val(id);
		$("#dlg").dialog('open');
		$("#dlg").dialog({modal:true});
		$("#gterms_id").combobox('setValue',ob.terms_id);
		$("#gclassinfo_id").combobox('setValue',ob.classinfo_id);
		$("#gcourse_id").combobox('setValue',ob.course_id);
		$("#gteacher_id").combobox('setValue',ob.teacher_id);
	}
});
}
//保存
function gltj(){	//点击提交按钮，先判断是添加操作/更新操作；然后执行相应的操作
var terms_id=$("#gterms_id").combobox('getValue');
var classinfo_id=$("#gclassinfo_id").combobox('getValue');
var course_id=$("#gcourse_id").combobox('getValue');
var teacher_id=$("#gteacher_id").combobox('getValue');
var id=$("#idi").val();
var flag=$("#flagi").val();
if(terms_id=="0"||classinfo_id=="0"||course_id=="0"||teacher_id=="0"){
	alert('课程安排信息不完整。');
	return;
}
if("add"==flag){
	$.ajax({
		url:'AddSvlt',
		type:'post',
		data:{"tbname":"courseplan","terms_id":terms_id,"classinfo_id":classinfo_id,"course_id":course_id,"teacher_id":teacher_id},
		dataType:'json',
		success:function(data){
			alert(data.msg);
		}
	});
}else if("upd"==flag){
	$.ajax({
		url:'UpdSvlt',
		type:'post',
		data:{"tbname":"courseplan","id":id,"terms_id":terms_id,"classinfo_id":classinfo_id,"course_id":course_id,"teacher_id":teacher_id},
		dataType:'json',
		success:function(data){
			alert(data.msg);
		}
	});
}
}
//取消
function rst(){
window.location.href="InitSvlt?tbname=courseplan";
}
//查询
function cktj(){
var sqls="select termname,classno,classname,cno,cname,tNo,tName,sex, courseplan.* from terms,classinfo,course,teacher, courseplan where 1=1  and terms.id=terms_id and classinfo.id=classinfo_id and course.id=course_id and teacher.id=courseplan.teacher_id";
var tid=$("#cktid").val();
if(tid!="0"){
	sqls+=" and teacher_id="+tid;
}
var termsid=$("#cktermsid").val();
if(termsid!="0"){
	sqls+=" and terms_id="+termsid;
}
var classid=$("#ckclassid").val();
if(classid!="0"){
	sqls+=" and classinfo_id="+classid;
}
$.ajax({
	url:'CkSvlt',
	type:'post',
	data:{"sql":sqls},
	dataType:'json',
	success:function(data){
		if(data.msg==1){
			window.location.href="InitSvlt?tbname=courseplan";
		}else{
			alert(data.msg);
		}
	}
});
}
function delsbt(){	//点击删除按钮，执行删除操作
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
$.ajax({
	url:'DelSvlt',
	type:'post',
	dataType:'json',
	data:{"ids":ids,"tbname":"courseplan"},
	success:function(data){
		window.location.href="InitSvlt?tbname=courseplan";
		alert(data.msg);
	}
});
}
$(function(){	//关闭弹窗对话
$("#dlg").dialog({closable: false});
$("#dlg").dialog('close');
})
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
				<ul class="am-nav am-navbar-nav am-navbar-left ">
					
					
					<li>
						
					<h4 class="page-title">课程安排信息管理</h4></li>
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
	                            <img src="<%=basePath%>assets/img/avatar-8.jpg" alt="user-img" title="${userinfo.name }" class="img-circle img-thumbnail img-responsive">
	                            <div class="user-status offline"><i class="am-icon-dot-circle-o" aria-hidden="true"></i></div>
	                        </div>
	                        <h5>${userinfo.name } </h5>
	                        <ul class="list-inline">
	                            <li>
	                                <a href="<%=basePath %>InitSvlt?flgs=1&tbname=adminInfo" class="text-custom">
	                                    <i class="fa fa-cog" aria-hidden="true">设置</i>
	                                </a>
	                            </li>
								<li>
	                                <a href="<%=basePath %>admin/loginOut.jsp" class="text-custom">
	                                    <i class="fa fa-sign-out" aria-hidden="true">退出</i>
	                                </a>
	                            </li>
	
	                            
	                        </ul>
	                    </div>
	                    <!-- End User -->
	            
						<ul class="am-list admin-sidebar-list">
						    <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=homepage"><span class="am-icon-home"></span> 首页</a></li>
						    <li class="admin-parent">
						      <a class="am-cf" data-am-collapse="{target: '#collapse-nav1'}"><span class="am-icon-th-list"></span> 前端页面管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
						      <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav1">
						        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=title" class="am-cf"> 页面风格管理</span></a></li>
						        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=fnav"> 一级标题管理</a></li>
						        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=snav"> 二级标题管理</a></li>
						      </ul>
						    </li>
						    <li class="admin-parent">
						      <a class="am-cf" data-am-collapse="{target: '#collapse-nav2'}"><i class="am-icon-th-list" aria-hidden="true"></i> 教学管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
						      <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav2">
						        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=teacher" class="am-cf"> 教师信息管理</span></a></li>
						        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=terms"> 学期信息管理</span></a></li>
						        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=classinfo" class="am-cf"> 班级信息管理</span></a></li>
						        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=students" class="am-cf"> 学生信息管理</span></a></li>
						        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=course" class="am-cf"> 课程信息管理</span></a></li>
						        <li><a href="<%=basePath %>InitSvlt?flgs=1&tbname=courseplan" class="am-cf"> 课程安排</span></a></li>
						      </ul>
						    </li>
						    <li class="hiddenli"><a href="<%=basePath %>InitSvlt?flgs=1&tbname=adminInfo"> 个人设置</a></li>
					        
					        <li class="hiddenli"><a href="<%=basePath %>admin/loginOut.jsp"> 退出登录</a></li>
						  </ul>
				</div>
				  </div>
				  <!-- sidebar end -->
    
				<!--</div>
			</div>
		</div>-->
		<!-- ========== Left Sidebar end ========== -->
		<!--	<div class="am-g">-->
		<!-- ============================================================== -->
		<!-- Start right Content here -->
		<div class="content-page">
			<!-- Start content -->
			<div class="content">
				<div class="card-box">
					<!-- Row start -->
					<div class="am-g">
						<div class="am-u-sm-12 am-u-md-6">
				          <div class="am-btn-toolbar">
				            <div class="am-btn-group am-btn-group-xs">
				              
				              <button type="button" class="am-btn am-btn-default "   onclick="addbt();return false;"><span class="am-icon-plus"></span> 新增</button>
				              
				              <button type="button" class="am-btn am-btn-default" onclick="delsbt();return false;"><span class="am-icon-trash-o"></span> 删除</button>
				            </div>
				            <div class="am-input-group am-input-group-xs">
				        	 学期：<select id="cktermsid" >
									<option value="0">所有学期</option>
									<c:forEach var="a" items="${termslist }">
										<option value="${a.id }">${a.termname }</option>
									</c:forEach>
								</select>
				        	 </div>
				        	 <div class="am-input-group am-input-group-xs">
				        	 班级：<select id="ckclassid" >
									<option value="0">所有班级</option>
									<c:forEach var="a" items="${classinfolist }">
										<option value="${a.id }">${a.classname }</option>
									</c:forEach>
								</select>
				        	 </div>
				          </div>
				        </div>	
				        
				        <div class="am-u-sm-12 am-u-md-3">
				        	 
				        </div>
						<div class="am-u-sm-12 am-u-md-3">
				          <div class="am-input-group am-input-group-sm">
				               
				        	教师：<select id="cktid" >
									<option value="0">所有教师</option>
									<c:forEach var="a" items="${teacherlist }">
										<option value="${a.id }">${a.tName }</option>
									</c:forEach>
								</select>
				        	        	
				          <span class="am-input-group-btn">
				            <button class="am-btn am-btn-default" type="button" onclick="cktj();return false;">查询</button>
				          </span>
				          </div>
				        </div>
				      </div>
					  <!-- Row end -->
					  
					  <!-- Row start -->
					  	<div class="am-g">
	<div class="am-u-sm-12">
     <!--    <form class="am-form">  --> 
            <table class="am-table am-table-striped am-table-hover table-main">
              <thead>
              <tr>
                <th class="table-check"></th><th class="table-title">学期</th><th>班级</th><th>课程</th><th>任课教师</th><th class="table-set">操作</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach var="a" items="${alist }">
              <tr>
                <td><input name="delid" type="checkbox" value="${a.id }"/></td>                
                <td>${a.termname }</td>
                <td>${a.classname }</td>
                <td>${a.cname }</td>
                <td>${a.tName }</td>
                <td>
                  <div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">

                      
                      <button class="am-btn am-btn-default am-btn-xs am-text-secondary" onclick="updbt('${a.id}');return false;" data-am-modal="{target: '#addFnav'}"><span class="am-icon-file-text-o" ></span> 修改</button>
                      
                    </div>
                  </div>
                </td>
              </tr>
              </c:forEach>
			</tbody>
            </table>
            <div class="am-cf">
              共有 ${allnums } 条记录，当前第 ${pagenum }/${pagenums } 页
              <div class="am-fr">
                <ul class="am-pagination">
                  <li ><a href="javascript:void(0);" onclick="sybtdown('PagingSvlt?flag=1','courseplan');return false;">«</a></li>
                  <li ><a href="javascript:void(0);" onclick="syybtdown('PagingSvlt?flag=2','courseplan');return false;">&lt;</a></li>
                  <li ><a href="javascript:void(0);" onclick="xyybtdown('PagingSvlt?flag=3','courseplan');return false;">&gt;</a></li>                 
                  <li><a href="javascript:void(0);" onclick="wybtdown('PagingSvlt?flag=4','courseplan');return false;">»</a></li>
                </ul>
              </div>
            </div>
            
            
        <input type="hidden" id="hrownums" value="${rownums }" />
		<input type="hidden" id="hpagenum" value="${pagenum }" />
		<input type="hidden" id="hpagenums" value="${pagenums }" />
		<input type="hidden" id="idi" value="" />
		<input type="hidden" id="flagi" value="" />
		<div style="display: none;">
			<form id="fm" action="" method="post">
				<input id="pt" name="tbname"/>
			</form>
		</div>
        <hr />
         
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
      	<tr>
			<td style="width: 100%;" align="center">
				<div id="dlg" class="easyui-dialog" title=" "  style="width:100%;max-width:400px;padding:30px 60px;">
					<form id="ff" method="post">
						<div style="margin-bottom:20px">
							<select id="gterms_id" class="easyui-combobox" name="gterms_id" style="width:100%"  data-options="label:'学期:'">
								<option value="0">选择学期</option>
								<c:forEach var='a' items='${termslist}'>
									<option value="${a.id }">${a.termname }</option>
								</c:forEach>
							</select>
						</div>
						<div style="margin-bottom:20px">
							<select id="gclassinfo_id" class="easyui-combobox" name="gclassinfo_id" style="width:100%"  data-options="label:'班级:'">
								<option value="0">选择班级</option>
								<c:forEach var='a' items='${classinfolist}'>
									<option value="${a.id }">${a.classname }</option>
								</c:forEach>
							</select>
						</div>
						<div style="margin-bottom:20px">
							<select id="gcourse_id" class="easyui-combobox" name="gcourse_id" style="width:100%"  data-options="label:'课程:'">
								<option value="0">选择课程</option>
								<c:forEach var='a' items='${courselist}'>
									<option value="${a.id }">${a.cname }</option>
								</c:forEach>
							</select>
						</div>
						<div style="margin-bottom:20px">
							<select id="gteacher_id" class="easyui-combobox" name="gteacher_id" style="width:100%"  data-options="label:'教师:'">
								<option value="0">选择教师</option>
								<c:forEach var='a' items='${teacherlist}'>
									<option value="${a.id }">${a.tName }</option>
								</c:forEach>
							</select>
						</div>
					</form>
					<div style="text-align:center;padding:5px 0">
						<a href="javascript:void(0)" class="easyui-linkbutton" onclick="gltj();return false;" style="width:80px">提  交</a>
						<a href="javascript:void(0)" class="easyui-linkbutton" onclick="rst();return false;" style="width:80px">退  出</a>
					</div>
				</div>
			</td>
		</tr>
	</table>
			
        </div>
		
	 <!-- Row end -->					  
	 </div>	
	
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
</div>
		<!-- end right Content here -->
		<!--</div>-->
		
		
		<!-- navbar -->
		<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"><!--<i class="fa fa-bars" aria-hidden="true"></i>--></a>
		
	<!--  	<script type="text/javascript" src="<%=basePath%>assets/js/jquery-2.1.0.js" ></script>-->
		<script type="text/javascript" src="<%=basePath%>assets/js/amazeui.min.js"></script>
		<script type='application/javascript' src='<%=basePath%>assets/js/fastclick.js'></script>
		<script type="text/javascript" src="<%=basePath%>assets/js/app.js" ></script>
		<script type="text/javascript" src="<%=basePath%>assets/js/blockUI.js" ></script>
		<script src="<%=basePath%>assets/js/amazeui.dialog.min.js"></script>
	</body>
	
</html>



