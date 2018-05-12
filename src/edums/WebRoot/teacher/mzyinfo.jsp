<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>zyinfo</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/demo.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/easyui.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/icon.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/syscss.css">
		<script type="text/javascript" src="<%=basePath%>js/jquery-2.2.3.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="<%=basePath %>js/syssmp.js"></script>
		<script type="text/javascript" src="<%=basePath %>js/ajaxfileupload.js"></script>
		<script type="text/javascript">
			function addbt(){
				$("#flagi").val("add");
				$("#gclassinfo_id").combobox('setValue','0');
				$("#gterms_id").combobox('setValue','0');
				$("#gcourse_id").combobox('setValue','0');
				$("#gsyinfo_id").combobox('setValue','0');
				$("#gzytitle").textbox('setValue','');
				$("#dlg").dialog('open');
				$("#dlg").dialog({modal:true});
			}
			function getcc(){
				var termsid=$("#gterms_id").combobox('getValue');
				var chtml=[{ 'text':'选择课程','id':'0'}];
				var html=[{ 'text':'选择班级','id':'0'}];
				var shtml=[{ 'text':'选择实验','id':'0'}];
				if(termsid=="0"){
					$("#gcourse_id").combobox("loadData", chtml);
					$("#gclassinfo_id").combobox("loadData",html);
					$("#gsyinfo_id").combobox("loadData",shtml);
					$("#gcourse_id").combobox("setValue","0");
					$("#gclassinfo_id").combobox("setValue","0");
					$("#gsyinfo_id").combobox("setValue","0");
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
				var termsid=$("#ckterms").combobox('getValue');
				var html=[{ 'text':'选择班级','id':'0'}];
				var chtml=[{ 'text':'选择课程','id':'0'}];
				var shtml=[{ 'text':'选择实验','id':'0'}];
				if(termsid=="0"){
					$("#ckclass").combobox("loadData", html);
					$("#ckclass").combobox("setValue","0");
					$("#ckcourse").combobox("loadData", chtml);
					$("#ckcourse").combobox("setValue","0");
					$("#cksyinfo").combobox("loadData", shtml);
					$("#cksyinfo").combobox("setValue","0");
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
	    				$("#ckclass").combobox("loadData",html);
	    				$("#ckclass").combobox("setValue","0");
	    				var c=data.clist;
	    				$(c).each(function(i,t){
	    					chtml.push({"text":t.cname,"id":t.id});	
	    				});
	    				$("#ckcourse").combobox("loadData", chtml);
	    				$("#ckcourse").combobox("setValue","0");
					}
				});
			}
			function getgsy(){
				var shtml=[{ 'text':'选择实验','id':'0'}];
				var termsid=$("#gterms_id").combobox('getValue');
				if(termsid=="0"){
					$("#gsyinfo_id").combobox("loadData",shtml);
					$("#gsyinfo_id").combobox("setValue","0");
					return;
				}
				var cid=$("#gcourse_id").combobox('getValue');
				if(cid=="0"){
					$("#gsyinfo_id").combobox("loadData",shtml);
					$("#gsyinfo_id").combobox("setValue","0");
					return;
				}
				var classid=$("#gclassinfo_id").combobox('getValue');
				if(classid=="0"){
					$("#gsyinfo_id").combobox("loadData",shtml);
					$("#gsyinfo_id").combobox("setValue","0");
					return;
				}
				$.ajax({
					url:'GetsySvlt',
					type:'post',
					dataType:'json',
					data:{"classid":classid,"cid":cid,"termsid":termsid},
					success:function(data){
	    				var cl=data.clist;
	    				$(cl).each(function(i,t){
	    					shtml.push({"text":t.sytitle,"id":t.id}); 
	    				});	    
	    				$("#gsyinfo_id").combobox("loadData",shtml);
					}
				});
			}
			function getcsy(){
				var shtml=[{ 'text':'选择实验','id':'0'}];
				var termsid=$("#ckterms").combobox('getValue');
				if(termsid=="0"){
					$("#cksyinfo").combobox("loadData",shtml);
					$("#cksyinfo").combobox("setValue","0");
					return;
				}
				var cid=$("#ckcourse").combobox('getValue');
				if(cid=="0"){
					$("#cksyinfo").combobox("loadData",shtml);
					$("#cksyinfo").combobox("setValue","0");
					return;
				}
				var classid=$("#ckclass").combobox('getValue');
				if(classid=="0"){
					$("#cksyinfo").combobox("loadData",shtml);
					$("#cksyinfo").combobox("setValue","0");
					return;
				}
				$.ajax({
					url:'GetsySvlt',
					type:'post',
					dataType:'json',
					data:{"classid":classid,"cid":cid,"termsid":termsid},
					success:function(data){
	    				var cl=data.clist;
	    				$(cl).each(function(i,t){
	    					shtml.push({"text":t.sytitle,"id":t.id}); 
	    				});	    
	    				$("#cksyinfo").combobox("loadData",shtml);
					}
				});
			}
			function updbt(id){
				$.ajax({
				url:'GetDataSvlt',
				type:'post',
				dataType:'json',
				data:{"tbname":"zyinfo","id":id},
				success:function(data){	
					var ob=data.ob;
					
					var termsid=ob.terms_id;
					var classid=ob.classinfo_id;
					var syid=ob.syinfo_id;
					var cid=ob.course_id;
					var chtml=[{ 'text':'选择课程','id':'0'}];
					var html=[{ 'text':'选择班级','id':'0'}];
					var shtml=[{ 'text':'选择实验','id':'0'}];
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
						url:'GetsySvlt',
						type:'post',
						dataType:'json',
						data:{"classid":classid,"cid":cid,"termsid":termsid},
						success:function(data){
		    				var cl=data.clist;
		    				$(cl).each(function(i,t){
		    					shtml.push({"text":t.sytitle,"id":t.id}); 
		    				});	  
		    				$("#gsyinfo_id").combobox("loadData",shtml);
		    				$("#gsyinfo_id").combobox('setValue',syid);
						}
					});
					$("#gzytitle").textbox('setValue',ob.zytitle);
					$("#flagi").val("upd");
					$("#idi").val(id);
					$("#dlg").dialog('open');
					$("#dlg").dialog({modal:true});
				}
			});
		}
		//保存
		function gltj(){
			var syinfo_id=$("#gsyinfo_id").combobox('getValue');
			var zytitle=$("#gzytitle").textbox('getValue');
			var zyword=$("#gzyword").val();
			var id=$("#idi").val();
			var flag=$("#flagi").val();
			if(syinfo_id=="0"||zytitle==""||zyword==""){
				alert('作业信息不完整。');
				return;
			}
			if("add"==flag){
				$.ajaxFileUpload({  
		            url:"AddzySvlt",  
		            secureuri:false,  
		            type:'post',
		            fileElementId:'gzyword',
		            data:{"syinfo_id":syinfo_id,"zytitle":zytitle},
					dataType:'json',
					success:function(data){
						alert(data.msg);
					}
				});
			}else if("upd"==flag){
				$.ajaxFileUpload({  
		            url:"UpdzySvlt",  
		            secureuri:false,  
		            type:'post',
		            fileElementId:'gzyword',
					data:{"syinfo_id":syinfo_id,"zytitle":zytitle,"id":id},
					dataType:'json',
					success:function(data){
						alert(data.msg);
					}
				});
			}
		}
		//取消
		function rst(){
			window.location.href="InitSvlt?tbname=zyinfo";
		}
		//查询
		function cktj(){
			var sqls="select termname,terms_id,classname,classinfo_id,course_id,cname,tno,tname,teacher_id,sytitle,zyinfo.* from zyinfo,syinfo,courseplan,terms,classinfo,course,teacher where syinfo_id=syinfo.id and teacher_id=teacher.id and course.id=course_id and classinfo_id=classinfo.id and terms_id=terms.id and courseplan.id=courseplan_id and teacher.id="+${userid};
			var termsid=$("#ckterms").combobox('getValue');
			if(termsid!="0"){
				sqls+=" and terms.id="+termsid;
			}else{
				alert("选择学期");
				return;
			}
			var classid=$("#ckclass").combobox('getValue');
			if(classid!="0"){
				sqls+=" and classinfo.id="+classid;
			}else{
				alert("选择班级");
				return;
			}
			var cid=$("#ckcourse").combobox('getValue');
			if(cid!="0"){
				sqls+=" and course.id="+cid;
			}else{
				alert("选择课程");
				return;
			}
			var syid=$("#cksyinfo").textbox('getValue');
			if(syid!="0"){
				sqls+=" and syinfo.id="+syid;
			}else{
				alert("选择实验");
				return;
			}
			
			$.ajax({
				url:'CkSvlt',
				type:'post',
				data:{"sql":sqls},
				dataType:'json',
				success:function(data){
					if(data.msg==1){
						window.location.href="InitSvlt?tbname=zyinfo";
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
				data:{"ids":ids,"tbname":"zyinfo"},
				success:function(data){
					window.location.href="InitSvlt?tbname=zyinfo";
					alert(data.msg);
				}
			});
		}
		function wjxz(fname){
		    var url="<%=basePath%>wjxz.jsp?wjm="+fname;
		    window.open(url);
		}
		$(function(){
			$("#dlg").dialog({closable: false});
			$("#dlg").dialog('close');
			$("#gterms_id").combobox({  
		         //相当于html >> select >> onChange事件  
		         onChange:function(){  
		             getcc();  
		         }}) ;
			$("#gcourse_id").combobox({  
		         //相当于html >> select >> onChange事件  
		         onChange:function(){  
		             getgsy();  
		         }}) ;
			$("#ckterms").combobox({  
		         //相当于html >> select >> onChange事件  
		         onChange:function(){  
		             getclass();  
		         }}) ;
			$("#ckcourse").combobox({  
		         //相当于html >> select >> onChange事件  
		         onChange:function(){  
		             getcsy();  
		         }}) ;
		})
	</script>
</head>
<body>	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="STYLE7" style="padding-left: 50px;">作业信息管理</td>
					<td style="padding-right:10px;"><div align="right" style="padding-right: 50px;">
						<table border="0" align="right" cellpadding="0" cellspacing="0">
							<tr>
								<td class="STYLE3">
									学期：<select id="ckterms" class="ckinput easyui-combobox">
											<option value="0">选择学期</option>
											<c:forEach var="a" items="${termslist }">
												<option value="${a.id }">${a.termname }</option>
											</c:forEach>
										</select>
								</td>
								<td class="STYLE3">
									班级：<select id="ckclass" class="ckinput easyui-combobox" data-options="editable:false,valueField:'id', textField:'text'">
											<option value="0">选择班级</option>
										</select>
								</td>
								<td class="STYLE3">
									课程：<select id="ckcourse" class="ckinput easyui-combobox" data-options="editable:false,valueField:'id', textField:'text'">
											<option value="0">选择课程</option>
										</select>
								</td>
								<td class="STYLE3">
									实验：<select id="cksyinfo" class="ckinput easyui-combobox" data-options="editable:false,valueField:'id', textField:'text'">
											<option value="0">选择实验</option>
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
									<td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">实验</span></strong></div></td>
									<td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">作业标题</span></strong></div></td>
									<td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">作业文件</span></strong></div></td>
									<td width="10%" colspan="2" height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1"></span></strong></div></td>
								</tr>
								<c:forEach var="a" items="${alist }">
									<tr>
										<td align="center" height="22" bgcolor="#FFFFFF">
											<input name="delid" type="checkbox" value="${a.id }"/>
										</td>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${a.termname }</span></div></td>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${a.classname }</span></div></td>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${a.cname }</span></div></td>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${a.sytitle }</span></div></td>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">${a.zytitle }</span></div></td>
										<td height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE3">
											<a href="javascript:void(0);" id="wjm"  onclick="wjxz('${a.zyword}');" style="cursor:pointer;text-decoration:underline;color:blue;">下载</a>
										</span></div></td>
										<td height="22" bgcolor="#FFFFFF"><div align="center" class="STYLE3">
											<table border="0" cellpadding="0" cellspacing="0">
												<tr>
													<td class="STYLE1"><div align="center"><a href="javascript:void(0);" onclick="updbt('${a.id}');return false;"><img src="images/114.gif" width="14" height="14" /></a></div></td>
													<td class="STYLE1"><div align="center"><a href="javascript:void(0);" onclick="updbt('${a.id}');return false;">修改</a></div></td>
												</tr>
											</table>
										</div></td>
										<td height="22" bgcolor="#FFFFFF"><div align="center" class="STYLE3">
											<table border="0" cellpadding="0" cellspacing="0">
												<tr>
													<td class="STYLE1"><div align="center"><a href="InitSvlt?flgs=1&tbname=stuword&zyid=${a.id }&classid=${a.classinfo_id}">收作业</a></div></td>
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
														<td width="40"><a href="javascript:void(0);" onclick="sybtdown('PagingSvlt?flag=1','zyinfo');return false;"><img src="images/first.gif" width="37" height="15"/></a></td>
														<td width="45"><a href="javascript:void(0);" onclick="syybtdown('PagingSvlt?flag=2','zyinfo');return false;"><img src="images/back.gif" width="37" height="15"/></a></td>
														<td width="45"><a href="javascript:void(0);" onclick="xyybtdown('PagingSvlt?flag=3','zyinfo');return false;"><img src="images/next.gif" width="37" height="15"/></a></td>
														<td width="40"><a href="javascript:void(0);" onclick="wybtdown('PagingSvlt?flag=4','zyinfo');return false;"><img src="images/last.gif" width="37" height="15"/></a></td>
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
				<div id="dlg" class="easyui-dialog" title=" "  style="width:100%;max-width:500px;padding:30px 60px;">
					<form id="ff" method="post">
						<div style="margin-bottom:20px">
							<select id="gterms_id" class="easyui-combobox" name="terms_id" style="width:100%"  data-options="label:'学期:'">
								<option value="0">选择学期</option>
								<c:forEach var='a' items='${termslist}'>
									<option value="${a.id }">${a.termname }</option>
								</c:forEach>
							</select>
						</div>
						<div style="margin-bottom:20px">
							<select id="gclassinfo_id" class="easyui-combobox" name="classinfo_id" style="width:100%"  data-options="label:'班级:',editable:false,valueField:'id', textField:'text'">
								<option value="0">选择班级</option>
							</select>
						</div>
						<div style="margin-bottom:20px">
							<select id="gcourse_id" class="easyui-combobox" name="course_id" style="width:100%"  data-options="label:'课程:',editable:false,valueField:'id', textField:'text'">
								<option value="0">选择课程</option>
							</select>
						</div>
						<div style="margin-bottom:20px">
							<select id="gsyinfo_id" class="easyui-combobox" name="syinfo_id" style="width:100%"  data-options="label:'实验:',editable:false,valueField:'id', textField:'text'">
								<option value="0">选择实验</option>
							</select>
						</div>
						<div style="margin-bottom:20px">
							<input id="gzytitle" class="easyui-textbox" name="gzytitle" style="width:100%"  data-options="label:'作业标题:'"/>
						</div>
						<div style="margin-bottom:20px">
							<span class="textbox-label">作业文档:</span><input id="gzyword" name="gzyword" type="file"/>
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
