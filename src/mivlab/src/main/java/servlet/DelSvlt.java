package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wm.utils.DbConn;

import net.sf.json.JSONObject;
import utils.Dbhelper;

/**
 * Servlet implementation class DelSvlt
 */
@WebServlet("/DelSvlt")
public class DelSvlt extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelSvlt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
			if("fnav".equals(tbname)){	//一级导航栏
				if(ids.length()>0){
					//删除所要删除是信息语句
					String sql="delete from fnav where id in("+ids+")";
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
			if("snav".equals(tbname)){	//二级导航栏
				if(ids.length()>0){
					//删除所要删除是信息语句
					String sql="delete from snav where id in("+ids+")";
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
			if("terms".equals(tbname)){	//二级导航栏
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
			if("teacher".equals(tbname)){	//教师信息
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
			if("classinfo".equals(tbname)){	//班级信息
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
			if("students".equals(tbname)){	//学生信息
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
			if("courseplan".equals(tbname)){	//课程安排
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
			int i2=0;
			if("tshiyan".equals(tbname)){	//课程实验安排
				if(ids.length()>0){
					//删除所要删除是信息语句
					String sql="delete from stutask where teatask_id in("+ids+")";
					String sql2="delete from teatask where id in("+ids+")";
					//删除操作
					i=db.executeUpdate(sql);
					
					i2=db.executeUpdate(sql2);
				}
				//如果i>0 说明删除掉了想要删除的数据
				if(i>0 && i2>0){
					json.put("msg", "删除失败");
				}else{
					json.put("msg", "删除成功");
				}
			}
			if("reposdate".equals(tbname)){	//GitHub实验成绩
				if(ids.length()>0){
					//删除所要删除是信息语句
					String sql="delete from reposdate where id in("+ids+")";
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
			
			PrintWriter out=response.getWriter();
			out.print(json.toString());
			out.flush();
			out.close();
		}
	}

}