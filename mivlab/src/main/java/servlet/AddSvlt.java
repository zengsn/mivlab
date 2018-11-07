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

import bean.TeaTask;
import net.sf.json.JSONObject;
import utils.Dbhelper;

/**
 * Servlet implementation class AddSvlt
 */
@WebServlet("/AddSvlt")
public class AddSvlt extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSvlt() {
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
		//����json����
		JSONObject json=new JSONObject();
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
			if("fnav".equals(tbname)){	//һ��������
				String name=request.getParameter("name");
				boolean bl=db.checkTrue("select id from fnav where name='"+name+"'");
				if(bl){
					json.put("msg", "�����Ѵ���");
				}else{
					int bls=db.executeUpdate("insert into fnav(name) values('"+name+"')");
					if(bls>0){
						json.put("msg", "��ӳɹ�");
					}else{
						json.put("msg", "���ʧ��");
					}
				}
			}
			
			if("snav".equals(tbname)){	//����������
				String name=request.getParameter("name");
				String remark=request.getParameter("remark");
				String fnav_id=request.getParameter("fnav_id");
				boolean bl=db.checkTrue("select id from snav where snav_name='"+name+"'");
				if(bl){
					json.put("msg", "�����Ѵ���");
				}else{
					int bls=db.executeUpdate("insert into snav(snav_name,remark,fnav_id) values('"+name+"','"+remark+"',"+fnav_id+")");
					if(bls>0){
						json.put("msg", "��ӳɹ�");
					}else{
						json.put("msg", "���ʧ��");
					}
				}
			}
			if("teacher".equals(tbname)){	//��ʦ��Ϣ
				String tNo=request.getParameter("tNo");
				String tName=request.getParameter("tName");
				String sex=request.getParameter("sex");
				String tPhone=request.getParameter("tPhone");
				String tAddr=request.getParameter("tAddr");
				String tPwd=request.getParameter("tPwd");
				String proftitle=request.getParameter("proftitle");
				
				boolean bl=db.checkTrue("select id from teacher where tno='"+tNo+"'");
				if(bl){
					json.put("msg", "�����Ѵ���");
				}else{
					int bls=db.executeUpdate("insert into teacher(tNo,tName,sex,tPhone,tAddr,tPwd,proftitle) values('"+tNo+"','"+tName+"','"+sex+"','"+tPhone+"','"+tAddr+"','"+tPwd+"','"+proftitle+"')");
					if(bls>0){
						json.put("msg", "��ӳɹ�");
					}else{
						json.put("msg", "���ʧ��");
					}
				}
			}
			if("terms".equals(tbname)){	//ѧ����Ϣ
				String termno=request.getParameter("termno");
				String termname=request.getParameter("termname");
				boolean bl=db.checkTrue("select id from terms where termno='"+termno+"'");
				if(bl){
					json.put("msg", "ѧ�ڱ���Ѵ���");
				}else{
					int bls=db.executeUpdate("insert into terms(termno,termname) values('"+termno+"','"+termname+"')");
					if(bls>0){
						json.put("msg", "��ӳɹ�");
					}else{
						json.put("msg", "���ʧ��");
					}
				}
			}
			if("classinfo".equals(tbname)){		//�༶��Ϣ
				String classno=request.getParameter("classno");
				String classname=request.getParameter("classname");
				boolean bl=db.checkTrue("select id from classinfo where classno='"+classno+"'");
				if(bl){
					json.put("msg", "�༶����Ѵ���");
				}else{
					int bls=db.executeUpdate("insert into classinfo(classno,classname) values('"+classno+"','"+classname+"')");
					if(bls>0){
						json.put("msg", "��ӳɹ�");
					}else{
						json.put("msg", "���ʧ��");
					}
				}
			}
			if("students".equals(tbname)){	//ѧ����Ϣ
				String sno=request.getParameter("sno");
				String sname=request.getParameter("sname");
				String sgender=request.getParameter("sgender");
				String classinfo_id=request.getParameter("classinfo_id");
				String sphone=request.getParameter("sphone");
				String spassword=request.getParameter("spassword");
				boolean bl=db.checkTrue("select id from students where sno='"+sno+"'");
				if(bl){
					json.put("msg", "ѧ���Ѵ���");
				}else{
					int bls=db.executeUpdate("insert into students(sno,sname,sgender,classinfo_id,sphone,spassword) values('"+sno+"','"+sname+"','"+sgender+"',"+classinfo_id+",'"+sphone+"','"+spassword+"')");
					if(bls>0){
						json.put("msg", "��ӳɹ�");
					}else{
						json.put("msg", "���ʧ��");
					}
				}
			}
			if("course".equals(tbname)){	//�γ���Ϣ
				String cno=request.getParameter("cno");
				String cname=request.getParameter("cname");
				boolean bl=db.checkTrue("select id from course where cno='"+cno+"'");
				if(bl){
					json.put("msg", "�γ̱���Ѵ���");
				}else{
					int bls=db.executeUpdate("insert into course(cno,cname) values('"+cno+"','"+cname+"')");
					if(bls>0){
						json.put("msg", "��ӳɹ�");
					}else{
						json.put("msg", "���ʧ��");
					}
				}
			}
			if("courseplan".equals(tbname)){	//�γ̰���
				String terms_id=request.getParameter("terms_id");
				String classinfo_id=request.getParameter("classinfo_id");
				String course_id=request.getParameter("course_id");
				String teacher_id=request.getParameter("teacher_id");
				boolean bl=db.checkTrue("select id from courseplan where terms_id="+terms_id+" and classinfo_id="+classinfo_id+" and course_id="+course_id);
				if(bl){
					json.put("msg", "�γ̰����Ѵ���");
				}else{
					int bls=db.executeUpdate("insert into courseplan(terms_id,classinfo_id,course_id,teacher_id) values("+terms_id+","+classinfo_id+","+course_id+","+teacher_id+")");
					if(bls>0){
						json.put("msg", "��ӳɹ�");
					}else{
						json.put("msg", "���ʧ��");
					}
				}
			}
			/*
			 * 
			 * ��ʦ������ز���
			 */
			if("teaTask".equals(tbname)){	//�γ̰���
				String terms_id=request.getParameter("termid");
				String classinfo_id=request.getParameter("classid");
				String course_id=request.getParameter("courseid");				
				String title=request.getParameter("title");
				String remark=request.getParameter("remark");
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
		        //System.out.println(df.format(new Date()));// new Date()Ϊ��ȡ��ǰϵͳʱ��
				System.out.print("****remark="+remark+"****");
				String Rtime=df.format(new Date());
				String deadline=request.getParameter("deadline");
				int bls=db.executeUpdate("insert into teatask(terms_id,classinfo_id,course_id,teacher_id,title,remark,time,deadline) values("+terms_id+","+classinfo_id+","+course_id+","+userid+",'"+title+"','"+remark+"','"+Rtime+"','"+deadline+"')");
				if(bls>0){
					json.put("msg", "1");
				}else{
					json.put("msg", "2");
				}				
			}
			
			if("stutask".equals(tbname)){	//ѧ���ύ��ҵ
				String teatask_id=request.getParameter("teatask_id");						
				String remark=request.getParameter("remark");
				session.setAttribute("sql", "select * from stutask where teatask_id="+teatask_id+" and stu_id="+userid);
				
				//��ѯ�����ת��������
				List<TeaTask> alist=GetList.getlist(TeaTask.class, HandlePage.Sy(db, "10", session,"sql","mysql"));				
				//�Ƿ��ظ��ύ
				if(alist.size()>0){
					int bls=db.executeUpdate("update stutask set stusy_remark='"+remark+"' where teatask_id="+teatask_id+" and stu_id="+userid);
					if(bls>0){
						json.put("msg", "�ύ�ɹ�");
					}else{
						json.put("msg", "�ύʧ��");
					}
				}else {
					int bls=db.executeUpdate("insert into stutask(teatask_id,stu_id,stusy_remark) values("+teatask_id+","+userid+",'"+remark+"')");
					if(bls>0){
						json.put("msg", "�ύ�ɹ�");
					}else{
						json.put("msg", "�ύʧ��");
					}	
				}
							
			}
		}
		
		
		PrintWriter out=response.getWriter();
		out.print(json.toString());
		out.flush();
		out.close();
	}
}