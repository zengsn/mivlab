package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
import bean.GitDate;

import bean.Snav;
import bean.Students;
import bean.Stutask;
import bean.TeaTask;
import bean.Teacher;
import bean.Terms;
import bean.indexContent;
import bean.navList;
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
		//���ô������ݱ��뷽ʽ
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		//��ȡsession����
		HttpSession session=request.getSession();
		//��ȡ��ǰ��¼�û���Ϣ
		Object userid=session.getAttribute("userid");
	

		if(userid==null ){
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
			String flgs=request.getParameter("flgs");
			if("homepage".equals(tbname)) {
				//��ѯ����һ������
				List<navList> fnavSize=GetList.getlist(navList.class, db.executeQuery("select * from fnav "));
				//��ѯ���ж�������
				List<Snav> snavSize=GetList.getlist(Snav.class, db.executeQuery("select * from snav "));
				//��ѯ���н�ʦ����
				List<Teacher> teaSize=GetList.getlist(Teacher.class, db.executeQuery("select * from teacher "));
				//��ѯ���а༶��Ŀ
				List<Classinfo> classSize=GetList.getlist(Classinfo.class, db.executeQuery("select * from classinfo "));
				//��ѯ����ѧ������
				List<Students> stuSize=GetList.getlist(Students.class, db.executeQuery("select * from students "));
				int zhujiao=0;
				int jiangshi=0;
				int fujiaoshou=0;
				int jiaoshou=0;
				for(int i=0;i<teaSize.size();i++) {
					if(teaSize.get(i).getProftitle().equals("����")) {
						zhujiao++;
					}else if("��ʦ".equals(teaSize.get(i).getProftitle())) {
						jiangshi++;
					}else if("������".equals(teaSize.get(i).getProftitle())) {
							fujiaoshou++;
						}else if("����".equals(teaSize.get(i).getProftitle())) {
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
				request.getRequestDispatcher("/admin/main.jsp").forward(request, response);
				return;
				
			}
			if("title".equals(tbname)){	//			
				//��������������˵�����ѯȫ������
				if("1".equals(flgs)){
					//��ȡ���⼰��ע����Ϣ
					List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
					//��������
					indexContent a=new indexContent();
					//ȡ��ѯ���������
					if(other.size()>0){
						a=other.get(0);
					}
					//����Ϣд��session
					session.setAttribute("other", a);
					//System.out.print(a.getFooter_name());
					request.getRequestDispatcher("/admin/title.jsp").forward(request, response);
					return ;
				}				
				return;
			}
			if("fnav".equals(tbname)){	//һ�������˵�
				//�����ѯ������
				String sql="";
				//��������������˵�����ѯȫ������
				if("1".equals(flgs)){
					session.setAttribute("sql", "select  * from  fnav where 1=1 ");
				}
				//��ѯ�����ת��������
				List<navList> alist=GetList.getlist(navList.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//��ѯ�������ǰ̨
				request.setAttribute("alist", alist);
				request.getRequestDispatcher("/admin/f_nav.jsp").forward(request, response);
				return;
			}
			
			if("snav".equals(tbname)){	//����������
				//�����ѯ������
				String sql="";
				//��������������˵�����ѯȫ������
				if("1".equals(flgs)){
					session.setAttribute("sql", "select fnav.name, snav.* from snav, fnav where 1=1  and fnav.id=fnav_id");
				}				
				//��ѯ�����ת��������
				List<Snav> alist=GetList.getlist(Snav.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//��ѯ�������ǰ̨
				request.setAttribute("alist", alist);				
				List<navList> otitlelist=GetList.getlist(navList.class, db.executeQuery("select * from fnav"));
				request.setAttribute("otitlelist", otitlelist);
				request.getRequestDispatcher("/admin/s_nav.jsp").forward(request, response);
				return;
			}
			if("indexshow".equals(tbname)) {
				//��ȡ���⼰��ע����Ϣ
				List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexshow where id=1"));
				//��������
				indexContent a=new indexContent();
				//ȡ��ѯ���������
				if(other.size()>0){
					a=other.get(0);
				}
				//System.out.print("WordColor="+a.getWordColor());
				//����Ϣд��session
				session.setAttribute("other", a);
				request.getRequestDispatcher("/admin/title.jsp").forward(request, response);
				return;
			}
			if("teacher".equals(tbname)){	//��ʦ��Ϣ
				//�����ѯ������
				String sql="";
				//��������������˵�����ѯȫ������
				if("1".equals(flgs)){
					session.setAttribute("sql", "select  teacher.* from  teacher where 1=1 ");
				}
				//��ѯ�����ת��������
				List<Teacher> alist=GetList.getlist(Teacher.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				
				//��ѯ�������ǰ̨
				request.setAttribute("alist", alist);
				
				request.getRequestDispatcher("/admin/teacher.jsp").forward(request, response);
				return;
			}
			if("terms".equals(tbname)){	//ѧ����Ϣ
				//�����ѯ������
				String sql="";
				//��������������˵�����ѯȫ������
				if("1".equals(flgs)){
					session.setAttribute("sql", "select  terms.* from  terms where 1=1 ");
				}
				//��ѯ�����ת��������
				List<Terms> alist=GetList.getlist(Terms.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//��ѯ�������ǰ̨
				request.setAttribute("alist", alist);
				request.getRequestDispatcher("/admin/terms.jsp").forward(request, response);
				return;
			}
			if("classinfo".equals(tbname)){	//�༶��Ϣ
				//�����ѯ������
				String sql="";
				//��������������˵�����ѯȫ������
				if("1".equals(flgs)){
					session.setAttribute("sql", "select  classinfo.* from  classinfo where 1=1 ");
				}
				//��ѯ�����ת��������
				List<Classinfo> alist=GetList.getlist(Classinfo.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//��ѯ�������ǰ̨
				request.setAttribute("alist", alist);
				request.getRequestDispatcher("/admin/classinfo.jsp").forward(request, response);
				return;
			}
			if("students".equals(tbname)){	//ѧ����Ϣ
				//�����ѯ������
				String sql="";
				//��������������˵�����ѯȫ������
				if("1".equals(flgs)){
					session.setAttribute("sql", "select classno,classname, students.* from classinfo, students where 1=1  and classinfo.id=classinfo_id  order by sno asc");
				}
				//��ѯ�����ת��������
				List<Students> alist=GetList.getlist(Students.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//��ѯ�������ǰ̨
				request.setAttribute("alist", alist);
				List<Classinfo> classinfolist=GetList.getlist(Classinfo.class, db.executeQuery("select * from classinfo"));
				request.setAttribute("classinfolist", classinfolist);
				request.getRequestDispatcher("/admin/students.jsp").forward(request, response);
				return;
			}
			if("course".equals(tbname)){	//�γ���Ϣ
				//�����ѯ������
				String sql="";
				//��������������˵�����ѯȫ������
				if("1".equals(flgs)){
					session.setAttribute("sql", "select  course.* from  course where 1=1 ");
				}
				//��ѯ�����ת��������
				List<Course> alist=GetList.getlist(Course.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//��ѯ�������ǰ̨
				request.setAttribute("alist", alist);
				request.getRequestDispatcher("/admin/course.jsp").forward(request, response);
				return;
			}
			if("courseplan".equals(tbname)){	//�γ̰���
				//�����ѯ������
				String sql="";
				//��������������˵�����ѯȫ������
				if("1".equals(flgs)){
					session.setAttribute("sql", "select termname,classno,classname,cno,cname,tNo,tName,sex, courseplan.* from terms,classinfo,course,teacher, courseplan where 1=1  and terms.id=terms_id and classinfo.id=classinfo_id and course.id=course_id and teacher.id=courseplan.teacher_id");
				}
				//��ѯ�����ת��������
				List<CoursePlan> alist=GetList.getlist(CoursePlan.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//��ѯ�������ǰ̨
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
				return;
			}
			if("adminInfo".equals(tbname)){	//һ�������˵�				
				//��������������˵�����ѯȫ������
				if("1".equals(flgs)){
					request.getRequestDispatcher("/admin/adminInfo.jsp").forward(request, response);
					return ;
				}				
				return;
			}
			
			
		/**
		 * ��ʦҳ���������		
		 */
			if("teacourse".equals(tbname)){		//��ʦ�οογ�
				//�����ѯ������
				String sql="";
				//��������������˵�����ѯȫ������
				if("1".equals(flgs)){
					session.setAttribute("sql", "select termname,classno,classname,cno,cname,tNo,tName,sex, courseplan.* from terms,classinfo,course,teacher, courseplan where 1=1  and terms.id=terms_id and classinfo.id=classinfo_id and course.id=course_id and teacher.id=courseplan.teacher_id and teacher.id="+userid+" order by terms.id desc");
				}
				//��ѯ�����ת��������
				List<CoursePlan> alist=GetList.getlist(CoursePlan.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//��ѯ�������ǰ̨
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
				return;
			}
			
			if("tshiyan".equals(tbname)){		//��ʦʵ�����
				//�����ѯ������
				String sql="";
				//��������������˵�����ѯȫ������
				if("1".equals(flgs)){
					session.setAttribute("sql", "select termname,classno,classname,cno,cname,tNo,tName, teatask.* from terms,classinfo,course,teacher, teatask where 1=1  and terms.id=teatask.terms_id and classinfo.id=teatask.classinfo_id and course.id=teatask.course_id and teacher.id=teatask.teacher_id and teacher.id="+userid+" group by id order by id desc");
				}
				//��ѯ�����ת��������
				List<TeaTask> alist=GetList.getlist(TeaTask.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
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
			if("Tscore".equals(tbname)){		//��ʦ�ɼ�����
				//�����ѯ������
				String sql="";
				//��������������˵�����ѯȫ������
				if("1".equals(flgs)){
					session.setAttribute("sql", "select termname,classno,classname,cno,cname,sno,stutask.*,teatask.title,teatask.remark,teatask.time,teatask.deadline from stutask,terms,classinfo,course,teacher,students, teatask where 1=1  and terms.id=teatask.terms_id and classinfo.id=teatask.classinfo_id and" + 
												" course.id=teatask.course_id and stu_id=students.id and teacher.id=teatask.teacher_id and teatask_id=teatask.id and teatask.teacher_id="+userid+" group by stutask.id order by stutask.id desc");
				}
				//��ѯ�����ת��������
				List<Stutask> alist=GetList.getlist(Stutask.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//��ѯ�������ǰ̨
				request.setAttribute("alist", alist);
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);
				List<Classinfo> classinfolist=GetList.getlist(Classinfo.class, db.executeQuery("select * from classinfo"));
				request.setAttribute("classinfolist", classinfolist);
				List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
				request.setAttribute("courselist", courselist);
				
				request.getRequestDispatcher("/teacher/score.jsp").forward(request, response);
				return;
			}
			
			
			if("tGitmana".equals(tbname)){		//��ʦgitʵ�����--¼������
				
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);
				
				List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
				request.setAttribute("courselist", courselist);
				
				request.getRequestDispatcher("/teacher/GitMana.jsp").forward(request, response);
				return;
			}
			if("tGitDate".equals(tbname)){		//��ʦgitʵ�����--�鿴����
				String tablename="reposdate";   
				//�����ѯ������
				String sql="";
				//��������������˵�����ѯȫ������
				if("1".equals(flgs)){
					session.setAttribute("sql", "select "+tablename+".*,students.sname, terms.termname,course.cname,classinfo.classname from "+tablename+",students,course,terms,classinfo  where classinfo.id=students.classinfo_id and students.sno=Num and course_id=course.id and "+tablename+".terms_id=terms.id  order by Num desc");
				}
				//��ѯ�����ת��������
				List<GitDate> alist=GetList.getlist(GitDate.class, HandlePage.Sy(db, "20", session,"sql","mysql"));
				System.out.print("size="+alist.size());
				//��ѯ�������ǰ̨
				request.setAttribute("alist", alist);
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);
				List<Classinfo> classinfolist=GetList.getlist(Classinfo.class, db.executeQuery("select * from classinfo"));
				request.setAttribute("classinfolist", classinfolist);
				List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
				request.setAttribute("courselist", courselist);
				request.getRequestDispatcher("/teacher/GitDate.jsp").forward(request, response);
				return;
			}
			if("teacherInfo".equals(tbname)){	//һ�������˵�				
				//��������������˵�����ѯȫ������
				if("1".equals(flgs)){
					request.getRequestDispatcher("/teacher/teacherInfo.jsp").forward(request, response);
					return ;
				}				
				return;
			}
			
		/**
		 * ѧ��ҳ���������		
		 */
			if("stucourse".equals(tbname)){
				//�����ѯ������
				String sql="";
				//��������������˵�����ѯȫ������
				if("1".equals(flgs)){
					session.setAttribute("sql", "select termname,classno,classname,cno,cname,tNo,tName,sex,tPhone, courseplan.* from terms,classinfo,course,teacher, courseplan where 1=1  and terms.id=terms_id and classinfo.id=classinfo_id and course.id=course_id and teacher.id=courseplan.teacher_id and classinfo.id in(select classinfo_id from students where id="+userid+") order by terms.id desc");
				}
				//��ѯ�����ת��������
				List<CoursePlan> alist=GetList.getlist(CoursePlan.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//��ѯ�������ǰ̨
				request.setAttribute("alist", alist);
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);
				
				request.getRequestDispatcher("/student/courseplan.jsp").forward(request, response);
				return;
			}
			
			if("stutaskinfo".equals(tbname)){	//ѧ����ѯ��ʦ������ʵ����Ϣ
				//�����ѯ������
				String sql="";
				//��������������˵�����ѯȫ������
				if("1".equals(flgs)){
					session.setAttribute("sql", "select teatask.*,termname,classname,cname,tName from courseplan,teatask,classinfo,course,teacher,terms where classinfo.id=teatask.classinfo_id and teatask.terms_id=terms.id and teatask.teacher_id=teacher.id and  course.id=teatask.course_id and classinfo.id in (select classinfo_id from students where id="+userid+") group by id order by id desc");
				}
				//��ѯ�����ת��������
				List<TeaTask> alist=GetList.getlist(TeaTask.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				System.out.print(alist.size());
				//��ѯ�������ǰ̨
				request.setAttribute("alist", alist);
				//ѧ��
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);
				List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
				request.setAttribute("courselist", courselist);
				request.getRequestDispatcher("/student/StuTask.jsp").forward(request, response);
				return;
			}
			if("mstutask".equals(tbname)){	//ѧ����ѯ��ʦ������ʵ����Ϣ,���ύ����Ϣ
				//�����ѯ������
				String sql="";
				//��������������˵�����ѯȫ������
				if("1".equals(flgs)){
					session.setAttribute("sql", "select termname,classno,classname,cno,cname,stutask.*,teatask.title,teatask.remark,teatask.time,teatask.deadline from stutask,terms,classinfo,course,teacher, teatask where 1=1  and terms.id=teatask.terms_id and classinfo.id=teatask.classinfo_id and\r\n" + 
							" course.id=teatask.course_id and teacher.id=teatask.teacher_id and teatask_id=teatask.id and stu_id="+userid+" group by stutask.id order by stutask.id desc");
				}
				//��ѯ�����ת��������
				List<Stutask> alist=GetList.getlist(Stutask.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				System.out.print(alist.size());
				//��ѯ�������ǰ̨
				request.setAttribute("alist", alist);
				//ѧ��
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);
				List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
				request.setAttribute("courselist", courselist);
				request.getRequestDispatcher("/student/StuTaskhistory.jsp").forward(request, response);
				return;
			}
			
			if("Sscore".equals(tbname)){		//ѧ���鿴�ɼ�
				Students userinfo=(Students)session.getAttribute("userinfo");
				String sno=userinfo.getSno();
				//�����ѯ������
				String tablename="reposdate";
				String sql="";
				//��������������˵�����ѯȫ������
				if("1".equals(flgs)){
					session.setAttribute("sql", "select "+tablename+".*,students.sname, terms.termname,course.cname from "+tablename+",students,course,terms where  students.sno=Num and course_id=course.id and "+tablename+".terms_id=terms.id and Num='"+sno+"'  order by Num DESC");
				}
				//��ѯ�����ת��������
				List<GitDate> alist=GetList.getlist(GitDate.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//��ѯ�������ǰ̨
				request.setAttribute("alist", alist);
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);
				List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
				request.setAttribute("courselist", courselist);
				
				request.getRequestDispatcher("/student/score.jsp").forward(request, response);
				return;
			}
			if("TaskTip".equals(tbname)){	//ѧ������ɵ�ʵ����Ϣ--��������
				//�����ѯ������
				String sql="";
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//�������ڸ�ʽ
		        //System.out.println(df.format(new Date()));// new Date()Ϊ��ȡ��ǰϵͳʱ��

				String nowtime=df.format(new Date());
				//��������������˵�����ѯȫ������
				if("1".equals(flgs)){
					session.setAttribute("sql", "select teatask.*,termname,classname,cname,tName from courseplan,teatask,classinfo,course,teacher,terms where classinfo.id=teatask.classinfo_id and teatask.terms_id=terms.id and teatask.teacher_id=teacher.id and  course.id=teatask.course_id and deadline > '"+nowtime+"' and classinfo.id in (select classinfo_id from students where id="+userid+") group by id order by id desc");
				}
				//��ѯ�����ת��������
				List<TeaTask> alist=GetList.getlist(TeaTask.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				System.out.print(alist.size());
				//��ѯ�������ǰ̨
				request.setAttribute("alist", alist);
				
				request.getRequestDispatcher("/student/TaskTip.jsp").forward(request, response);
				return;
			}
			if("studentInfo".equals(tbname)){	//һ�������˵�				
				//��������������˵�����ѯȫ������
				if("1".equals(flgs)){
					request.getRequestDispatcher("/student/studentInfo.jsp").forward(request, response);
					return ;
				}				
				return;
			}
	}
  }
	

}