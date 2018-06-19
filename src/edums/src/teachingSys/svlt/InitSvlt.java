package teachingSys.svlt;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wm.utils.DbConn;

import java.util.List;

import com.wm.utils.GetList;
import com.wm.utils.HandlePage;

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
public class InitSvlt extends HttpServlet {
	/**
	* Constructor of the object.
	*/
	public InitSvlt() {
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
			String flgs=request.getParameter("flgs");
			if("admin".equals(tbname)){
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select  admin.* from  admin where 1=1 ");
				}
				//查询结果集转化成链表
				List<Admin> alist=GetList.getlist(Admin.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//查询结果传到前台
				request.setAttribute("alist", alist);
				request.getRequestDispatcher("/admin/madmin.jsp").forward(request, response);
				return;
			}
			if("classinfo".equals(tbname)){
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select  classinfo.* from  classinfo where 1=1 ");
				}
				//查询结果集转化成链表
				List<Classinfo> alist=GetList.getlist(Classinfo.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//查询结果传到前台
				request.setAttribute("alist", alist);
				request.getRequestDispatcher("/admin/mclassinfo.jsp").forward(request, response);
				return;
			}
			if("course".equals(tbname)){
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select  course.* from  course where 1=1 ");
				}
				//查询结果集转化成链表
				List<Course> alist=GetList.getlist(Course.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//查询结果传到前台
				request.setAttribute("alist", alist);
				request.getRequestDispatcher("/admin/mcourse.jsp").forward(request, response);
				return;
			}
			if("courseplan".equals(tbname)){
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select termname,classno,classname,cno,cname,tno,tname,tgender, courseplan.* from terms,classinfo,course,teacher, courseplan where 1=1  and terms.id=terms_id and classinfo.id=classinfo_id and course.id=course_id and teacher.id=courseplan.teacher_id");
				}
				//查询结果集转化成链表
				List<Courseplan> alist=GetList.getlist(Courseplan.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//查询结果传到前台
				request.setAttribute("alist", alist);
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);
				List<Classinfo> classinfolist=GetList.getlist(Classinfo.class, db.executeQuery("select * from classinfo"));
				request.setAttribute("classinfolist", classinfolist);
				List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
				request.setAttribute("courselist", courselist);
				List<Teacher> teacherlist=GetList.getlist(Teacher.class, db.executeQuery("select * from teacher"));
				request.setAttribute("teacherlist", teacherlist);
				request.getRequestDispatcher("/admin/mcourseplan.jsp").forward(request, response);
				return;
			}
			if("teacourse".equals(tbname)){
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select termname,classno,classname,cno,cname,tno,tname,tgender, courseplan.* from terms,classinfo,course,teacher, courseplan where 1=1  and terms.id=terms_id and classinfo.id=classinfo_id and course.id=course_id and teacher.id=courseplan.teacher_id and teacher.id="+userid);
				}
				//查询结果集转化成链表
				List<Courseplan> alist=GetList.getlist(Courseplan.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//查询结果传到前台
				request.setAttribute("alist", alist);
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);
				List<Classinfo> classinfolist=GetList.getlist(Classinfo.class, db.executeQuery("select * from classinfo"));
				request.setAttribute("classinfolist", classinfolist);
				List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
				request.setAttribute("courselist", courselist);
				List<Teacher> teacherlist=GetList.getlist(Teacher.class, db.executeQuery("select * from teacher"));
				request.setAttribute("teacherlist", teacherlist);
				request.getRequestDispatcher("/teacher/mcourseplan.jsp").forward(request, response);
				return;
			}
			if("stucourse".equals(tbname)){
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select termname,classno,classname,cno,cname,tno,tname,tgender, courseplan.* from terms,classinfo,course,teacher, courseplan where 1=1  and terms.id=terms_id and classinfo.id=classinfo_id and course.id=course_id and teacher.id=courseplan.teacher_id and classinfo.id in(select classinfo_id from students where id="+userid+")");
				}
				//查询结果集转化成链表
				List<Courseplan> alist=GetList.getlist(Courseplan.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//查询结果传到前台
				request.setAttribute("alist", alist);
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);
				List<Classinfo> classinfolist=GetList.getlist(Classinfo.class, db.executeQuery("select * from classinfo"));
				request.setAttribute("classinfolist", classinfolist);
				List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
				request.setAttribute("courselist", courselist);
				List<Teacher> teacherlist=GetList.getlist(Teacher.class, db.executeQuery("select * from teacher"));
				request.setAttribute("teacherlist", teacherlist);
				request.getRequestDispatcher("/students/mcourseplan.jsp").forward(request, response);
				return;
			}
			if("otitle".equals(tbname)){
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select  otitle.* from  otitle where 1=1 ");
				}
				//查询结果集转化成链表
				List<Otitle> alist=GetList.getlist(Otitle.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//查询结果传到前台
				request.setAttribute("alist", alist);
				request.getRequestDispatcher("/admin/motitle.jsp").forward(request, response);
				return;
			}
			if("score".equals(tbname)){
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select score.*,termname,classname,cname,tname,sno,sname from courseplan,score,classinfo,course,teacher,terms,students where classinfo.id=courseplan.classinfo_id and students.id=students_id and terms_id=terms.id and courseplan.id=courseplan_id and courseplan.teacher_id=teacher.id and  course.id=course_id and 1=0 and teacher.id="+userid);
				}
				//查询结果集转化成链表
				List<Score> alist=GetList.getlist(Score.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//查询结果传到前台
				request.setAttribute("alist", alist);
				//学期
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);	
				request.getRequestDispatcher("/teacher/mscore.jsp").forward(request, response);
				return;
			}
			if("stuscore".equals(tbname)){
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select score.*,termname,classname,cname,tname,sno,sname from courseplan,score,classinfo,course,teacher,terms,students where classinfo.id=courseplan.classinfo_id and students.id=students_id and terms_id=terms.id and courseplan.id=courseplan_id and courseplan.teacher_id=teacher.id and  course.id=course_id and 1=0 and students.id="+userid);
				}
				//查询结果集转化成链表
				List<Score> alist=GetList.getlist(Score.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//查询结果传到前台
				request.setAttribute("alist", alist);
				//学期
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);	
				request.getRequestDispatcher("/students/mscore.jsp").forward(request, response);
				return;
			}
			if("students".equals(tbname)){
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select classno,classname, students.* from classinfo, students where 1=1  and classinfo.id=classinfo_id");
				}
				//查询结果集转化成链表
				List<Students> alist=GetList.getlist(Students.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//查询结果传到前台
				request.setAttribute("alist", alist);
				List<Classinfo> classinfolist=GetList.getlist(Classinfo.class, db.executeQuery("select * from classinfo"));
				request.setAttribute("classinfolist", classinfolist);
				request.getRequestDispatcher("/admin/mstudents.jsp").forward(request, response);
				return;
			}
			if("stuword".equals(tbname)){
				//定义查询语句变量
				String zyid=request.getParameter("zyid");
				String classid=request.getParameter("classid");
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					String sql="select tb.id as students_id,sno,sname,stuzyword  from (select * from students where classinfo_id="+classid+")tb left join (select * from stuword where zyinfo_id="+zyid+")tb2 on tb.id=tb2.students_id";
					session.setAttribute("sql", sql);
				}
				//查询结果集转化成链表
				List<Stuword> alist=GetList.getlist(Stuword.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//查询结果传到前台
				request.setAttribute("alist", alist);
				request.setAttribute("zyid", zyid);
				request.setAttribute("classid", classid);
				request.getRequestDispatcher("/teacher/mstuword.jsp").forward(request, response);
				return;
			}
			if("syinfo".equals(tbname)){
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select syinfo.*,termname,classname,cname,tname from courseplan,syinfo,classinfo,course,teacher,terms where classinfo.id=courseplan.classinfo_id and terms_id=terms.id and courseplan.id=courseplan_id and courseplan.teacher_id=teacher.id and  course.id=course_id and 1=0 and teacher.id="+userid);
				}
				//查询结果集转化成链表
				List<Syinfo> alist=GetList.getlist(Syinfo.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//查询结果传到前台
				request.setAttribute("alist", alist);
				//学期
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);
				request.getRequestDispatcher("/teacher/msyinfo.jsp").forward(request, response);
				return;
			}
			if("stusyinfo".equals(tbname)){
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select syinfo.*,termname,classname,cname,tname from courseplan,syinfo,classinfo,course,teacher,terms where classinfo.id=courseplan.classinfo_id and terms_id=terms.id and courseplan.id=courseplan_id and courseplan.teacher_id=teacher.id and  course.id=course_id and 1=0 and classinfo.id in(select classinfo_id from students where id="+userid+")");
				}
				//查询结果集转化成链表
				List<Syinfo> alist=GetList.getlist(Syinfo.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//查询结果传到前台
				request.setAttribute("alist", alist);
				//学期
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);
				request.getRequestDispatcher("/students/msyinfo.jsp").forward(request, response);
				return;
			}
			if("teacher".equals(tbname)){
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select  teacher.* from  teacher where 1=1 ");
				}
				//查询结果集转化成链表
				List<Teacher> alist=GetList.getlist(Teacher.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//查询结果传到前台
				request.setAttribute("alist", alist);
				request.getRequestDispatcher("/admin/mteacher.jsp").forward(request, response);
				return;
			}
			if("terms".equals(tbname)){
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select  terms.* from  terms where 1=1 ");
				}
				//查询结果集转化成链表
				List<Terms> alist=GetList.getlist(Terms.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//查询结果传到前台
				request.setAttribute("alist", alist);
				request.getRequestDispatcher("/admin/mterms.jsp").forward(request, response);
				return;
			}
			if("ttitle".equals(tbname)){
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select otname, ttitle.* from otitle, ttitle where 1=1  and otitle.id=otitle_id");
				}
				//查询结果集转化成链表
				List<Ttitle> alist=GetList.getlist(Ttitle.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//查询结果传到前台
				request.setAttribute("alist", alist);
				List<Otitle> otitlelist=GetList.getlist(Otitle.class, db.executeQuery("select * from otitle"));
				request.setAttribute("otitlelist", otitlelist);
				request.getRequestDispatcher("/admin/mttitle.jsp").forward(request, response);
				return;
			}
			if("zyinfo".equals(tbname)){
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select termname,terms_id,classname,classinfo_id,course_id,cname,tno,tname,teacher_id,sytitle,zyinfo.* from zyinfo,syinfo,courseplan,terms,classinfo,course,teacher where syinfo_id=syinfo.id and teacher_id=teacher.id and course.id=course_id and classinfo_id=classinfo.id and terms_id=terms.id and courseplan.id=courseplan_id and 1=0");
				}
				//查询结果集转化成链表
				List<Zyinfo> alist=GetList.getlist(Zyinfo.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//查询结果传到前台
				request.setAttribute("alist", alist);
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);
				request.getRequestDispatcher("/teacher/mzyinfo.jsp").forward(request, response);
				return;
			}
			if("stuzyinfo".equals(tbname)){
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select tb.*,stuzyword from (select termname,terms_id,classname,courseplan.classinfo_id,course_id,cname,tno,tname,teacher_id,sytitle,zyinfo.*,sno,sname,students.id as students_id from zyinfo,syinfo,courseplan,terms,classinfo,course,teacher,students where classinfo.id=students.classinfo_id and syinfo_id=syinfo.id and teacher_id=teacher.id and course.id=course_id and courseplan.classinfo_id=classinfo.id and terms_id=terms.id and courseplan.id=courseplan_id)tb left join stuword on tb.students_id=stuword.students_id and tb.id=stuword.zyinfo_id where 1=0 and tb.students_id="+userid);
				}
				//查询结果集转化成链表
				List<Stuword> alist=GetList.getlist(Stuword.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//查询结果传到前台
				request.setAttribute("alist", alist);
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);
				request.getRequestDispatcher("/students/mzyinfo.jsp").forward(request, response);
				return;
			}
		}
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
