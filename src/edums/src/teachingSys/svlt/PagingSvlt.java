package teachingSys.svlt;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wm.utils.DbConn;

import java.sql.ResultSet;
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
public class PagingSvlt extends HttpServlet {
	/**
	* Constructor of the object.
	*/
	public PagingSvlt() {
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
			String flag=request.getParameter("flag");
			ResultSet rs=null;
			//定义标识符，如果为true说明是首页，否则不是首页
			boolean syflag=false;
			if("1".equals(flag)){//首页
				syflag=true;
			}else if("2".equals(flag)){//上一页
				rs=HandlePage.Syy(db,session,"sql","mysql");
			}else if("3".equals(flag)){
				rs=HandlePage.Xyy(db,session,"sql","mysql");
			}else if("4".equals(flag)){
				rs=HandlePage.Wy(db,session,"sql","mysql");
			}
			if("admin".equals(tbname)){
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<Admin> alist=GetList.getlist(Admin.class, rs);
					request.setAttribute("alist", alist);
					request.getRequestDispatcher("/admin/madmin.jsp").forward(request, response);
				}
				return;
			}
			if("classinfo".equals(tbname)){
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<Classinfo> alist=GetList.getlist(Classinfo.class, rs);
					request.setAttribute("alist", alist);
					request.getRequestDispatcher("/admin/mclassinfo.jsp").forward(request, response);
				}
				return;
			}
			if("course".equals(tbname)){
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<Course> alist=GetList.getlist(Course.class, rs);
					request.setAttribute("alist", alist);
					request.getRequestDispatcher("/admin/mcourse.jsp").forward(request, response);
				}
				return;
			}
			if("courseplan".equals(tbname)){
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<Courseplan> alist=GetList.getlist(Courseplan.class, rs);
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
				}
				return;
			}
			if("teacourse".equals(tbname)){
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<Courseplan> alist=GetList.getlist(Courseplan.class, rs);
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
				}
				return;
			}
			if("stucourse".equals(tbname)){
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<Courseplan> alist=GetList.getlist(Courseplan.class, rs);
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
				}
				return;
			}
			if("otitle".equals(tbname)){
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<Otitle> alist=GetList.getlist(Otitle.class, rs);
					request.setAttribute("alist", alist);
					request.getRequestDispatcher("/admin/motitle.jsp").forward(request, response);
				}
				return;
			}
			if("score".equals(tbname)){
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<Score> alist=GetList.getlist(Score.class, rs);
					request.setAttribute("alist", alist);
					//学期
					List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
					request.setAttribute("termslist", termslist);
					request.getRequestDispatcher("/teacher/mscore.jsp").forward(request, response);
				}
				return;
			}
			if("stuscore".equals(tbname)){
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<Score> alist=GetList.getlist(Score.class, rs);
					request.setAttribute("alist", alist);
					//学期
					List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
					request.setAttribute("termslist", termslist);
					request.getRequestDispatcher("/students/mscore.jsp").forward(request, response);
				}
				return;
			}
			if("students".equals(tbname)){
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<Students> alist=GetList.getlist(Students.class, rs);
					request.setAttribute("alist", alist);
					List<Classinfo> classinfolist=GetList.getlist(Classinfo.class, db.executeQuery("select * from classinfo"));
					request.setAttribute("classinfolist", classinfolist);
					request.getRequestDispatcher("/admin/mstudents.jsp").forward(request, response);
				}
				return;
			}
			if("stuword".equals(tbname)){
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<Stuword> alist=GetList.getlist(Stuword.class, rs);
					request.setAttribute("alist", alist);
					String zyid=request.getParameter("zyid");
					String classid=request.getParameter("classid");
					request.setAttribute("zyid", zyid);
					request.setAttribute("classid", classid);
					request.getRequestDispatcher("/teacher/mstuword.jsp").forward(request, response);
				}
				return;
			}
			if("syinfo".equals(tbname)){
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<Syinfo> alist=GetList.getlist(Syinfo.class, rs);
					request.setAttribute("alist", alist);
					//学期
					List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
					request.setAttribute("termslist", termslist);
					request.getRequestDispatcher("/teacher/msyinfo.jsp").forward(request, response);
				}
				return;
			}
			if("teacher".equals(tbname)){
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<Teacher> alist=GetList.getlist(Teacher.class, rs);
					request.setAttribute("alist", alist);
					request.getRequestDispatcher("/admin/mteacher.jsp").forward(request, response);
				}
				return;
			}
			if("terms".equals(tbname)){
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<Terms> alist=GetList.getlist(Terms.class, rs);
					request.setAttribute("alist", alist);
					request.getRequestDispatcher("/admin/mterms.jsp").forward(request, response);
				}
				return;
			}
			if("ttitle".equals(tbname)){
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<Ttitle> alist=GetList.getlist(Ttitle.class, rs);
					request.setAttribute("alist", alist);
					List<Otitle> otitlelist=GetList.getlist(Otitle.class, db.executeQuery("select * from otitle"));
					request.setAttribute("otitlelist", otitlelist);
					request.getRequestDispatcher("/admin/mttitle.jsp").forward(request, response);
				}
				return;
			}
			if("zyinfo".equals(tbname)){
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<Zyinfo> alist=GetList.getlist(Zyinfo.class, rs);
					request.setAttribute("alist", alist);
					List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
					request.setAttribute("termslist", termslist);
					request.getRequestDispatcher("/teacher/mzyinfo.jsp").forward(request, response);
				}
				return;
			}
			if("stuzyinfo".equals(tbname)){
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<Stuword> alist=GetList.getlist(Stuword.class, rs);
					request.setAttribute("alist", alist);
					List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
					request.setAttribute("termslist", termslist);
					request.getRequestDispatcher("/students/mzyinfo.jsp").forward(request, response);
				}
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
