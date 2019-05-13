package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.wm.utils.DbConn;
import com.wm.utils.GetList;
import com.wm.utils.HandlePage;

import bean.Classinfo;
import bean.Course;
import bean.CoursePlan;
import bean.ExportScoreList;
import bean.GitDate;
import bean.GitRowDate;
import bean.Snav;
import bean.Students;
import bean.Stutask;
import bean.TeaTask;
import bean.Teacher;
import bean.Terms;
import bean.indexContent;
import bean.navList;
import bean.user;
import net.sf.json.JSONArray;
import utils.Dbhelper;





/**
 * Servlet implementation class InitSvlt
 */
@WebServlet("/InitSvlt")
public class InitSvlt extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InitSvlt() {
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
		Object userinfo=session.getAttribute("userinfo");
		if(userid==null ){
			request.getRequestDispatcher("index.jsp").forward(request, response);
			return;
		}else{
			//创建数据库操作对象
			DbConn db=Dbhelper.getDb();
			//获取操作标识
			String tbname=request.getParameter("tbname");
			String flgs=request.getParameter("flgs");
			if("homepage".equals(tbname)) {
				

				//查询所有一级标题
				List<navList> fnavSize=GetList.getlist(navList.class, db.executeQuery("select * from fnav "));
				//查询所有二级标题
				List<Snav> snavSize=GetList.getlist(Snav.class, db.executeQuery("select * from snav "));
				//查询所有教师人数
				List<Teacher> teaSize=GetList.getlist(Teacher.class, db.executeQuery("select * from teacher "));
				//查询所有班级数目
				List<Classinfo> classSize=GetList.getlist(Classinfo.class, db.executeQuery("select * from classinfo "));
				//查询所有学生人数
				List<Students> stuSize=GetList.getlist(Students.class, db.executeQuery("select * from students "));
				int zhujiao=0;
				int jiangshi=0;
				int fujiaoshou=0;
				int jiaoshou=0;
				for(int i=0;i<teaSize.size();i++) {
					if(teaSize.get(i).getProftitle().equals("助教")) {
						zhujiao++;
					}else if("讲师".equals(teaSize.get(i).getProftitle())) {
						jiangshi++;
					}else if("副教授".equals(teaSize.get(i).getProftitle())) {
							fujiaoshou++;
						}else if("教授".equals(teaSize.get(i).getProftitle())) {
							jiaoshou++;
						}
				}
				request.setAttribute("fnavSize", fnavSize.size());
				request.setAttribute("snavSize", snavSize.size());
				request.setAttribute("teaSize", teaSize.size());
				request.setAttribute("classSize", classSize.size());
				request.setAttribute("stuSize", stuSize.size());
				request.setAttribute("zhujiao", zhujiao);
				request.setAttribute("jiangshi", jiangshi);
				request.setAttribute("fujiaoshou", fujiaoshou);
				request.setAttribute("jiaoshou", jiaoshou);
				
				//获取标题及脚注等信息
				List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
				//创建对象
				indexContent a=new indexContent();
				//取查询结果给对象
				if(other.size()>0){
					a=other.get(0);
				}
				//把信息写入session
				
				session.setAttribute("other", a);
				request.getRequestDispatcher("/admin/main.jsp").forward(request, response);
				return;
				
			}
			if("title".equals(tbname)){	//			
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					//获取标题及脚注等信息
					List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
					//创建对象
					indexContent a=new indexContent();
					//取查询结果给对象
					if(other.size()>0){
						a=other.get(0);
					}
					//把信息写入session
					session.setAttribute("other", a);
					//System.out.print(a.getFooter_name());
					request.getRequestDispatcher("/admin/title.jsp").forward(request, response);
					return ;
				}				
				return;
			}
			if("fnav".equals(tbname)){	//一级导航菜单
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select  * from  fnav where 1=1 ");
				}
				//查询结果集转化成链表
				List<navList> alist=GetList.getlist(navList.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//查询结果传到前台
				request.setAttribute("alist", alist);
				//获取标题及脚注等信息
				List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
				//创建对象
				indexContent a=new indexContent();
				//取查询结果给对象
				if(other.size()>0){
					a=other.get(0);
				}
				//把信息写入session
				
				session.setAttribute("other", a);
				request.getRequestDispatcher("/admin/f_nav.jsp").forward(request, response);
				return;
			}
			
			if("snav".equals(tbname)){	//二级导航栏
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select fnav.name, snav.* from snav, fnav where 1=1  and fnav.id=fnav_id");
				}				
				//查询结果集转化成链表
				List<Snav> alist=GetList.getlist(Snav.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//查询结果传到前台
				request.setAttribute("alist", alist);				
				List<navList> otitlelist=GetList.getlist(navList.class, db.executeQuery("select * from fnav"));
				request.setAttribute("otitlelist", otitlelist);
				
				//获取标题及脚注等信息
				List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
				//创建对象
				indexContent a=new indexContent();
				//取查询结果给对象
				if(other.size()>0){
					a=other.get(0);
				}
				//把信息写入session
				
				session.setAttribute("other", a);
				request.getRequestDispatcher("/admin/s_nav.jsp").forward(request, response);
				return;
			}
			if("indexshow".equals(tbname)) {
				//获取标题及脚注等信息
				List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
				//创建对象
				indexContent a=new indexContent();
				//取查询结果给对象
				if(other.size()>0){
					a=other.get(0);
				}
				//System.out.print("WordColor="+a.getWordColor());
				//把信息写入session
				session.setAttribute("other", a);
				request.getRequestDispatcher("/admin/title.jsp").forward(request, response);
				return;
			}
			if("teacher".equals(tbname)){	//教师信息
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
				//获取标题及脚注等信息
				List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
				//创建对象
				indexContent a=new indexContent();
				//取查询结果给对象
				if(other.size()>0){
					a=other.get(0);
				}
				//把信息写入session
				
				session.setAttribute("other", a);
				
				request.getRequestDispatcher("/admin/teacher.jsp").forward(request, response);
				return;
			}
			if("terms".equals(tbname)){	//学期信息
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
				//获取标题及脚注等信息
				List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
				//创建对象
				indexContent a=new indexContent();
				//取查询结果给对象
				if(other.size()>0){
					a=other.get(0);
				}
				//把信息写入session
				
				session.setAttribute("other", a);
				request.getRequestDispatcher("/admin/terms.jsp").forward(request, response);
				return;
			}
			if("classinfo".equals(tbname)){	//班级信息
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
				//获取标题及脚注等信息
				List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
				//创建对象
				indexContent a=new indexContent();
				//取查询结果给对象
				if(other.size()>0){
					a=other.get(0);
				}
				//把信息写入session
				
				session.setAttribute("other", a);
				request.getRequestDispatcher("/admin/classinfo.jsp").forward(request, response);
				return;
			}
			if("students".equals(tbname)){	//学生信息
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select classno,classname, students.* from classinfo, students where 1=1  and classinfo.id=classinfo_id  order by sno asc");
				}
				//查询结果集转化成链表
				List<Students> alist=GetList.getlist(Students.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//查询结果传到前台
				request.setAttribute("alist", alist);
				List<Classinfo> classinfolist=GetList.getlist(Classinfo.class, db.executeQuery("select * from classinfo"));
				request.setAttribute("classinfolist", classinfolist);
				//获取标题及脚注等信息
				List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
				//创建对象
				indexContent a=new indexContent();
				//取查询结果给对象
				if(other.size()>0){
					a=other.get(0);
				}
				//把信息写入session
				
				session.setAttribute("other", a);
				request.getRequestDispatcher("/admin/students.jsp").forward(request, response);
				return;
			}
			if("course".equals(tbname)){	//课程信息
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
				//获取标题及脚注等信息
				List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
				//创建对象
				indexContent a=new indexContent();
				//取查询结果给对象
				if(other.size()>0){
					a=other.get(0);
				}
				//把信息写入session
				
				session.setAttribute("other", a);
				request.getRequestDispatcher("/admin/course.jsp").forward(request, response);
				return;
			}
			if("courseplan".equals(tbname)){	//课程安排
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select termname,classno,classname,cno,cname,tNo,tName,sex, courseplan.* from terms,classinfo,course,teacher, courseplan where 1=1  and terms.id=terms_id and classinfo.id=classinfo_id and course.id=course_id and teacher.id=courseplan.teacher_id");
				}
				//查询结果集转化成链表
				List<CoursePlan> alist=GetList.getlist(CoursePlan.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//查询结果传到前台
				request.setAttribute("alist", alist);
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);
				List<Classinfo> classinfolist=GetList.getlist(Classinfo.class, db.executeQuery("select * from classinfo"));
				request.setAttribute("classinfolist", classinfolist);
				List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
				request.setAttribute("courselist", courselist);
				List<Teacher> teacherlist=GetList.getlist(Teacher.class, db.executeQuery("select * from teacher order by tName"));
				request.setAttribute("teacherlist", teacherlist);
				//获取标题及脚注等信息
				List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
				//创建对象
				indexContent a=new indexContent();
				//取查询结果给对象
				if(other.size()>0){
					a=other.get(0);
				}
				//把信息写入session
				
				session.setAttribute("other", a);
				request.getRequestDispatcher("/admin/courseplan.jsp").forward(request, response);
				return;
			}
			if("adminInfo".equals(tbname)){	//一级导航菜单				
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					//获取标题及脚注等信息
					List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
					//创建对象
					indexContent a=new indexContent();
					//取查询结果给对象
					if(other.size()>0){
						a=other.get(0);
					}
					//把信息写入session
					
					session.setAttribute("other", a);
					request.getRequestDispatcher("/admin/adminInfo.jsp").forward(request, response);
					return ;
				}				
				return;
			}
			if("allGitmana".equals(tbname)){		//管理员git实验管理--录入数据
				
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);
				
				List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
				request.setAttribute("courselist", courselist);
				user ad=new user();
				ad=(user)userinfo;
				request.setAttribute("userinfo", ad);
				//获取标题及脚注等信息
				List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
				//创建对象
				indexContent a=new indexContent();
				//取查询结果给对象
				if(other.size()>0){
					a=other.get(0);
				}
				//把信息写入session
				
				session.setAttribute("other", a);
				request.getRequestDispatcher("/admin/GitMana.jsp").forward(request, response);
				return;
			}
			if("allGitDate".equals(tbname)){		//管理员git实验管理--查看数据
				String tablename="reposdate";   
				String export=request.getParameter("export");
				System.out.print("export="+export+"\n");
				System.out.print("sql="+session.getAttribute("sql")+"\n");
				System.out.print("exportSql="+session.getAttribute("exportSql"));
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select "+tablename+".*,students.sname, terms.termname,course.cname,classinfo.classname from "+tablename+",students,course,terms,classinfo  where classinfo.id=students.classinfo_id and students.sno=Num and course_id=course.id and "+tablename+".terms_id=terms.id "+"  order by Num desc");
				}
				
				//List<ExportScoreList> scoreList=GetList.getlist(ExportScoreList.class, HandlePage.Sy(db, "1000", session,"exportSql","mysql"));
				List<ExportScoreList> scoreList=GetList.getlist(ExportScoreList.class, HandlePage.Sy(db, "1000", session,"sql","mysql"));
				
				JSONArray alistJson = JSONArray.fromObject(scoreList);
				request.setAttribute("alistJson", alistJson);
				System.out.println(alistJson);
				System.out.print("scoreListsize="+alistJson.size());
				//查询结果集转化成链表
				List<GitDate> alist=GetList.getlist(GitDate.class, HandlePage.Sy(db, "1000", session,"sql","mysql"));
				request.setAttribute("alist", alist);
				System.out.print("size="+alist.size());
			
				
				
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);
				List<Classinfo> classinfolist=GetList.getlist(Classinfo.class, db.executeQuery("select * from classinfo"));
				request.setAttribute("classinfolist", classinfolist);
				List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
				request.setAttribute("courselist", courselist);
				
				//获取标题及脚注等信息
				List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
				//创建对象
				indexContent a=new indexContent();
				//取查询结果给对象
				if(other.size()>0){
					a=other.get(0);
				}
				//把信息写入session
				
				session.setAttribute("other", a);
				request.getRequestDispatcher("/admin/GitDate.jsp").forward(request, response);
	
				return;
			}
			
			if("allshiyan".equals(tbname)){		//管理员实验管理
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select termname,classno,classname,cno,cname,tNo,tName, teatask.* from terms,classinfo,course,teacher, teatask where 1=1  and terms.id=teatask.terms_id and classinfo.id=teatask.classinfo_id and course.id=teatask.course_id and teacher.id=teatask.teacher_id  group by id order by id desc");
				}
				//查询结果集转化成链表
				List<TeaTask> alist=GetList.getlist(TeaTask.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//查询结果传到前台
				request.setAttribute("alist", alist);
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);
				List<Classinfo> classinfolist=GetList.getlist(Classinfo.class, db.executeQuery("select * from classinfo"));
				request.setAttribute("classinfolist", classinfolist);
				List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
				request.setAttribute("courselist", courselist);
				List<Teacher> tealist=GetList.getlist(Teacher.class, db.executeQuery("select * from teacher"));
				request.setAttribute("tealist", tealist);
				
				
				//获取标题及脚注等信息
				List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
				//创建对象
				indexContent a=new indexContent();
				//取查询结果给对象
				if(other.size()>0){
					a=other.get(0);
				}
				//把信息写入session
				
				session.setAttribute("other", a);
				request.getRequestDispatcher("/admin/allshiyan.jsp").forward(request, response);
				return;
			}
			
			if("adminstutask".equals(tbname)){	//学生查询教师发布的实验信息,已提交的信息
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select sno,termname,classno,classname,cno,cname,stutask.*,teatask.title,teatask.remark,teatask.time,teatask.deadline from students,stutask,terms,classinfo,course,teacher, teatask where 1=1  and terms.id=teatask.terms_id and classinfo.id=teatask.classinfo_id and\r\n" + 
							" course.id=teatask.course_id and teacher.id=teatask.teacher_id and teatask_id=teatask.id and students.id=stutask.stu_id group by stutask.id order by stutask.id desc");
				}
				//查询结果集转化成链表
				List<Stutask> alist=GetList.getlist(Stutask.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				System.out.print(alist.size());
				//查询结果传到前台
				request.setAttribute("alist", alist);
				//学期
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);
				List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
				request.setAttribute("courselist", courselist);
				
				//获取标题及脚注等信息
				List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
				//创建对象
				indexContent a=new indexContent();
				//取查询结果给对象
				if(other.size()>0){
					a=other.get(0);
				}
				//把信息写入session
				
				session.setAttribute("other", a);
				request.getRequestDispatcher("/admin/StuTaskhistory.jsp").forward(request, response);
				return;
			}
			
			if("gitRawdate".equals(tbname)){	//查询Git原始数据
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select * from gitrawdata ");
				}
				//查询结果集转化成链表
				List<GitRowDate> alist=GetList.getlist(GitRowDate.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				System.out.print(alist.size());
				//查询结果传到前台
				request.setAttribute("alist", alist);
				//获取标题及脚注等信息
				List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
				//创建对象
				indexContent a=new indexContent();
				//取查询结果给对象
				if(other.size()>0){
					a=other.get(0);
				}
				//把信息写入session
				
				session.setAttribute("other", a);
				request.getRequestDispatcher("/admin/GitRowDate.jsp").forward(request, response);
				return;
			}
		/**
		 * 教师页面操作处理		
		 */
			if("teacourse".equals(tbname)){		//教师任课课程
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select termname,classno,classname,cno,cname,tNo,tName,sex, courseplan.* from terms,classinfo,course,teacher, courseplan where 1=1  and terms.id=terms_id and classinfo.id=classinfo_id and course.id=course_id and teacher.id=courseplan.teacher_id and teacher.id="+userid+" order by terms.id desc");
				}
				//查询结果集转化成链表
				List<CoursePlan> alist=GetList.getlist(CoursePlan.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
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
				//获取标题及脚注等信息
				List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
				//创建对象
				indexContent a=new indexContent();
				//取查询结果给对象
				if(other.size()>0){
					a=other.get(0);
				}
				//把信息写入session
				
				session.setAttribute("other", a);
				request.getRequestDispatcher("/teacher/Tcourse.jsp").forward(request, response);
				return;
			}
			
			if("tshiyan".equals(tbname)){		//教师实验管理
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select termname,classno,classname,cno,cname,tNo,tName, teatask.* from terms,classinfo,course,teacher, teatask where 1=1  and terms.id=teatask.terms_id and classinfo.id=teatask.classinfo_id and course.id=teatask.course_id and teacher.id=teatask.teacher_id and teacher.id="+userid+" group by id order by id desc");
				}
				//查询结果集转化成链表
				List<TeaTask> alist=GetList.getlist(TeaTask.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//查询结果传到前台
				request.setAttribute("alist", alist);
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);
				List<Classinfo> classinfolist=GetList.getlist(Classinfo.class, db.executeQuery("select * from classinfo"));
				request.setAttribute("classinfolist", classinfolist);
				List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
				request.setAttribute("courselist", courselist);
				
				//获取标题及脚注等信息
				List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
				//创建对象
				indexContent a=new indexContent();
				//取查询结果给对象
				if(other.size()>0){
					a=other.get(0);
				}
				//把信息写入session
				
				session.setAttribute("other", a);
				request.getRequestDispatcher("/teacher/Tshiyan.jsp").forward(request, response);
				return;
			}
			if("Tscore".equals(tbname)){		//教师成绩管理
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select termname,classno,classname,cno,cname,sno,stutask.*,teatask.title,teatask.remark,teatask.time,teatask.deadline from stutask,terms,classinfo,course,teacher,students, teatask where 1=1  and terms.id=teatask.terms_id and classinfo.id=teatask.classinfo_id and" + 
												" course.id=teatask.course_id and stu_id=students.id and teacher.id=teatask.teacher_id and teatask_id=teatask.id and teatask.teacher_id="+userid+" group by stutask.id order by stutask.id desc");
				}
				//查询结果集转化成链表
				List<Stutask> alist=GetList.getlist(Stutask.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//查询结果传到前台
				request.setAttribute("alist", alist);
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);
				List<Classinfo> classinfolist=GetList.getlist(Classinfo.class, db.executeQuery("select * from classinfo"));
				request.setAttribute("classinfolist", classinfolist);
				List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
				request.setAttribute("courselist", courselist);
				//获取标题及脚注等信息
				List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
				//创建对象
				indexContent a=new indexContent();
				//取查询结果给对象
				if(other.size()>0){
					a=other.get(0);
				}
				//把信息写入session
				
				session.setAttribute("other", a);
				request.getRequestDispatcher("/teacher/score.jsp").forward(request, response);
				return;
			}
			
			
			if("tGitmana".equals(tbname)){		//教师git实验管理--录入数据
				
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);
				
				List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
				request.setAttribute("courselist", courselist);
				//获取标题及脚注等信息
				List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
				//创建对象
				indexContent a=new indexContent();
				//取查询结果给对象
				if(other.size()>0){
					a=other.get(0);
				}
				//把信息写入session
				
				session.setAttribute("other", a);
				request.getRequestDispatcher("/teacher/GitMana.jsp").forward(request, response);
				return;
			}
			if("tGitDate".equals(tbname)){		//教师git实验管理--查看数据
				String tablename="reposdate";   
				String export=request.getParameter("export");
				System.out.print("export="+export+"\n");
				System.out.print("sql="+session.getAttribute("sql")+"\n");
				System.out.print("exportSql="+session.getAttribute("exportSql"));
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select "+tablename+".*,students.sname, terms.termname,course.cname,classinfo.classname from "+tablename+",students,course,terms,classinfo  where classinfo.id=students.classinfo_id and students.sno=Num and course_id=course.id and "+tablename+".terms_id=terms.id and "+tablename+".tid="+userid+"  order by Num desc");
				}
				
				//List<ExportScoreList> scoreList=GetList.getlist(ExportScoreList.class, HandlePage.Sy(db, "1000", session,"exportSql","mysql"));
				List<ExportScoreList> scoreList=GetList.getlist(ExportScoreList.class, HandlePage.Sy(db, "1000", session,"sql","mysql"));
				
				JSONArray alistJson = JSONArray.fromObject(scoreList);
				request.setAttribute("alistJson", alistJson);
				System.out.println(alistJson);
				System.out.print("scoreListsize="+alistJson.size());
				//查询结果集转化成链表
				List<GitDate> alist=GetList.getlist(GitDate.class, HandlePage.Sy(db, "1000", session,"sql","mysql"));
				request.setAttribute("alist", alist);
				System.out.print("size="+alist.size());
			
				
				
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);
				List<Classinfo> classinfolist=GetList.getlist(Classinfo.class, db.executeQuery("select * from classinfo"));
				request.setAttribute("classinfolist", classinfolist);
				List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
				request.setAttribute("courselist", courselist);
				
				//获取标题及脚注等信息
				List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
				//创建对象
				indexContent a=new indexContent();
				//取查询结果给对象
				if(other.size()>0){
					a=other.get(0);
				}
				//把信息写入session
				
				session.setAttribute("other", a);
				request.getRequestDispatcher("/teacher/GitDate.jsp").forward(request, response);
				System.out.println("\n");
				System.out.println("this step");
				return;
			}
			if("teacherInfo".equals(tbname)){	//一级导航菜单				
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					//获取标题及脚注等信息
					List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
					//创建对象
					indexContent a=new indexContent();
					//取查询结果给对象
					if(other.size()>0){
						a=other.get(0);
					}
					//把信息写入session
					
					session.setAttribute("other", a);
					request.getRequestDispatcher("/teacher/teacherInfo.jsp").forward(request, response);
					return ;
				}				
				return;
			}
			
			if("TeagitRawdate".equals(tbname)){	//教师查询Git原始数据
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select * from gitrawdata where tid='"+userid+"'");
				}
				//查询结果集转化成链表
				List<GitRowDate> alist=GetList.getlist(GitRowDate.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				System.out.print(alist.size());
				//查询结果传到前台
				request.setAttribute("alist", alist);
				//获取标题及脚注等信息
				List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
				//创建对象
				indexContent a=new indexContent();
				//取查询结果给对象
				if(other.size()>0){
					a=other.get(0);
				}
				//把信息写入session
				
				session.setAttribute("other", a);
				request.getRequestDispatcher("/teacher/GitRowDate.jsp").forward(request, response);
				return;
			}
			
		/**
		 * 学生页面操作处理		
		 */
			if("stucourse".equals(tbname)){
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select termname,classno,classname,cno,cname,tNo,tName,sex,tPhone, courseplan.* from terms,classinfo,course,teacher, courseplan where 1=1  and terms.id=terms_id and classinfo.id=classinfo_id and course.id=course_id and teacher.id=courseplan.teacher_id and classinfo.id in(select classinfo_id from students where id="+userid+") order by terms.id desc");
				}
				//查询结果集转化成链表
				List<CoursePlan> alist=GetList.getlist(CoursePlan.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//查询结果传到前台
				request.setAttribute("alist", alist);
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);
				//获取标题及脚注等信息
				List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
				//创建对象
				indexContent a=new indexContent();
				//取查询结果给对象
				if(other.size()>0){
					a=other.get(0);
				}
				//把信息写入session
				
				session.setAttribute("other", a);
				request.getRequestDispatcher("/student/courseplan.jsp").forward(request, response);
				return;
			}
			
			//刚刚登录，提示作业任务
			if("stutaskinfoLogin".equals(tbname)){	//学生查询教师发布的实验信息
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select teatask.*,termname,classname,cname,tName from courseplan,teatask,classinfo,course,teacher,terms where classinfo.id=teatask.classinfo_id and teatask.terms_id=terms.id and teatask.teacher_id=teacher.id and  course.id=teatask.course_id and classinfo.id in (select classinfo_id from students where id="+userid+") group by id order by id desc");
				}
				//查询结果集转化成链表
				List<TeaTask> alist=GetList.getlist(TeaTask.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				System.out.print(alist.size());
				//查询结果传到前台
				request.setAttribute("alist", alist);
				//学期
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);
				List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
				request.setAttribute("courselist", courselist);
				session.setAttribute("TaskTipFlag", "1");
				//获取标题及脚注等信息
				List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
				//创建对象
				indexContent a=new indexContent();
				//取查询结果给对象
				if(other.size()>0){
					a=other.get(0);
				}
				//把信息写入session
				
				session.setAttribute("other", a);
				request.getRequestDispatcher("/student/StuTask.jsp").forward(request, response);
				return;
			}
			if("stutaskinfo".equals(tbname)){	//学生查询教师发布的实验信息
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select teatask.*,termname,classname,cname,tName from courseplan,teatask,classinfo,course,teacher,terms where classinfo.id=teatask.classinfo_id and teatask.terms_id=terms.id and teatask.teacher_id=teacher.id and  course.id=teatask.course_id and classinfo.id in (select classinfo_id from students where id="+userid+") group by id order by id desc");
				}
				//查询结果集转化成链表
				List<TeaTask> alist=GetList.getlist(TeaTask.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				System.out.print(alist.size());
				//查询结果传到前台
				request.setAttribute("alist", alist);
				//学期
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);
				List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
				request.setAttribute("courselist", courselist);
				session.setAttribute("TaskTipFlag", "0");
				//获取标题及脚注等信息
				List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
				//创建对象
				indexContent a=new indexContent();
				//取查询结果给对象
				if(other.size()>0){
					a=other.get(0);
				}
				//把信息写入session
				
				session.setAttribute("other", a);
				request.getRequestDispatcher("/student/StuTask.jsp").forward(request, response);
				return;
			}
			if("mstutask".equals(tbname)){	//学生查询教师发布的实验信息,已提交的信息
				//定义查询语句变量
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select termname,classno,classname,cno,cname,stutask.*,teatask.title,teatask.remark,teatask.time,teatask.deadline from stutask,terms,classinfo,course,teacher, teatask where 1=1  and terms.id=teatask.terms_id and classinfo.id=teatask.classinfo_id and\r\n" + 
							" course.id=teatask.course_id and teacher.id=teatask.teacher_id and teatask_id=teatask.id and stu_id="+userid+" group by stutask.id order by stutask.id desc");
				}
				//查询结果集转化成链表
				List<Stutask> alist=GetList.getlist(Stutask.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				System.out.print(alist.size());
				//查询结果传到前台
				request.setAttribute("alist", alist);
				//学期
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);
				List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
				request.setAttribute("courselist", courselist);
				//获取标题及脚注等信息
				List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
				//创建对象
				indexContent a=new indexContent();
				//取查询结果给对象
				if(other.size()>0){
					a=other.get(0);
				}
				//把信息写入session
				
				session.setAttribute("other", a);
				request.getRequestDispatcher("/student/StuTaskhistory.jsp").forward(request, response);
				return;
			}
			
			if("Sscore".equals(tbname)){		//学生查看成绩
				Students stuinfo=(Students)session.getAttribute("userinfo");
				String sno=stuinfo.getSno();
				//定义查询语句变量
				String tablename="reposdate";
				String sql="";
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					session.setAttribute("sql", "select "+tablename+".*,students.sname, terms.termname,course.cname from "+tablename+",students,course,terms where  students.sno=Num and course_id=course.id and "+tablename+".terms_id=terms.id and Num='"+sno+"'  order by Num DESC");
				}
				//查询结果集转化成链表
				List<GitDate> alist=GetList.getlist(GitDate.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//查询结果传到前台
				request.setAttribute("alist", alist);
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);
				List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
				request.setAttribute("courselist", courselist);
				//获取标题及脚注等信息
				List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
				//创建对象
				indexContent a=new indexContent();
				//取查询结果给对象
				if(other.size()>0){
					a=other.get(0);
				}
				//把信息写入session
				
				session.setAttribute("other", a);
				request.getRequestDispatcher("/student/score.jsp").forward(request, response);
				return;
			}
			if("TaskTip".equals(tbname)){	//学生可完成的实验信息--进度提醒
				//定义查询语句变量
				System.out.println("userid="+userid);
				//任务进度提醒
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		        System.out.println(df.format(new Date()));// new Date()为获取当前系统时间

				String nowtime=df.format(new Date());
				
				List<TeaTask> alist=GetList.getlist(TeaTask.class, db.executeQuery("select teatask.*,termname,classname,cname,tName from courseplan,teatask,classinfo,course,teacher,terms where classinfo.id=teatask.classinfo_id and teatask.terms_id=terms.id and teatask.teacher_id=teacher.id and  course.id=teatask.course_id and deadline > '"+nowtime+"' and classinfo.id in (select classinfo_id from students where id="+userid+") group by id order by id desc"));
				System.out.println("截止日期提示="+alist.size());
				System.out.print(alist.size());
				System.out.print("可完成的任务数alist"+alist.size());
				//查询结果传到前台
				request.setAttribute("alist", alist);
				request.setAttribute("num", alist.size());
				//学期
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);
				List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
				session.setAttribute("TaskTipFlag", "0");
				//获取标题及脚注等信息
				List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
				//创建对象
				indexContent a=new indexContent();
				//取查询结果给对象
				if(other.size()>0){
					a=other.get(0);
				}
				//把信息写入session
				
				session.setAttribute("other", a);
				request.getRequestDispatcher("/student/TaskTip.jsp").forward(request, response);
				return;
			}
			if("studentInfo".equals(tbname)){	//一级导航菜单				
				//如果请求来自左侧菜单，查询全部内容
				if("1".equals(flgs)){
					//获取标题及脚注等信息
					List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
					//创建对象
					indexContent a=new indexContent();
					//取查询结果给对象
					if(other.size()>0){
						a=other.get(0);
					}
					//把信息写入session
					
					session.setAttribute("other", a);
					request.getRequestDispatcher("/student/studentInfo.jsp").forward(request, response);
					return ;
				}				
				return;
			}
	}
  }
	

}