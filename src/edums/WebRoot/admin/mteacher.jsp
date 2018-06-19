<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>teacher</title>
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
				$("#gtno").textbox('setValue','');
				$("#gtname").textbox('setValue','');
				$("#gtgender").combobox('setValue','男');
				$("#gtphone").textbox('setValue','');
				$("#gtaddr").textbox('setValue','');
				$("#gtpassword").textbox('setValue','');
				$("#dlg").dialog('open');
				$("#dlg").dialog({modal:true});
			}
			function updbt(id){
				$.ajax({
				url:'GetDataSvlt',
				type:'post',
				dataType:'json',
				data:{"tbname":"teacher","id":id},
				success:function(data){	
					var ob=data.ob;
					$("#flagi").val("upd");
					$("#idi").val(id);
					$("#dlg").dialog('open');
					$("#dlg").dialog({modal:true});
					$("#gtno").textbox('setValue',ob.tno);
					$("#gtname").textbox('setValue',ob.tname);
					$("#gtgender").combobox('setValue',ob.tgender);
					$("#gtphone").textbox('setValue',ob.tphone);
					$("#gtaddr").textbox('setValue',ob.taddr);
					$("#gtpassword").textbox('setValue',ob.tpassword);
				}
			});
		}
		//保存
		function gltj(){
			var tno=$("#gtno").textbox('getValue');
			var tname=$("#gtname").textbox('getValue');
			var tgender=$("#gtgender").combobox('getValue');
			var tphone=$("#gtphone").textbox('getValue');
			var taddr=$("#gtaddr").textbox('getValue');
			var tpassword=$("#gtpassword").textbox('getValue');
			var id=$("#idi").val();
			var flag=$("#flagi").val();
			if(tno==""||tname==""||tgender==""||tphone==""||taddr==""||tpassword==""){
				alert('教师信息不完整。');
				return;
			}
			if("add"==flag){
				$.ajax({
					url:'AddSvlt',
					type:'post',
					data:{"tbname":"teacher","tno":tno,"tname":tname,"tgender":tgender,"tphone":tphone,"taddr":taddr,"tpassword":tpassword},
					dataType:'json',
					success:function(data){
						alert(data.msg);
					}
				});
			}else if("upd"==flag){
				$.ajax({
					url:'UpdSvlt',
					type:'post',
					data:{"tbname":"teacher","id":id,"tno":tno,"tname":tname,"tgender":tgender,"tphone":tphone,"taddr":taddr,"tpassword":tpassword},
					dataType:'json',
					success:function(data){
						alert(data.msg);
					}
				});
			}
		}
		//取消
		function rst(){
			window.location.href="InitSvlt?tbname=teacher";
		}
		//查询
		function cktj(){
			var sqls="select  teacher.* from  teacher where 1=1 ";
			var un=$("#ckuname").textbox('getValue');
			if(un!=""){
				sqls+=" and tno='"+un+"'";
			}
			$.ajax({
				url:'CkSvlt',
				type:'post',
				data:{"sql":sqls},
				dataType:'json',
				success:function(data){
					if(data.msg==1){
						window.location.href="InitSvlt?tbname=teacher";
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
				data:{"ids":ids,"tbname":"teacher"},
				success:function(data){
					window.location.href="InitSvlt?tbname=teacher";
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
					<td class="STYLE7" style="padding-left: 50px;">教师信息管理</td>
					<td style="padding-right:10px;"><div align="right" style="padding-right: 50px;">
						<table border="0" align="right" cellpadding="0" cellspacing="0">
							<tr>
								<td class="STYLE3">
									工号：<input id="ckuname" class="ckinput easyui-textbox"/>
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
									<td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">工号</span></strong></div></td>
									<td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">姓名</span></strong></div></td>
									<td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">性别</span></strong></div></td>
									<td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">电话</span></strong></div></td>
									<td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">地址</span></strong></div></td>
									<td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">密码</span></strong></div></td>
									<td width="5%" height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1"></span></strong></div></td>
								</tr>
								<c:forEach var="a" items="${alist }">
									<tr>
										<td align="center" height="22" bgcolor="#FFFFFF">
											<input name="delid" type="checkbox" value="${a.id }"/>
										</td>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${a.tno }</span></div></td>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${a.tname }</span></div></td>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${a.tgender }</span></div></td>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${a.tphone }</span></div></td>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${a.taddr }</span></div></td>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${a.tpassword }</span></div></td>
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
														<td width="40"><a href="javascript:void(0);" onclick="sybtdown('PagingSvlt?flag=1','teacher');return false;"><img src="images/first.gif" width="37" height="15"/></a></td>
														<td width="45"><a href="javascript:void(0);" onclick="syybtdown('PagingSvlt?flag=2','teacher');return false;"><img src="images/back.gif" width="37" height="15"/></a></td>
														<td width="45"><a href="javascript:void(0);" onclick="xyybtdown('PagingSvlt?flag=3','teacher');return false;"><img src="images/next.gif" width="37" height="15"/></a></td>
														<td width="40"><a href="javascript:void(0);" onclick="wybtdown('PagingSvlt?flag=4','teacher');return false;"><img src="images/last.gif" width="37" height="15"/></a></td>
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
							<input id="gtno" class="easyui-textbox" name="gtno" style="width:100%"  data-options="label:'工号:'"/>
						</div>
						<div style="margin-bottom:20px">
							<input id="gtname" class="easyui-textbox" name="gtname" style="width:100%"  data-options="label:'姓名:'"/>
						</div>
						<div style="margin-bottom:20px">
							<select id="gtgender" class="easyui-combobox" name="gtgender" style="width:100%"  data-options="label:'性别:'">
								<option>男</option>
								<option>女</option>
							</select>
						</div>
						<div style="margin-bottom:20px">
							<input id="gtphone" class="easyui-textbox" name="gtphone" style="width:100%"  data-options="label:'电话:'"/>
						</div>
						<div style="margin-bottom:20px">
							<input id="gtaddr" class="easyui-textbox" name="gtaddr" style="width:100%"  data-options="label:'地址:'"/>
						</div>
						<div style="margin-bottom:20px">
							<input id="gtpassword" class="easyui-textbox" name="gtpassword" style="width:100%"  data-options="label:'密码:'"/>
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
