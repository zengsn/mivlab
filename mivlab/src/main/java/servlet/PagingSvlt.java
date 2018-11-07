package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
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
import bean.GitDate;
import bean.Snav;
import bean.Students;
import bean.Stutask;
import bean.TeaTask;
import bean.Teacher;
import bean.Terms;
import bean.navList;
import utils.Dbhelper;

/**
 * Servlet implementation class PagingSvlt
 */
@WebServlet("/PagingSvlt")
public class PagingSvlt extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PagingSvlt() {
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
		//���ô������ݱ��뷽ʽ
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		//��ȡsession����
		HttpSession session=request.getSession();
		//��ȡ��ǰ��¼�û���Ϣ
		Object userid=session.getAttribute("userid");
		if(userid==null){
			PrintWriter out=response.getWriter();
			out.print("�����µ�¼");
			out.flush();
			out.close();
			return;
		}else{
			//�������ݿ��������
			DbConn db=Dbhelper.getDb();
			//��ȡ������ʶ
			String tbname=request.getParameter("tbname");
			String flag=request.getParameter("flag");
			ResultSet rs=null;
			//�����ʶ�������Ϊtrue˵������ҳ����������ҳ
			boolean syflag=false;
			if("1".equals(flag)){//��ҳ
				syflag=true;
			}else if("2".equals(flag)){//��һҳ
				rs=HandlePage.Syy(db,session,"sql","mysql");
			}else if("3".equals(flag)){
				rs=HandlePage.Xyy(db,session,"sql","mysql");
			}else if("4".equals(flag)){
				rs=HandlePage.Wy(db,session,"sql","mysql");
			}
			
			if("fnav".equals(tbname)){		//һ��������
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<navList> alist=GetList.getlist(navList.class, rs);
					request.setAttribute("alist", alist);
					request.getRequestDispatcher("/admin/f_nav.jsp").forward(request, response);
				}
				return;
			}
			if("snav".equals(tbname)){	//����������
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<Snav> alist=GetList.getlist(Snav.class, rs);
					request.setAttribute("alist", alist);
					List<navList> otitlelist=GetList.getlist(navList.class, db.executeQuery("select * from fnav"));
					request.setAttribute("otitlelist", otitlelist);
					request.getRequestDispatcher("/admin/s_nav.jsp").forward(request, response);
				}
				return;
			}
			if("teacher".equals(tbname)){	//��ʦ��Ϣ
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<Teacher> alist=GetList.getlist(Teacher.class, rs);
					request.setAttribute("alist", alist);
					request.getRequestDispatcher("/admin/teacher.jsp").forward(request, response);
				}
				return;
			}
			if("terms".equals(tbname)){	//ѧ����Ϣ
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<Terms> alist=GetList.getlist(Terms.class, rs);
					request.setAttribute("alist", alist);
					request.getRequestDispatcher("/admin/terms.jsp").forward(request, response);
				}
				return;
			}
			if("classinfo".equals(tbname)){
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<Classinfo> alist=GetList.getlist(Classinfo.class, rs);
					request.setAttribute("alist", alist);
					request.getRequestDispatcher("/admin/classinfo.jsp").forward(request, response);
				}
				return;
			}
			if("students".equals(tbname)){	//ѧ����Ϣ
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<Students> alist=GetList.getlist(Students.class, rs);
					request.setAttribute("alist", alist);
					List<Classinfo> classinfolist=GetList.getlist(Classinfo.class, db.executeQuery("select * from classinfo"));
					request.setAttribute("classinfolist", classinfolist);
					request.getRequestDispatcher("/admin/students.jsp").forward(request, response);
				}
				return;
			}
			if("course".equals(tbname)){	//�γ���Ϣ
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<Course> alist=GetList.getlist(Course.class, rs);
					request.setAttribute("alist", alist);
					request.getRequestDispatcher("/admin/course.jsp").forward(request, response);
				}
				return;
			}
			if("courseplan".equals(tbname)){	//�γ̰���
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<CoursePlan> alist=GetList.getlist(CoursePlan.class, rs);
					request.setAttribute("alist", alist);
					List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
					request.setAttribute("termslist", termslist);
					List<Classinfo> classinfolist=GetList.getlist(Classinfo.class, db.executeQuery("select * from classinfo"));
					request.setAttribute("classinfolist", classinfolist);
					List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
					request.setAttribute("courselist", courselist);
					List<Teacher> teacherlist=GetList.getlist(Teacher.class, db.executeQuery("select * from teacher"));
					request.setAttribute("teacherlist", teacherlist);
					request.getRequestDispatcher("/admin/courseplan.jsp").forward(request, response);
				}
				return;
			}
	/**
	 * ��ʦҳ���������		
	 */
			if("teacourse".equals(tbname)){	//��ʦ���οογ�
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<CoursePlan> alist=GetList.getlist(CoursePlan.class, rs);
					request.setAttribute("alist", alist);
					List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
					request.setAttribute("termslist", termslist);
					List<Classinfo> classinfolist=GetList.getlist(Classinfo.class, db.executeQuery("select * from classinfo"));
					request.setAttribute("classinfolist", classinfolist);
					List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
					request.setAttribute("courselist", courselist);
					List<Teacher> teacherlist=GetList.getlist(Teacher.class, db.executeQuery("select * from teacher"));
					request.setAttribute("teacherlist", teacherlist);
					request.getRequestDispatcher("/teacher/Tcourse.jsp").forward(request, response);
				}
				return;
			}
			if("tshiyan".equals(tbname)){	//��ʦ���οογ�
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<TeaTask> alist=GetList.getlist(TeaTask.class, rs);
					
					//��ѯ�������ǰ̨
					request.setAttribute("alist", alist);
					List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
					request.setAttribute("termslist", termslist);
					List<Classinfo> classinfolist=GetList.getlist(Classinfo.class, db.executeQuery("select * from classinfo"));
					request.setAttribute("classinfolist", classinfolist);
					List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
					request.setAttribute("courselist", courselist);
					
					
					request.getRequestDispatcher("/teacher/Tshiyan.jsp").forward(request, response);
					return;
				}
				return;
			}
			if("tGitDate".equals(tbname)){	//��ʦ��ҳ�鿴GitHubʵ������
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<GitDate> alist=GetList.getlist(GitDate.class, rs);
					request.setAttribute("alist", alist);
					List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
					request.setAttribute("termslist", termslist);				
					List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
					request.setAttribute("courselist", courselist);
					
					request.getRequestDispatcher("/teacher/GitDate.jsp").forward(request, response);
				}
				return;
			}
			
	/**
	 * ѧ��ҳ���������		
	 */
			if("stucourse".equals(tbname)){
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<CoursePlan> alist=GetList.getlist(CoursePlan.class, rs);
					request.setAttribute("alist", alist);
					List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
					request.setAttribute("termslist", termslist);
					List<Classinfo> classinfolist=GetList.getlist(Classinfo.class, db.executeQuery("select * from classinfo"));
					request.setAttribute("classinfolist", classinfolist);
					List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
					request.setAttribute("courselist", courselist);
					List<Teacher> teacherlist=GetList.getlist(Teacher.class, db.executeQuery("select * from teacher"));
					request.setAttribute("teacherlist", teacherlist);
					request.getRequestDispatcher("/student/courseplan.jsp").forward(request, response);
				}
				return;
			}
			
			if("stutaskinfo".equals(tbname)){
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<TeaTask> alist=GetList.getlist(TeaTask.class, rs);
					request.setAttribute("alist", alist);
					//ѧ��
					List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
					request.setAttribute("termslist", termslist);
					List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
					request.setAttribute("courselist", courselist);
					request.getRequestDispatcher("/student/StuTask.jsp").forward(request, response);
				}
				return;
			}
			if("mstutask".equals(tbname)){
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<Stutask> alist=GetList.getlist(Stutask.class, rs);
					request.setAttribute("alist", alist);
					//ѧ��
					List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
					request.setAttribute("termslist", termslist);
					List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
					request.setAttribute("courselist", courselist);
					request.getRequestDispatcher("/student/StuTaskhistory.jsp").forward(request, response);
				}
				return;
			}
			if("Tscore".equals(tbname)){
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<Stutask> alist=GetList.getlist(Stutask.class, rs);
					request.setAttribute("alist", alist);
					//ѧ��
					List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
					request.setAttribute("termslist", termslist);
					List<Classinfo> classinfolist=GetList.getlist(Classinfo.class, db.executeQuery("select * from classinfo"));
					request.setAttribute("classinfolist", classinfolist);
					List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
					request.setAttribute("courselist", courselist);
					request.getRequestDispatcher("/teacher/score.jsp").forward(request, response);
				}
				return;
			}
			if("Sscore".equals(tbname)){
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<GitDate> alist=GetList.getlist(GitDate.class, rs);
					request.setAttribute("alist", alist);
					//ѧ��
					List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
					request.setAttribute("termslist", termslist);
					List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
					request.setAttribute("courselist", courselist);
					request.getRequestDispatcher("/student/score.jsp").forward(request, response);
				}
				return;
			}
			if("TaskTip".equals(tbname)){
				if(syflag){
					request.getRequestDispatcher("/InitSvlt?tbname="+tbname).forward(request, response);
				}else{
					List<TeaTask> alist=GetList.getlist(TeaTask.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
					System.out.print(alist.size());
					//��ѯ�������ǰ̨
					request.setAttribute("alist", alist);
					request.getRequestDispatcher("/student/TaskTip.jsp").forward(request, response);
				}
				return;
			}
		}
	}
}
