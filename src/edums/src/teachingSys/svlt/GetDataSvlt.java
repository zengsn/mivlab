package teachingSys.svlt;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wm.utils.DbConn;

import net.sf.json.JSONObject;

import java.util.List;

import com.wm.utils.GetList;

import teachingSys.been.Admin;
import teachingSys.been.Classinfo;
import teachingSys.been.Course;
import teachingSys.been.Courseplan;
import teachingSys.been.Otitle;
import teachingSys.been.Score;
import teachingSys.been.Students;
import teachingSys.been.Stuword;
import teachingSys.been.Syinfo;
import teachingSys.been.Teacher;
import teachingSys.been.Terms;
import teachingSys.been.Ttitle;
import teachingSys.been.Zyinfo;
import teachingSys.utils.Dbhelper;
public class GetDataSvlt extends HttpServlet {
	public GetDataSvlt() {
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
		//创建json对象
		JSONObject json=new JSONObject();
		//创建数据库操作对象
		DbConn db=Dbhelper.getDb();
		String id=request.getParameter("id");
			//获取操作标识
			String tbname=request.getParameter("tbname");
			if("admin".equals(tbname)){
			//查询数据库获取想要的信息
			List<Admin> alist=GetList.getlist(Admin.class, db.executeQuery("select * from admin where id="+id));
			//创建对象
			Admin a=new Admin();
			//取查询结果给对象
			if(alist.size()>0){
				a=alist.get(0);
			}
			//把信息写入json
			json.put("ob", a);
		}
			if("classinfo".equals(tbname)){
			//查询数据库获取想要的信息
			List<Classinfo> alist=GetList.getlist(Classinfo.class, db.executeQuery("select * from classinfo where id="+id));
			//创建对象
			Classinfo a=new Classinfo();
			//取查询结果给对象
			if(alist.size()>0){
				a=alist.get(0);
			}
			//把信息写入json
			json.put("ob", a);
		}
			if("course".equals(tbname)){
			//查询数据库获取想要的信息
			List<Course> alist=GetList.getlist(Course.class, db.executeQuery("select * from course where id="+id));
			//创建对象
			Course a=new Course();
			//取查询结果给对象
			if(alist.size()>0){
				a=alist.get(0);
			}
			//把信息写入json
			json.put("ob", a);
		}
			if("courseplan".equals(tbname)){
			//查询数据库获取想要的信息
			List<Courseplan> alist=GetList.getlist(Courseplan.class, db.executeQuery("select * from courseplan where id="+id));
			//创建对象
			Courseplan a=new Courseplan();
			//取查询结果给对象
			if(alist.size()>0){
				a=alist.get(0);
			}
			//把信息写入json
			json.put("ob", a);
		}
			if("otitle".equals(tbname)){
			//查询数据库获取想要的信息
			List<Otitle> alist=GetList.getlist(Otitle.class, db.executeQuery("select * from otitle where id="+id));
			//创建对象
			Otitle a=new Otitle();
			//取查询结果给对象
			if(alist.size()>0){
				a=alist.get(0);
			}
			//把信息写入json
			json.put("ob", a);
		}
			if("score".equals(tbname)){
			//查询数据库获取想要的信息
			List<Score> alist=GetList.getlist(Score.class, db.executeQuery("select * from score where id="+id));
			//创建对象
			Score a=new Score();
			//取查询结果给对象
			if(alist.size()>0){
				a=alist.get(0);
			}
			//把信息写入json
			json.put("ob", a);
		}
			if("students".equals(tbname)){
			//查询数据库获取想要的信息
			List<Students> alist=GetList.getlist(Students.class, db.executeQuery("select * from students where id="+id));
			//创建对象
			Students a=new Students();
			//取查询结果给对象
			if(alist.size()>0){
				a=alist.get(0);
			}
			//把信息写入json
			json.put("ob", a);
		}
			if("stuword".equals(tbname)){
			//查询数据库获取想要的信息
			List<Stuword> alist=GetList.getlist(Stuword.class, db.executeQuery("select * from stuword where id="+id));
			//创建对象
			Stuword a=new Stuword();
			//取查询结果给对象
			if(alist.size()>0){
				a=alist.get(0);
			}
			//把信息写入json
			json.put("ob", a);
		}
			if("syinfo".equals(tbname)){
			//查询数据库获取想要的信息
			List<Syinfo> alist=GetList.getlist(Syinfo.class, db.executeQuery("select syinfo.*,terms_id,classinfo_id,course_id,teacher_id from syinfo,courseplan where courseplan.id=courseplan_id and syinfo.id="+id));
			//创建对象
			Syinfo a=new Syinfo();
			//取查询结果给对象
			if(alist.size()>0){
				a=alist.get(0);
			}
			//把信息写入json
			json.put("ob", a);
		}
			if("teacher".equals(tbname)){
			//查询数据库获取想要的信息
			List<Teacher> alist=GetList.getlist(Teacher.class, db.executeQuery("select * from teacher where id="+id));
			//创建对象
			Teacher a=new Teacher();
			//取查询结果给对象
			if(alist.size()>0){
				a=alist.get(0);
			}
			//把信息写入json
			json.put("ob", a);
		}
			if("terms".equals(tbname)){
			//查询数据库获取想要的信息
			List<Terms> alist=GetList.getlist(Terms.class, db.executeQuery("select * from terms where id="+id));
			//创建对象
			Terms a=new Terms();
			//取查询结果给对象
			if(alist.size()>0){
				a=alist.get(0);
			}
			//把信息写入json
			json.put("ob", a);
		}
			if("ttitle".equals(tbname)){
			//查询数据库获取想要的信息
			List<Ttitle> alist=GetList.getlist(Ttitle.class, db.executeQuery("select * from ttitle where id="+id));
			//创建对象
			Ttitle a=new Ttitle();
			//取查询结果给对象
			if(alist.size()>0){
				a=alist.get(0);
			}
			//把信息写入json
			json.put("ob", a);
		}
			if("zyinfo".equals(tbname)){
			//查询数据库获取想要的信息
			List<Zyinfo> alist=GetList.getlist(Zyinfo.class, db.executeQuery("select zyinfo.*,terms_id,classinfo_id,teacher_id,course_id from zyinfo,courseplan,syinfo where syinfo_id=syinfo.id and courseplan.id=courseplan_id and zyinfo.id="+id));
			//创建对象
			Zyinfo a=new Zyinfo();
			//取查询结果给对象
			if(alist.size()>0){
				a=alist.get(0);
			}
			//把信息写入json
			json.put("ob", a);
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
