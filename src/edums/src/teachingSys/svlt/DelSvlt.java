package teachingSys.svlt;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import teachingSys.utils.Dbhelper;

import com.wm.utils.DbConn;

import net.sf.json.JSONObject;
public class DelSvlt extends HttpServlet {
	/**
	* Constructor of the object.
	*/
	public DelSvlt() {
		super();
	}
	/**
	* Destruction of the servlet. <br>
	*/
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	/**
	* The doGet method of the servlet. <br>
	*
	* This method is called when a form has its tag value method equals to get.
	* 
	* @param request the request send by the client to the server
	* @param response the response send by the server to the client
	* @throws ServletException if an error occurred
	* @throws IOException if an error occurred
	*/
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		this.doPost(request, response);
	}
	/**
	* The doPost method of the servlet. <br>
	*
	* This method is called when a form has its tag value method equals to post.
	* 
	* @param request the request send by the client to the server
	* @param response the response send by the server to the client
	* @throws ServletException if an error occurred
	* @throws IOException if an error occurred
	*/
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		//设置传输数据编码方式
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		//获取session对象
		HttpSession session=request.getSession();
		//获取当前登录用户信息
		Object userid=session.getAttribute("userid");
		//创建json对象
		JSONObject json=new JSONObject();
		if(userid==null){
			PrintWriter out=response.getWriter();
			out.print("请重新登录");
			out.flush();
			out.close();
			return;
		}else{
			//创建数据库操作对象
			DbConn db=Dbhelper.getDb();
			//获取操作标识
			String tbname=request.getParameter("tbname");
			//获取信息id集合
			String ids=request.getParameter("ids");
			int i=0;
			json.put("msg", 0);
			//处理所要删除的id字符串
			if(ids.endsWith(",")){
				ids=ids.substring(0, ids.length()-1);
			}
			if("admin".equals(tbname)){
				if(ids.length()>0){
					//删除所要删除是信息语句
					String sql="delete from admin where id in("+ids+")";
					//删除操作
					i=db.executeUpdate(sql);
				}
				//如果i>0 说明删除掉了想要删除的数据
				if(i>0){
					json.put("msg", "删除成功");
				}else{
					json.put("msg", "删除失败");
				}
			}
			if("classinfo".equals(tbname)){
				if(ids.length()>0){
					//删除所要删除是信息语句
					String sql="delete from classinfo where id in("+ids+")";
					//删除操作
					i=db.executeUpdate(sql);
				}
				//如果i>0 说明删除掉了想要删除的数据
				if(i>0){
					json.put("msg", "删除成功");
				}else{
					json.put("msg", "删除失败");
				}
			}
			if("course".equals(tbname)){
				if(ids.length()>0){
					//删除所要删除是信息语句
					String sql="delete from course where id in("+ids+")";
					//删除操作
					i=db.executeUpdate(sql);
				}
				//如果i>0 说明删除掉了想要删除的数据
				if(i>0){
					json.put("msg", "删除成功");
				}else{
					json.put("msg", "删除失败");
				}
			}
			if("courseplan".equals(tbname)){
				if(ids.length()>0){
					//删除所要删除是信息语句
					String sql="delete from courseplan where id in("+ids+")";
					//删除操作
					i=db.executeUpdate(sql);
				}
				//如果i>0 说明删除掉了想要删除的数据
				if(i>0){
					json.put("msg", "删除成功");
				}else{
					json.put("msg", "删除失败");
				}
			}
			if("otitle".equals(tbname)){
				if(ids.length()>0){
					//删除所要删除是信息语句
					String sql="delete from otitle where id in("+ids+")";
					//删除操作
					i=db.executeUpdate(sql);
				}
				//如果i>0 说明删除掉了想要删除的数据
				if(i>0){
					json.put("msg", "删除成功");
				}else{
					json.put("msg", "删除失败");
				}
			}
			if("score".equals(tbname)){
				if(ids.length()>0){
					//删除所要删除是信息语句
					String sql="delete from score where id in("+ids+")";
					//删除操作
					i=db.executeUpdate(sql);
				}
				//如果i>0 说明删除掉了想要删除的数据
				if(i>0){
					json.put("msg", "删除成功");
				}else{
					json.put("msg", "删除失败");
				}
			}
			if("students".equals(tbname)){
				if(ids.length()>0){
					//删除所要删除是信息语句
					String sql="delete from students where id in("+ids+")";
					//删除操作
					i=db.executeUpdate(sql);
				}
				//如果i>0 说明删除掉了想要删除的数据
				if(i>0){
					json.put("msg", "删除成功");
				}else{
					json.put("msg", "删除失败");
				}
			}
			if("stuword".equals(tbname)){
				if(ids.length()>0){
					//删除所要删除是信息语句
					String sql="delete from stuword where students_id="+userid+" and zyinfo_id in("+ids+")";
					//删除操作
					i=db.executeUpdate(sql);
				}
				//如果i>0 说明删除掉了想要删除的数据
				if(i>0){
					json.put("msg", "删除成功");
				}else{
					json.put("msg", "删除失败");
				}
			}
			if("stuword".equals(tbname)){
				if(ids.length()>0){
					String zyid=ids.substring(ids.lastIndexOf(",")+1);
					ids=ids.substring(0,ids.lastIndexOf(","));
					//删除所要删除是信息语句
					String sql="delete from stuword where zyinfo_id="+zyid+" and students_id in("+ids+")";
					//删除操作
					i=db.executeUpdate(sql);
				}
				//如果i>0 说明删除掉了想要删除的数据
				if(i>0){
					json.put("msg", "删除成功");
				}else{
					json.put("msg", "删除失败");
				}
			}
			if("syinfo".equals(tbname)){
				if(ids.length()>0){
					//删除所要删除是信息语句
					String sql="delete from syinfo where id in("+ids+")";
					//删除操作
					i=db.executeUpdate(sql);
				}
				//如果i>0 说明删除掉了想要删除的数据
				if(i>0){
					json.put("msg", "删除成功");
				}else{
					json.put("msg", "删除失败");
				}
			}
			if("teacher".equals(tbname)){
				if(ids.length()>0){
					//删除所要删除是信息语句
					String sql="delete from teacher where id in("+ids+")";
					//删除操作
					i=db.executeUpdate(sql);
				}
				//如果i>0 说明删除掉了想要删除的数据
				if(i>0){
					json.put("msg", "删除成功");
				}else{
					json.put("msg", "删除失败");
				}
			}
			if("terms".equals(tbname)){
				if(ids.length()>0){
					//删除所要删除是信息语句
					String sql="delete from terms where id in("+ids+")";
					//删除操作
					i=db.executeUpdate(sql);
				}
				//如果i>0 说明删除掉了想要删除的数据
				if(i>0){
					json.put("msg", "删除成功");
				}else{
					json.put("msg", "删除失败");
				}
			}
			if("ttitle".equals(tbname)){
				if(ids.length()>0){
					//删除所要删除是信息语句
					String sql="delete from ttitle where id in("+ids+")";
					//删除操作
					i=db.executeUpdate(sql);
				}
				//如果i>0 说明删除掉了想要删除的数据
				if(i>0){
					json.put("msg", "删除成功");
				}else{
					json.put("msg", "删除失败");
				}
			}
			if("zyinfo".equals(tbname)){
				if(ids.length()>0){
					//删除所要删除是信息语句
					String sql="delete from zyinfo where id in("+ids+")";
					//删除操作
					i=db.executeUpdate(sql);
				}
				//如果i>0 说明删除掉了想要删除的数据
				if(i>0){
					json.put("msg", "删除成功");
				}else{
					json.put("msg", "删除失败");
				}
			}
		}
		PrintWriter out=response.getWriter();
		out.print(json.toString());
		out.flush();
		out.close();
	}
	/**
	* Initialization of the servlet. <br>
	*
	* @throws ServletException if an error occurs
	*/
	public void init() throws ServletException {
			// Put your code here
		}
	}
