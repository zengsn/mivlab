<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%request.setCharacterEncoding("UTf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0031)http://mivlab.infoaas.com/#home -->
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 	<base href="<%=basePath%>"> 
  <title>${other.title }</title>
 
  <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
  
  <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">   	
  
  <style>
    .banner, .footer {
      background-color: ${other.bgColor};
      background-image:${other.imgPath};
      color: ${other.wordColor};
    }

    .banner, .footer, .container-fluid {
      padding-left: 10%;
      padding-right: 10%;
    }

    .banner-title {
      margin-left: 90px;
      font-size: 24px;
      padding-bottom: 15px;
    }

    .logo {
      padding-top: 2%;
    }

    /*顶部导航栏*/
    .nav-head {
      background-color: white;
    }

    .nav-head > li {
      display: inline-block;
    }

    .nav-head > li > a {
      color: black;
      font-size: 14px;     
    } 

    .nav-head > li.active,
    .nav-head > li > a:hover  {
      background-color: #b3080a; 
      opacity: 0.8;
      color: white;
    }

    .nav-head > li.active > a {
      background-color: #b3080a; 
       background-image:url(./images/banner.jpg);
      color: white;
    }

    .tab-content {
      margin-top: 15px;
      margin-bottom: 15px;
    }

    /*主题内容*/
    .container-fluid {
      margin-bottom: 40px;
    }

    /*侧边栏样式*/
    .sidebar-banner {
      background-color: #b3080a; 
       background-image:url(./images/banner.jpg);
      text-align: center;
      font-weight: bold;
      font-size: 18px;
      color: white;
      padding-top: 14px;
      padding-bottom: 14px;
      border-radius: 6px;
      box-shadow: 2px 2px 5px #999;
    }

    .nav-sidebar {
      margin-top: 15px;
    }

    .nav-sidebar > li {
      margin-bottom: 5px;
      border-radius: 6px;
      font-size: 16px;
      text-align: center;
      width: 75%;
      margin-left: auto;
      margin-right: auto;
    }

    .nav-sidebar > li > a {
      color: black;
    }

    .nav-sidebar > li.active,
    .nav-sidebar > li > a:hover,
    .nav-sidebar > li > a:focus,
    .nav-sidebar > li > a:active {     
      background-color: #eee;
      border-radius: 6px;
    }

    /*文章正文*/
    .note {
      border: 1px solid #c9c9c9;
      border-radius: 10px;
      padding: 20px 15px 20px 15px;
      min-height: 300px;
    }

    .note p {
    	text-indent: 2em;
    }
    .image img{
    	width:100%;
    	padding:10%;
    	 	    
    }
	.image figcaption{
		text-align:center;
	}
	/*登录窗口*/
	.dialog-init {
		display: none;
	}
    /*页脚*/
    .footer {
      padding-top: 20px;
      padding-bottom: 20px;
      width: 100%;
    }

    .footer .address {
      padding-left: 40px;
    }
@media screen and (max-width: 640px) {
   .top{
  display:none;
  
  }
  </style>
 
<script>
window.onload=function(){	
	$.ajax({				
		url:'HomePage',
		type:'post',		
		
		success:function(data){
			//$("#dlg").dialog('close');
		}
	}) 

 };
 
 function showActive(e){
	 var navId=e;
	
	 var cname=".active"+navId;
	 var remark=".activeRemark"+navId;	
	 $(cname).eq(0).addClass('active');
	 $(remark).eq(0).addClass('active');
 };
 
 //用户登录
function lgbt(){
	$('#myModal').modal();
}
function lgtj(){
	var uname=$("#uname").val();
	var upassword=$("#upassword").val();
	var utype=$("#utype").val();
	if(uname==""||upassword==""){
		alert("请输入账号和密码");
		return;
	}
	
	$.ajax({
		
		url:'LoginSvlt',
		type:'post',
		data:{"username":uname,"password":upassword,"userType":utype},
		dataType:'json',
		success:function(data){
			if(data.msg==1){
				if(utype=="tea"){
					window.location.href="./teacher/main.jsp";
				}else if(utype="stu"){
					window.location.href="./student/main.jsp";
				}else if(utype="admin"){
					window.location.href="<%=basePath %>InitSvlt?flgs=1&tbname=homepage";
				}else{
					alert(data.msg);
				}
				
			}else{
				alert(data.msg);
			}
		}
	});
}


</script> 
</head>
<body >				
  <div class="banner" id="banner">
    <img class="logo" src="${other.logoPath }" alt="logo">
    <div class="banner-title">${other.title }</div> 
  </div>

  <div class="container-fluid">
    <!-- 顶部导航栏 -->
    <ul class="nav nav-head" role="tablist">
      <li role="presentation"><a href="#home">首页</a></li>
      <c:forEach varStatus="st" var="a" items="${navlist }">	
      	    <c:if test="${st.index == 0}"> 	
      	    <li role="presentation" class="active "><a href="#FT${a.id}" aria-controls="FT${a.id}" role="tab" data-toggle="tab">${a.name }</a></li>
      	    </c:if>
      	    <c:if test="${st.index != 0}">
	     	<li role="presentation" onclick="showActive(${a.id})"><a href="#FT${a.id}" aria-controls="FT${a.id}" role="tab" data-toggle="tab">${a.name }</a></li>
      		</c:if>     
     
      </c:forEach>
<!--        <li role="presentation" class="active"><a href="#zxgk" aria-controls="zxgk" role="tab" data-toggle="tab">aaa</a></li>  -->
      <li role="presentation"><a href="<%=basePath %>login.jsp" target="_blank">平台入口</a></li>    
    </ul>   
 
    <!-- 顶部导航内容 -->   		
    <div class="tab-content">
      <c:forEach varStatus="index" var="b" items="${navlist }">
      <c:if test="${index.index == 0}">
      <div role="tabpanel" class="tab-pane active" id="FT${b.id}">
        <div class="row"> 
          <div class="col-xs-6 col-md-4">  
             
            <div class="sidebar-banner">${b.name}</div>
            <div>
              <!-- 侧边导航栏 -->
              <ul class="nav nav-sidebar" role="tablist">  
                  <c:forEach varStatus="st2" var="aa" items="${snavlist }">       	            
	        		<c:if test="${b.id == aa.fnav_id}">
	                     <!-- 若为次导航栏的第一条，设置为class="active"   -->
	                     <c:if test="${st2.index==0}">
	                     	<li role="presentation" class="active"><a href="#note${aa.fnav_id }${st2.index }" aria-controls="note${aa.fnav_id }${st2.index }" role="tab" data-toggle="tab" aria-expanded="false">${aa.snav_name }</a></li>
	                     </c:if>
	                     <c:if test="${st2.index!=0}">	                     
	                        <li role="presentation" class=""><a href="#note${aa.fnav_id }${st2.index }" aria-controls="note${aa.fnav_id }${st2.index }" role="tab" data-toggle="tab" aria-expanded="false">${aa.snav_name }</a></li>
	             		 </c:if> 	             		 
	             	</c:if>	             	
	 			</c:forEach>  	       		 		                     
              </ul>
            </div>
            
          </div>
                  		
          <div class="col-xs-12 col-md-8">
            <!-- 侧边导航内容 -->
            <div class="tab-content">
            <c:forEach varStatus="st3" var="ab" items="${snavlist }">       	            
	          <c:if test="${b.id == ab.fnav_id}">
	          <c:if test="${st3.index==0}">
		          <div role="tabpanel" class="tab-pane active" id="note${ab.fnav_id }${st3.index }">
	                <div class="note">
	                  	<p>${ab.remark }</p> 
	                  	               	
	                </div>
	              </div>
	              
	          </c:if>
	          <c:if test="${st3.index!=0}">
	              <div role="tabpanel" class="tab-pane" id="note${ab.fnav_id }${st3.index }">
	                <div class="note">
	                  	<p>${ab.remark }</p>
	                  	             	
	                </div>
	              </div>
	          </c:if>
            </c:if>
	 	   </c:forEach>                           
            </div>            
          </div>
        </div>
       
     </div>
     </c:if> 
 <!-- 第一导航栏的第二之后的菜单项 -->
 	<c:if test="${b.id != 0}">
 	<div role="tabpanel" class="tab-pane" id="FT${b.id}">
        <div class="row"> 
          <div class="col-xs-6 col-md-4">
            <div class="sidebar-banner">${b.name}</div>
            <!-- 侧边导航栏 -->
            <ul class="nav nav-sidebar" role="tablist">
             <c:forEach varStatus="st4" var="bb" items="${snavlist }">       	            
	        		<c:if test="${b.id == bb.fnav_id}">	                     
              				<li role="presentation" class="active${bb.fnav_id }"><a href="#note${bb.fnav_id }${st4.index }" aria-controls="note${bb.fnav_id }${st4.index }" role="tab" data-toggle="tab">${bb.snav_name }</a></li>             			               			   
              		</c:if>               		        		
              </c:forEach>
           </ul>       
          </div>
          <div class="col-xs-12 col-md-8">
            <!-- 侧边导航内容 -->
            <div class="tab-content">
             <c:forEach varStatus="st5" var="bb" items="${snavlist }">       	            
	          <c:if test="${b.id == bb.fnav_id}">		          
	              	<div role="tabpanel" class="tab-pane activeRemark${bb.fnav_id }" id="note${bb.fnav_id }${st5.index}">
               			 <div class="note"> ${bb.remark }</div>               			
              		</div>
	           </c:if>   
	          </c:forEach>                             
            </div>             
          </div>
        </div>
      </div>
      </c:if>                 		                
     
     </c:forEach>
     </div> 
     
                      	      	   
 </div>
 <!-- dialog  start -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">平台入口</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>                  
                </div>
                <div class="modal-body">
                    <div class="form-group">
                    	<label class="form-label">账号</label>
                   		<input type="email" class="form-control"  id="uname" name="uname" aria-describedby="emailHelp" placeholder="请输入账号">                       
                    </div>
                    <div class="form-group">
                        <label class="form-label">
	               		       密码
	                      <a href="./forgot-password.html" class="float-right small">I forgot password</a>
	                    </label>
	                    <input type="password" class="form-control" id="upassword" name="upassword" placeholder="密码">
                    </div>
                    <div class="form-group">
                        <label for="gtgender">角色</label>
                        <select id="gtgender" class="form-control custom-select">
                       		 <option value="admin">管理员</option>
							<option value="tea">教师</option>
							<option value="stu">学生</option> 							
            
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    
                    <button type="button" id="btn_submit" class="btn btn-primary btn-block" data-dismiss="modal" onclick="lgtj();return false;"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>登录</button>
                </div>
            </div>
          </div>
       </div>
       <!-- dialog  end  -->
 <!-- dlg start
  <div id="dlg" class="easyui-dialog dialog-init" title="平台入口"  style="width:100%;max-width:400px;padding:30px 60px;display:none;">
			<div style="margin-bottom:10px;">
				<input class="easyui-textbox" id="uname" name="uname" label="账 号：" style="width:100%;height:30px;font-size: 14px;" data-options="prompt:'输入账号',iconCls:'icon-man',iconWidth:28">
			</div>
			<div style="margin-bottom:10px;">
				<input class="easyui-passwordbox" id="upassword" name="upassword" label="密 码：" style="width:100%;height:30px;font-size: 14px;" data-options="prompt:'输入密码',iconCls:'icon-lock',iconWidth:28">
			</div>	
			<div style="margin-bottom:10px;">
				<select class="easyui-combobox" id="utype" name="utype" label="角 色：" style="width:100%;height:30px;font-size: 14px;">					
					<option value="tea">教师</option>
					<option value="stu">学生</option>
				</select>
			</div>		
			<div>
				<a href="#" onclick="lgtj();return false;" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="padding:5px 0px;width:100%;">
					<span style="font-size:18px;">登&nbsp;&nbsp;录</span>
				</a>
			</div>
	</div>
	
 dlg end  -->                                     
  
      

 
  <div class="footer">
    <span class="school">建设单位：${other.footer_name }</span>
    <span class="address">${other.footer_Addr }</span>
  </div>

  <!-- jquery -->
  <script src="./js/jquery-3.3.1.min.js"></script>
  <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
  <script src="./js/bootstrap.min.js.下载" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script> 
  
    
	
</body></html>