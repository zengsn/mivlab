package servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
import net.sf.json.JSONObject;
import utils.Dbhelper;

/**
 * Servlet implementation class GetDataSvlt
 */
@WebServlet("/GetDataSvlt")
public class GetDataSvlt extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetDataSvlt() {
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
		//����json����
		JSONObject json=new JSONObject();
		//�������ݿ��������
		DbConn db=Dbhelper.getDb();
		String id=request.getParameter("id");
		//��ȡ������ʶ
		String tbname=request.getParameter("tbname");
		//��ȡsession����
		HttpSession session=request.getSession();
		//��ȡ��ǰ��¼�û���Ϣ
		Object useridd=session.getAttribute("userid");
		
		if(useridd==null){
			PrintWriter out=response.getWriter();
			out.print("�����µ�¼");
			out.flush();
			out.close();
			return;
		}else {
			if("fnav".equals(tbname)){		//һ��������
				//��ѯ���ݿ��ȡ��Ҫ����Ϣ
				List<navList> alist=GetList.getlist(navList.class, db.executeQuery("select * from fnav where id="+id));
				//��������
				navList a=new navList();
				//ȡ��ѯ���������
				if(alist.size()>0){
					a=alist.get(0);
				}
				//����Ϣд��json
				json.put("ob", a);
			}
			if("snav".equals(tbname)){		//����������--����ʹ������
				//��ѯ���ݿ��ȡ��Ҫ����Ϣ
				List<Snav> alist=GetList.getlist(Snav.class, db.executeQuery("select * from snav where id="+id));
				//��������
				Snav a=new Snav();
				//ȡ��ѯ���������
				if(alist.size()>0){
					a=alist.get(0);
				}
				request.setAttribute("ob", a);			
				String remark=a.getRemark();
				List<navList> otitlelist=GetList.getlist(navList.class, db.executeQuery("select * from fnav"));
				request.setAttribute("otitlelist", otitlelist);
				request.getRequestDispatcher("/admin/s_navUpdate.jsp?remark="+remark).forward(request, response);
				return ;
			}
			if("snav_add".equals(tbname)){		//����������--����ʹ������
				List<navList> otitlelist=GetList.getlist(navList.class, db.executeQuery("select * from fnav"));
				request.setAttribute("otitlelist", otitlelist);
				request.getRequestDispatcher("/admin/s_navAdd.jsp?").forward(request, response);
				return ;
			}
			if("teacher".equals(tbname)){		//��ʦ��Ϣ
				//��ѯ���ݿ��ȡ��Ҫ����Ϣ
				List<Teacher> alist=GetList.getlist(Teacher.class, db.executeQuery("select * from teacher where id="+id));
				//��������
				Teacher a=new Teacher();
				//ȡ��ѯ���������
				if(alist.size()>0){
					a=alist.get(0);
				}
				//����Ϣд��json
				json.put("ob", a);
			}
			if("terms".equals(tbname)){	//ѧ����Ϣ
				//��ѯ���ݿ��ȡ��Ҫ����Ϣ
				List<Terms> alist=GetList.getlist(Terms.class, db.executeQuery("select * from terms where id="+id));
				//��������
				Terms a=new Terms();
				//ȡ��ѯ���������
				if(alist.size()>0){
					a=alist.get(0);
				}
				//����Ϣд��json
				json.put("ob", a);
			}
			if("classinfo".equals(tbname)){	//�༶��Ϣ
				//��ѯ���ݿ��ȡ��Ҫ����Ϣ
				List<Classinfo> alist=GetList.getlist(Classinfo.class, db.executeQuery("select * from classinfo where id="+id));
				//��������
				Classinfo a=new Classinfo();
				//ȡ��ѯ���������
				if(alist.size()>0){
					a=alist.get(0);
				}
				//����Ϣд��json
				json.put("ob", a);
			}
			if("students".equals(tbname)){	//ѧ����Ϣ
				//��ѯ���ݿ��ȡ��Ҫ����Ϣ
				List<Students> alist=GetList.getlist(Students.class, db.executeQuery("select * from students where id="+id ));
				//��������
				Students a=new Students();
				//ȡ��ѯ���������
				if(alist.size()>0){
					a=alist.get(0);
				}
				//����Ϣд��json
				json.put("ob", a);
			}
			if("course".equals(tbname)){	//�γ���Ϣ
				//��ѯ���ݿ��ȡ��Ҫ����Ϣ
				List<Course> alist=GetList.getlist(Course.class, db.executeQuery("select * from course where id="+id));
				//��������
				Course a=new Course();
				//ȡ��ѯ���������
				if(alist.size()>0){
					a=alist.get(0);
				}
				//����Ϣд��json
				json.put("ob", a);
			}
			if("courseplan".equals(tbname)){	//�γ̰���
				//��ѯ���ݿ��ȡ��Ҫ����Ϣ
				List<CoursePlan> alist=GetList.getlist(CoursePlan.class, db.executeQuery("select * from courseplan where id="+id));
				//��������
				CoursePlan a=new CoursePlan();
				//ȡ��ѯ���������
				if(alist.size()>0){
					a=alist.get(0);
				}
				//����Ϣд��json
				json.put("ob", a);
			}
			
			/*
			 * ��ʦ���ܲ���
			 */
			if("teacourse".equals(tbname)){	//��ʦ��ȡ��ʦ����ʵ��Ŀγ���Ϣ
				
				//��ȡ��ǰ��¼�û���Ϣ
				Object userid=session.getAttribute("userid");
				int planid=Integer.parseInt(request.getParameter("planid"));
				session.setAttribute("sql", "select termname,classno,classname,cno,cname,tNo,tName,sex, courseplan.* from terms,classinfo,course,teacher, courseplan where 1=1  and terms.id=terms_id and classinfo.id=classinfo_id and course.id=course_id and teacher.id=courseplan.teacher_id and teacher.id="+userid+" and courseplan.id="+planid);
				
				//��ѯ�����ת��������
				List<CoursePlan> alist=GetList.getlist(CoursePlan.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//��������
				CoursePlan a=new CoursePlan();
				//ȡ��ѯ���������
				if(alist.size()>0){
					a=alist.get(0);
				}
				//��ѯ�������ǰ̨
				request.setAttribute("a", a);
				
				request.getRequestDispatcher("/teacher/releaseTask.jsp").forward(request, response);
				return;
			}
			
			if("TteaTask".equals(tbname)){	//��ȡ��ʦ����ʵ�����Ϣ
				
				//��ȡ��ǰ��¼�û���Ϣ
				Object userid=session.getAttribute("userid");
				int taskid=Integer.parseInt(request.getParameter("id"));
				session.setAttribute("sql", "select teatask.*,termname,classname,cname,tName from courseplan,teatask,classinfo,course,teacher,terms where classinfo.id=teatask.classinfo_id and teatask.terms_id=terms.id and teatask.teacher_id=teacher.id and  course.id=teatask.course_id and teatask.id="+taskid+" group by id");
				
				//��ѯ�����ת��������
				List<TeaTask> alist=GetList.getlist(TeaTask.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//��������
				TeaTask a=new TeaTask();
				//ȡ��ѯ���������
				if(alist.size()>0){
					a=alist.get(0);
				}
				//��ѯ�������ǰ̨
				request.setAttribute("a", a);
				
				request.getRequestDispatcher("/teacher/Taskinfo.jsp").forward(request, response);
				return;
			}
			
			if("Tscore".equals(tbname)){	//��ȡѧ���ύ��ʵ����Ϣ
				
				//��ȡ��ǰ��¼�û���Ϣ
				Object userid=session.getAttribute("userid");
				int taskid=Integer.parseInt(request.getParameter("id"));
				session.setAttribute("sql", "select teatask.title,teatask.remark,teatask.time,teatask.deadline,stutask.*,termname,classname,cname,tName from stutask,courseplan,teatask,classinfo,course,teacher,terms where classinfo.id=teatask.classinfo_id and teatask.terms_id=terms.id and teatask.teacher_id=teacher.id and  course.id=teatask.course_id and teatask.id=teatask_id and stutask.id="+taskid+" and classinfo.id in (select classinfo_id from students where id="+userid+") group by id");
				
				//��ѯ�����ת��������
				List<Stutask> alist=GetList.getlist(Stutask.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//��������
				Stutask a=new Stutask();
				//ȡ��ѯ���������
				if(alist.size()>0){
					a=alist.get(0);
				}
				//��ѯ�������ǰ̨
				request.setAttribute("a", a);
				
				request.getRequestDispatcher("/teacher/TaskHistoryinfo.jsp").forward(request, response);
				return;
			}
			if("tGitDate".equals(tbname)){	//��ȡ�µ����GitHubʵ����Ϣ
				
				//��ȡ��ǰ��¼�û���Ϣ
				Object userid=session.getAttribute("userid");
				String org=request.getParameter("org");
				String proj=request.getParameter("proj");
				
				String tablename="reposdate";   
				session.setAttribute("sql", "select "+tablename+".*,students.sname, terms.termname,course.cname from "+tablename+",students,course,terms where  students.sno=Num and course_id=course.id and "+tablename+".terms_id=terms.id and org='"+org+"' and proj='"+proj+"'");
				
				//��ѯ�����ת��������
				List<GitDate> alist=GetList.getlist(GitDate.class, HandlePage.Sy(db, "100", session,"sql","mysql"));
				System.out.print("size="+alist.size());
				//��ѯ�������ǰ̨
				request.setAttribute("alist", alist);
				List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
				request.setAttribute("termslist", termslist);
				List<Classinfo> classinfolist=GetList.getlist(Classinfo.class, db.executeQuery("select * from classinfo where id="+id));
				request.setAttribute("classinfolist", classinfolist);
				List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
				request.setAttribute("courselist", courselist);
				request.getRequestDispatcher("/teacher/GitDate.jsp").forward(request, response);
				return;
			}
			
			
			/**
			 * 
			 * ѧ��������ز���
			 */
				if("teaTask".equals(tbname)){	//ѧ����ȡ��ʦ����ʵ�����Ϣ
				
				//��ȡ��ǰ��¼�û���Ϣ
				Object userid=session.getAttribute("userid");
				int taskid=Integer.parseInt(request.getParameter("id"));
				session.setAttribute("sql", "select teatask.*,termname,classname,cname,tName from courseplan,teatask,classinfo,course,teacher,terms where classinfo.id=teatask.classinfo_id and teatask.terms_id=terms.id and teatask.teacher_id=teacher.id and  course.id=teatask.course_id and teatask.id="+taskid+" and classinfo.id in (select classinfo_id from students where id="+userid+") group by id");
				
				//��ѯ�����ת��������
				List<TeaTask> alist=GetList.getlist(TeaTask.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//��������
				TeaTask a=new TeaTask();
				//ȡ��ѯ���������
				if(alist.size()>0){
					a=alist.get(0);
				}
				
				Stutask b=new Stutask();
				List<Stutask> blist=GetList.getlist(Stutask.class, db.executeQuery("select stutask.* from stutask where teatask_id="+a.getId()+" and stu_id= "+userid));
				if(blist.size()>0) {
					b.setStusy_remark(blist.get(0).getStusy_remark());
				}
				else {
					b.setStusy_remark("");
				}
				System.out.print("ѧ�����������="+b.getStusy_remark());
				//��ѯ�������ǰ̨
				request.setAttribute("a", a);
				request.setAttribute("b", b);
				request.getRequestDispatcher("/student/Taskinfo.jsp").forward(request, response);
				return;
			}
				
				if("stuTask".equals(tbname)){	//ѧ����ȡ�Լ���ʵ���ύ��¼
					
					//��ȡ��ǰ��¼�û���Ϣ
					Object userid=session.getAttribute("userid");
					int taskid=Integer.parseInt(request.getParameter("id"));
					session.setAttribute("sql", "select teatask.title,teatask.remark,teatask.time,teatask.deadline,stutask.*,termname,classname,cname,tName from stutask,courseplan,teatask,classinfo,course,teacher,terms where classinfo.id=teatask.classinfo_id and teatask.terms_id=terms.id and teatask.teacher_id=teacher.id and  course.id=teatask.course_id and teatask.id=teatask_id and stutask.id="+taskid+" and classinfo.id in (select classinfo_id from students where id="+userid+") group by id");
					
					//��ѯ�����ת��������
					List<Stutask> alist=GetList.getlist(Stutask.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
					//��������
					Stutask a=new Stutask();
					//ȡ��ѯ���������
					if(alist.size()>0){
						a=alist.get(0);
					}
					//��ѯ�������ǰ̨
					request.setAttribute("a", a);
					
					request.getRequestDispatcher("/student/TaskHistoryinfo.jsp").forward(request, response);
					return;
				}
				
				
			PrintWriter out=response.getWriter();
			out.print(json.toString());
			out.flush();
			out.close();
		}
	}
		

}
