<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>score</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/demo.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/easyui.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/icon.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/syscss.css">
		<script type="text/javascript" src="<%=basePath%>js/jquery-2.2.3.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="<%=basePath %>js/syssmp.js"></script>
		<script type="text/javascript">
			function addbt(){
				$("#flagi").val("add");
				$("#gclassinfo_id").combobox('setValue','0');
				$("#gterms_id").combobox('setValue','0');
				$("#gcourse_id").combobox('setValue','0');
				$("#gstudents_id").combobox('setValue','0');
				$("#gsval").textbox('setValue','');
				$("#dlg").dialog('open');
				$("#dlg").dialog({modal:true});
			}
			function getcc(){
				var termsid=$("#gterms_id").combobox('getValue');
				var chtml=[{ 'text':'选择课程','id':'0'}];
				var html=[{ 'text':'选择班级','id':'0'}];
				var shtml=[{ 'text':'选择学生','id':'0'}];
				if(termsid=="0"){
					$("#gcourse_id").combobox("loadData", chtml);
					$("#gclassinfo_id").combobox("loadData",html);
					$("#gstudents_id").combobox("loadData",shtml);
					$("#gcourse_id").combobox("setValue","0");
					$("#gclassinfo_id").combobox("setValue","0");
					$("#gstudents_id").combobox("setValue","0");
					return;
				}
				$.ajax({
					url:'GetCCSvlt',
					type:'post',
					dataType:'json',
					data:{"termsid":termsid},
					success:function(data){
	    				var cl=data.cllist;
	    				$(cl).each(function(i,t){
	    					html.push({"text":t.classname,"id":t.id});    					
	    				});
	    				$("#gclassinfo_id").combobox("loadData",html);
	    				$("#gclassinfo_id").combobox("setValue","0");
	    				var c=data.clist;
	    				$(c).each(function(i,t){
	    					chtml.push({"text":t.cname,"id":t.id});	
	    				});
	    				$("#gcourse_id").combobox("loadData", chtml);
	    				$("#gcourse_id").combobox("setValue","0");
					}
				});
			}
			function getclass(){
				var termsid=$("#ckterm").combobox('getValue');
				var html=[{ 'text':'选择班级','id':'0'}];
				if(termsid=="0"){
					$("#ckclass").combobox("loadData", html);
					$("#ckclass").combobox("setValue","0");
					return;
				}
				$.ajax({
					url:'GetCSvlt',
					type:'post',
					dataType:'json',
					data:{"termsid":termsid},
					success:function(data){
	    				var cl=data.cllist;
	    				$(cl).each(function(i,t){
	    					html.push({"text":t.classname,"id":t.id});  
	    				});
	    				$("#ckclass").combobox("loadData", html);
					}
				});
			}
			function getstu(){
				var classid=$("#gclassinfo_id").combobox('getValue');
				var shtml=[{ 'text':'选择学生','id':'0'}];;
				if(classid=="0"){
					$("#gstudents_id").combobox("loadData",shtml);
					return;
				}
				$.ajax({
					url:'GetstuSvlt',
					type:'post',
					dataType:'json',
					data:{"classid":classid},
					success:function(data){
	    				var cl=data.clist;
	    				$(cl).each(function(i,t){
	    					shtml.push({"text":t.sname,"id":t.id}); 
	    				});	    
	    				$("#gstudents_id").combobox("loadData",shtml);
					}
				});
			}
			function updbt(id){
				$.ajax({
				url:'GetDataSvlt',
				type:'post',
				dataType:'json',
				data:{"tbname":"score","id":id},
				success:function(data){	
					var ob=data.ob;
					$("#flagi").val("upd");
					$("#idi").val(id);
					$("#dlg").dialog('open');
					$("#dlg").dialog({modal:true});
					var termsid=ob.terms_id;
					var classid=ob.classinfo_id;
					var stuid=ob.students_id;
					var cid=ob.course_id;
					var chtml=[{ 'text':'选择课程','id':'0'}];
					var html=[{ 'text':'选择班级','id':'0'}];
					var shtml=[{ 'text':'选择学生','id':'0'}];
					$("#gterms_id").combobox('setValue',termsid);
					$.ajax({
						url:'GetCCSvlt',
						type:'post',
						dataType:'json',
						data:{"termsid":termsid},
						success:function(data){
		    				var cl=data.cllist;
		    				$(cl).each(function(i,t){
		    					html.push({"text":t.classname,"id":t.id}); 
		    				});
		    				$("#gclassinfo_id").combobox("loadData",html);
		    				var c=data.clist;
		    				$(c).each(function(i,t){
		    					chtml.push({"text":t.cname,"id":t.id}); 
		    				});
		    				$("#gcourse_id").combobox("loadData",chtml);
							$("#gclassinfo_id").combobox('setValue',classid);
							$("#gcourse_id").combobox('setValue',cid);
						}
					});
					
					$.ajax({
						url:'GetstuSvlt',
						type:'post',
						dataType:'json',
						data:{"classid":classid},
						success:function(data){
		    				var cl=data.clist;
		    				$(cl).each(function(i,t){
		    					shtml.push({"text":t.sname,"id":t.id}); 
		    				});	  
		    				$("#gstudents_id").combobox("loadData",shtml);
		    				$("#gstudents_id").combobox('setValue',stuid);
						}
					});
					$("#gsval").textbox('setValue',ob.sval);
				}
			});
		}
		//保存
		function gltj(){
			var terms_id=$("#gterms_id").combobox('getValue');
			var classinfo_id=$("#gclassinfo_id").combobox('getValue');
			var course_id=$("#gcourse_id").combobox('getValue');
			var students_id=$("#gstudents_id").combobox('getValue');
			var sval=$("#gsval").textbox('getValue');
			var id=$("#idi").val();
			var flag=$("#flagi").val();
			if(classinfo_id=="0"||students_id=="0"||course_id=="0"||terms_id=="0"||sval==""){
				alert('成绩信息不完整。');
				return;
			}
			if("add"==flag){
				$.ajax({
					url:'AddSvlt',
					type:'post',
					data:{"tbname":"score","classinfo_id":classinfo_id,"course_id":course_id,"terms_id":terms_id,"students_id":students_id,"sval":sval},
					dataType:'json',
					success:function(data){
						alert(data.msg);
					}
				});
			}else if("upd"==flag){
				$.ajax({
					url:'UpdSvlt',
					type:'post',
					data:{"tbname":"score","id":id,"classinfo_id":classinfo_id,"course_id":course_id,"terms_id":terms_id,"students_id":students_id,"sval":sval},
					dataType:'json',
					success:function(data){
						alert(data.msg);
					}
				});
			}
		}
		//取消
		function rst(){
			window.location.href="InitSvlt?tbname=score";
		}
		//查询
		function cktj(){
			var sqls="select score.*,termname,classname,cname,tname,sno,sname from courseplan,score,classinfo,course,teacher,terms,students where classinfo.id=courseplan.classinfo_id and students.id=students_id and terms_id=terms.id and courseplan.id=courseplan_id and courseplan.teacher_id=teacher.id and  course.id=course_id and teacher.id="+${userid};
			var termsid=$("#ckterm").combobox('getValue');
			if(termsid!="0"){
				sqls+=" and terms.id="+termsid;
			}else{
				alert("请选择学期");
				return;
			}
			var classid=$("#ckclass").combobox('getValue');
			if(classid!="0"){
				sqls+=" and classinfo.id="+classid;
			}else{
				alert("请选择班级");
				return;
			}
			$.ajax({
				url:'CkSvlt',
				type:'post',
				data:{"sql":sqls},
				dataType:'json',
				success:function(data){
					if(data.msg==1){
						window.location.href="InitSvlt?tbname=score";
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
			$.ajax({
				url:'DelSvlt',
				type:'post',
				dataType:'json',
				data:{"ids":ids,"tbname":"score"},
				success:function(data){
					window.location.href="InitSvlt?tbname=score";
					alert(data.msg);
				}
			});
		}
		$(function(){
			$("#dlg").dialog({closable: false});
			$("#dlg").dialog('close');
			$("#gterms_id").combobox({  
		         //相当于html >> select >> onChange事件  
		         onChange:function(){  
		             getcc();  
		         }}) ;
			$("#gclassinfo_id").combobox({  
		         //相当于html >> select >> onChange事件  
		         onChange:function(){  
		             getstu();  
		         }}) ;
			$("#ckterm").combobox({  
		         //相当于html >> select >> onChange事件  
		         onChange:function(){  
		             getclass();  
		         }}) ;
		})
	</script>
</head>
<body>	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="STYLE7" style="padding-left: 50px;">成绩信息管理</td>
					<td style="padding-right:10px;"><div align="right" style="padding-right: 50px;">
						<table border="0" align="right" cellpadding="0" cellspacing="0">
							<tr>
								<td class="STYLE3">
									学期：<select id="ckterm"  class="ckinput easyui-combobox" >
											<option value="0">选择学期</option>
											<c:forEach var="a" items="${termslist }">
												<option value="${a.id }">${a.termname }</option>
											</c:forEach>
										</select>
								</td>
								<td class="STYLE3">
									班级：<select id="ckclass" class="ckinput easyui-combobox" data-options="editable:false,valueField:'id', textField:'text'" >
											<option value="0">选择班级</option>											
										</select>
								</td>
								<td width="60">
									<table border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td class="STYLE1"><div align="center"><a href="javascript:void(0);" onclick="cktj();return false;"><img src="images/search.png" width="14" height="14" /></a></div></td>
											<td class="STYLE1"><div align="center"><a href="javascript:void(0);" onclick="cktj();return false;">查询</a></div></td>
										</tr>
									</table>
								</td>
								<td width="60"><table border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td class="STYLE1"><div align="center"><a href="javascript:void(0);" onclick="addbt();return false;"><img src="images/001.gif" width="14" height="14" /></a></div></td>
										<td class="STYLE1"><div align="center"><a href="javascript:void(0);" onclick="addbt();return false;">新增</a></div></td>
									</tr>
								</table></td>
								<td width="52"><table border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td class="STYLE1"><div align="center"><a href="javascript:void(0);" onclick="delsbt();return false;"><img src="images/083.gif" width="14" height="14" /></a></div></td>										<td class="STYLE1"><div align="center"><a href="javascript:void(0);" onclick="delsbt();return false;">删除</a></div></td>
									</tr>
								</table></td>
							</tr>
						</table>
					</div></td>
				</tr>
			</table></td>
		</tr>
		<tr>
			<td style="width: 100%;">
				<div id="nrdiv">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#c9c9c9">
								<tr>
									<td width="5%" align="center" bgcolor="#FFFFFF" style="font-size: 12px;">
									</td>
									<td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">学期</span></strong></div></td>
									<td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">班级</span></strong></div></td>
									<td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">课程</span></strong></div></td>
									<td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">学号</span></strong></div></td>
									<td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">姓名</span></strong></div></td>
									<td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">分值</span></strong></div></td>
									<td width="5%" height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1"></span></strong></div></td>
								</tr>
								<c:forEach var="a" items="${alist }">
									<tr>
										<td align="center" height="22" bgcolor="#FFFFFF">
											<input name="delid" type="checkbox" value="${a.id }"/>
										</td>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${a.termname }</span></div></td>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${a.classname }</span></div></td>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${a.cname }</span></div></td>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${a.sno }</span></div></td>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${a.sname }</span></div></td>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${a.sval }</span></div></td>
										<td height="22" bgcolor="#FFFFFF"><div align="center" class="STYLE3">
											<table border="0" cellpadding="0" cellspacing="0">
												<tr>
													<td class="STYLE1"><div align="center"><a href="javascript:void(0);" onclick="updbt('${a.id}');return false;"><img src="images/114.gif" width="14" height="14" /></a></div></td>
													<td class="STYLE1"><div align="center"><a href="javascript:void(0);" onclick="updbt('${a.id}');return false;">修改</a></div></td>
												</tr>
											</table>
										</div></td>
									</tr>
								</c:forEach>
							</table></td>
						</tr>
						<tr>
							<td height="35">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="12" height="35"></td>
										<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td class="STYLE4">&nbsp;&nbsp;共有 ${allnums } 条记录，当前第 ${pagenum }/${pagenums } 页</td>
												<td><table border="0" align="right" cellpadding="0" cellspacing="0">
													<tr>
														<td width="40"><a href="javascript:void(0);" onclick="sybtdown('PagingSvlt?flag=1','score');return false;"><img src="images/first.gif" width="37" height="15"/></a></td>
														<td width="45"><a href="javascript:void(0);" onclick="syybtdown('PagingSvlt?flag=2','score');return false;"><img src="images/back.gif" width="37" height="15"/></a></td>
														<td width="45"><a href="javascript:void(0);" onclick="xyybtdown('PagingSvlt?flag=3','score');return false;"><img src="images/next.gif" width="37" height="15"/></a></td>
														<td width="40"><a href="javascript:void(0);" onclick="wybtdown('PagingSvlt?flag=4','score');return false;"><img src="images/last.gif" width="37" height="15"/></a></td>
														<td width="100"><div align="center"><span class="STYLE1"> </span></div></td>
														<td width="40"></td>
													</tr>
												</table></td>
											</tr>
										</table></td>
										<td width="16"></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
		<tr>
			<td style="width: 100%;" align="center">
				<div id="dlg" class="easyui-dialog" title=" "  style="width:100%;max-width:400px;padding:30px 60px;">
					<form id="ff" method="post">
						<div style="margin-bottom:20px">
							<select id="gterms_id" class="easyui-combobox"  name="gcourseplan_id" style="width:100%"  data-options="label:'学期:'">
								<option value="0">选择学期</option>
								<c:forEach var='a' items='${termslist}'>
									<option value="${a.id }">${a.termname }</option>
								</c:forEach>
							</select>
						</div>
						<div style="margin-bottom:20px">
							<select id="gcourse_id" class="easyui-combobox" name="gcourseplan_id" style="width:100%"  data-options="label:'课程:',editable:false,valueField:'id', textField:'text'">
								<option value="0">选择课程</option>								
							</select>
						</div>
						<div style="margin-bottom:20px">
							<select id="gclassinfo_id" class="easyui-combobox"  name="gcourseplan_id" style="width:100%"  data-options="label:'班级:',editable:false,valueField:'id', textField:'text'">
								<option value="0">选择班级</option>
							</select>
						</div>
						<div style="margin-bottom:20px">
							<select id="gstudents_id" class="easyui-combobox" name="gstudents_id" style="width:100%"  data-options="label:'学生:',editable:false,valueField:'id', textField:'text'">
								<option value="0">选择学生</option>								
							</select>
						</div>
						<div style="margin-bottom:20px">
							<input id="gsval" class="easyui-textbox" name="gsval" style="width:100%"  data-options="label:'分值:'"/>
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
	</body>
</html>
