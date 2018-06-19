<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>courseplan</title>
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
				$("#gterms_id").combobox('setValue','0');
				$("#gclassinfo_id").combobox('setValue','0');
				$("#gcourse_id").combobox('setValue','0');
				$("#gteacher_id").combobox('setValue','0');
				$("#dlg").dialog('open');
				$("#dlg").dialog({modal:true});
			}
			function updbt(id){
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
		function gltj(){
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
			var sqls="select termname,classno,classname,cno,cname,tno,tname,tgender, courseplan.* from terms,classinfo,course,teacher, courseplan where 1=1  and terms.id=terms_id and classinfo.id=classinfo_id and course.id=course_id and teacher.id=courseplan.teacher_id";
			var tid=$("#cktid").combobox('getValue');
			if(tid!="0"){
				sqls+=" and teacher_id="+tid;
			}
			var termsid=$("#cktermsid").combobox('getValue');
			if(termsid!="0"){
				sqls+=" and terms_id="+termsid;
			}
			var classid=$("#ckclassid").combobox('getValue');
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
				data:{"ids":ids,"tbname":"courseplan"},
				success:function(data){
					window.location.href="InitSvlt?tbname=courseplan";
					alert(data.msg);
				}
			});
		}
		$(function(){
			$("#dlg").dialog({closable: false});
			$("#dlg").dialog('close');
		})
	</script>
</head>
<body>	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="STYLE7" style="padding-left: 50px;">课程安排信息管理</td>
					<td style="padding-right:10px;"><div align="right" style="padding-right: 50px;">
						<table border="0" align="right" cellpadding="0" cellspacing="0">
							<tr>
								<td class="STYLE3">
									学期：<select id="cktermsid" class="ckinput easyui-combobox">
											<option value="0">选择学期</option>
											<c:forEach var="a" items="${termslist }">
												<option value="${a.id }">${a.termname }</option>
											</c:forEach>
										</select>
								</td>
								<td class="STYLE3">
									班级：<select id="ckclassid" class="ckinput easyui-combobox">
											<option value="0">选择班级</option>
											<c:forEach var="a" items="${classinfolist }">
												<option value="${a.id }">${a.classname }</option>
											</c:forEach>
										</select>
								</td>
								<td class="STYLE3">
									教师：<select id="cktid" class="ckinput easyui-combobox">
											<option value="0">选择教师</option>
											<c:forEach var="a" items="${teacherlist }">
												<option value="${a.id }">${a.tname }</option>
											</c:forEach>
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
									<td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">代课教师</span></strong></div></td>
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
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${a.tname }</span></div></td>
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
														<td width="40"><a href="javascript:void(0);" onclick="sybtdown('PagingSvlt?flag=1','courseplan');return false;"><img src="images/first.gif" width="37" height="15"/></a></td>
														<td width="45"><a href="javascript:void(0);" onclick="syybtdown('PagingSvlt?flag=2','courseplan');return false;"><img src="images/back.gif" width="37" height="15"/></a></td>
														<td width="45"><a href="javascript:void(0);" onclick="xyybtdown('PagingSvlt?flag=3','courseplan');return false;"><img src="images/next.gif" width="37" height="15"/></a></td>
														<td width="40"><a href="javascript:void(0);" onclick="wybtdown('PagingSvlt?flag=4','courseplan');return false;"><img src="images/last.gif" width="37" height="15"/></a></td>
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
									<option value="${a.id }">${a.tname }</option>
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
