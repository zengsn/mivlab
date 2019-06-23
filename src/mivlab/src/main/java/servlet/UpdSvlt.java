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

import bean.Teacher;
import bean.user;
import net.sf.json.JSONObject;
import utils.Dbhelper;

/**
 * Servlet implementation class UpdSvlt
 */
@WebServlet("/UpdSvlt")
public class UpdSvlt extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdSvlt() {
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
			request.getRequestDispatcher("index.jsp").forward(request, response);
			/**
			PrintWriter out=response.getWriter();
			out.print("请重新登录");
			out.flush();
			out.close();
			**/
			return;
		}else{
			//创建数据库操作对象
			DbConn db=Dbhelper.getDb();
			//获取操作标识
			String tbname=request.getParameter("tbname");
			if("fnav".equals(tbname)){	//一级导航栏
				String id=request.getParameter("id");
				String name=request.getParameter("name");
				if(db.checkTrue("select id from fnav where name='"+name+"' and id!="+id)){
					json.put("msg", "标题已存在");
				}else{
					int bls=db.executeUpdate("update fnav set name='"+name+"' where id="+id);
					System.out.print(bls);
					if(bls==1){
						json.put("msg", "修改成功");
					}else{
						json.put("msg", "修改失败");
					}
				}
			}
			
			if("snav".equals(tbname)){		//二级导航栏
				String id=request.getParameter("id");
				String name=request.getParameter("name");
				String remark=request.getParameter("remark");
				String fnav_id=request.getParameter("fnav_id");
				System.out.print("id="+id+";name="+name+";remark="+remark);
				if(db.checkTrue("select id from snav where snav_name='"+name+"' and id!="+id)){
					json.put("msg", "标题已存在");
				}else{
					int bls=db.executeUpdate("update snav set snav_name='"+name+"',remark='"+remark+"',fnav_id="+fnav_id+" where id="+id);
					if(bls>0){
						json.put("msg", "修改成功");
					}else{
						json.put("msg", "修改失败");
					}
				}
			}		
			
			if("indexshow".equals(tbname)){		//自定义网站风格
				String websiteTitle=request.getParameter("websiteTitle");
				String organization=request.getParameter("organization");
				String address=request.getParameter("address");
				String bgColorCode=request.getParameter("bgColorCode");
				String wordColorCode=request.getParameter("wordColorCode");
				System.out.print(address);				
				int bls=db.executeUpdate("update indexshow set title='"+websiteTitle+"',footer_name='"+organization+"',footer_Addr='"+address+"',bgColor='"+bgColorCode+"',wordColor='"+wordColorCode+"' where id=1");
				if(bls>0){
					json.put("msg", "修改成功");
				}else{
					json.put("msg", "修改失败");
				}
				
			}
			if("indexshowimg".equals(tbname)){		//自定义网站风格--移除背景	
				String imgpath="(./css/images/banner.png)";
				int bls=db.executeUpdate("update indexshow set imgpath='"+imgpath+"' where id="+1);
				if(bls>0){
					json.put("msg", "修改成功,如未及时更新，请刷新");
				}else{
					json.put("msg", "修改失败");
				}
				
			}
			if("teacher".equals(tbname)){	//教师信息
				String id=request.getParameter("id");
				String tNo=request.getParameter("tNo");
				String tName=request.getParameter("tName");
				String sex=request.getParameter("sex");
				String tPhone=request.getParameter("tPhone");
				String tAddr=request.getParameter("tAddr");
				String tPwd=request.getParameter("tPwd");
				String proftitle=request.getParameter("proftitle");
				if(db.checkTrue("select id from teacher where tNo='"+tNo+"' and id!="+id)){
					json.put("msg", "工号已存在");
				}else{
					int bls=db.executeUpdate("update teacher set tNo='"+tNo+"',tName='"+tName+"',sex='"+sex+"',tPhone='"+tPhone+"',tAddr='"+tAddr+"',tPwd='"+tPwd+"',proftitle='"+proftitle+"' where id="+id);
					if(bls>0){
						json.put("msg", "修改成功");
					}else{
						json.put("msg", "修改失败");
					}
				}
			}
			if("terms".equals(tbname)){	//学期信息
				String id=request.getParameter("id");
				String termno=request.getParameter("termno");
				String termname=request.getParameter("termname");
				if(db.checkTrue("select id from terms where termno='"+termno+"' and id!="+id)){
					json.put("msg", "学期编号已存在");
				}else{
					int bls=db.executeUpdate("update terms set termno='"+termno+"',termname='"+termname+"' where id="+id);
					if(bls>0){
						json.put("msg", "修改成功");
					}else{
						json.put("msg", "修改失败");
					}
				}
			}
			if("classinfo".equals(tbname)){
				String id=request.getParameter("id");
				String classno=request.getParameter("classno");
				String classname=request.getParameter("classname");
				if(db.checkTrue("select id from classinfo where classno='"+classno+"' and id!="+id)){
					json.put("msg", "班级编号已存在");
				}else{
					int bls=db.executeUpdate("update classinfo set classno='"+classno+"',classname='"+classname+"' where id="+id);
					if(bls>0){
						json.put("msg", "修改成功");
					}else{
						json.put("msg", "修改失败");
					}
				}
			}
			if("students".equals(tbname)){	//学生信息
				String id=request.getParameter("id");
				String sno=request.getParameter("sno");
				String sname=request.getParameter("sname");
				String sgender=request.getParameter("sgender");
				String classinfo_id=request.getParameter("classinfo_id");
				String sphone=request.getParameter("sphone");
				String spassword=request.getParameter("spassword");
				if(db.checkTrue("select id from students where sno='"+sno+"' and id!="+id)){
					json.put("msg", "学号已存在");
				}else{
					int bls=db.executeUpdate("update students set sno='"+sno+"',sname='"+sname+"',sgender='"+sgender+"',classinfo_id="+classinfo_id+",sphone='"+sphone+"',spassword='"+spassword+"' where id="+id);
					if(bls>0){
						json.put("msg", "修改成功");
					}else{
						json.put("msg", "修改失败");
					}
				}
			}
			if("course".equals(tbname)){	//课程信息
				String id=request.getParameter("id");
				String cno=request.getParameter("cno");
				String cname=request.getParameter("cname");
				if(db.checkTrue("select id from course where cno='"+cno+"' and id!="+id)){
					json.put("msg", "课程编号已存在");
				}else{
					int bls=db.executeUpdate("update course set cno='"+cno+"',cname='"+cname+"' where id="+id);
					if(bls>0){
						json.put("msg", "修改成功");
					}else{
						json.put("msg", "修改失败");
					}
				}
			}
			if("courseplan".equals(tbname)){	//课程安排
				String id=request.getParameter("id");
				String terms_id=request.getParameter("terms_id");
				String classinfo_id=request.getParameter("classinfo_id");
				String course_id=request.getParameter("course_id");
				String teacher_id=request.getParameter("teacher_id");
				if(db.checkTrue("select id from courseplan where terms_id="+terms_id+" and classinfo_id="+classinfo_id+" and course_id="+course_id+" and id!="+id)){
					json.put("msg", "课程安排已存在");
				}else{
					int bls=db.executeUpdate("update courseplan set terms_id="+terms_id+",classinfo_id="+classinfo_id+",course_id="+course_id+",teacher_id="+teacher_id+" where id="+id);
					if(bls>0){
						json.put("msg", "修改成功");
					}else{
						json.put("msg", "修改失败");
					}
				}
			}
			if("adminInfo".equals(tbname)) {	//管理员修改个人资料
				System.out.println("修改管理资料");
				String id=request.getParameter("id");
				String name=request.getParameter("name");
				String newpwd=request.getParameter("newpwd");	
				String email=request.getParameter("email");
				int bls=db.executeUpdate("update admin set name='"+name+"',password='"+newpwd+"' where id="+id);
				if(bls>0){
					json.put("msg", "修改成功");
				}else{
					json.put("msg", "修改失败");
				}								
			}
			if("adminInfo2".equals(tbname)) {	//首次登录设置邮箱和密码
				System.out.println("修改管理资料");
				String id=request.getParameter("id");
				String name=request.getParameter("name");
				String newpwd=request.getParameter("newpwd");	
				String email=request.getParameter("email");
				int bls=db.executeUpdate("update admin set password='"+newpwd+"',email='"+email+"' where id="+id);
				if(bls>0){
					json.put("msg", "修改成功");
				}else{
					json.put("msg", "修改失败");
				}								
			}
			if("adInfo".equals(tbname)) {
				//git账号参数
				String gitUsername=request.getParameter("gitUsername");
				String TOKEN=request.getParameter("TOKEN");
				String CLIENT_ID=request.getParameter("CLIENT_ID");
				String CLIENT_SECRET=request.getParameter("CLIENT_SECRET");
				System.out.print("gitUsername="+gitUsername);
				int bls=db.executeUpdate("update admin set gitUsername='"+gitUsername+"',TOKEN='"+TOKEN+"',CLIENT_ID='"+CLIENT_ID+"',CLIENT_SECRET='"+CLIENT_SECRET+"' where id="+userid);
				if(bls>0){
					user ad=new user();
					List<user> alist=GetList.getlist(user.class, db.executeQuery("select * from admin where id="+userid));
					if(alist.size()>0){
						ad=alist.get(0);
					}
					session.setAttribute("userinfo", ad);
					json.put("msg", "修改成功");
					
				}else{
					json.put("msg", "修改失败");
				}
			}
			if("changeScore".equals(tbname)) {
				
				String id=request.getParameter("id");
				String score=request.getParameter("score");
				System.out.println(id);
				System.out.println(score);
				int bls=db.executeUpdate("update reposdate set score='"+score+"' where id="+id);
				if(bls>0){
					
					json.put("msg", "修改成功");
					
				}else{
					json.put("msg", "修改失败");
				}
			}
			
			/**
			 * 教师功能相关操作
			 */
			if("teaInfo".equals(tbname)) {	//教师修改个人资料
				String id=request.getParameter("id");
				String name=request.getParameter("name");
				String newpwd=request.getParameter("newpwd");
				String tphone=request.getParameter("tphone");
				String flag=request.getParameter("flag");
				
				
				System.out.print("id="+id+";name="+name+";newpwd="+newpwd+";tphone="+tphone+";flag="+flag);
				if("pwd".equals(flag)) {
					int bls=db.executeUpdate("update teacher set tName='"+name+"',tPwd='"+newpwd+"' where id="+id);
					if(bls>0){
						json.put("msg", "修改成功");
					}else{
						json.put("msg", "修改失败");
					}
				}else if("git".equals(flag)) {
					//git账号参数
					String gitUsername=request.getParameter("gitUsername");
					String TOKEN=request.getParameter("TOKEN");
					String CLIENT_ID=request.getParameter("CLIENT_ID");
					String CLIENT_SECRET=request.getParameter("CLIENT_SECRET");
					System.out.print("gitUsername="+gitUsername);
					int bls=db.executeUpdate("update teacher set gitUsername='"+gitUsername+"',TOKEN='"+TOKEN+"',CLIENT_ID='"+CLIENT_ID+"',CLIENT_SECRET='"+CLIENT_SECRET+"' where id="+id);
					if(bls>0){
						Teacher ad=new Teacher();
						List<Teacher> alist=GetList.getlist(Teacher.class, db.executeQuery("select * from teacher where id="+id));
						if(alist.size()>0){
							ad=alist.get(0);
						}
						session.setAttribute("userinfo", ad);
						json.put("msg", "修改成功");
						
					}else{
						json.put("msg", "修改失败");
					}
				}
				else {
					int bls=db.executeUpdate("update teacher set tPhone='"+tphone+"' where id="+id);
					if(bls>0){
						Teacher ad=new Teacher();
						List<Teacher> alist=GetList.getlist(Teacher.class, db.executeQuery("select * from teacher where id="+id));
						if(alist.size()>0){
							ad=alist.get(0);
						}
						session.setAttribute("userinfo", ad);
						json.put("msg", "修改成功");
						
					}else{
						json.put("msg", "修改失败");
					}
				}
				
			}
			if("teacher2".equals(tbname)) {	//教师首次登录设置邮箱和密码
				System.out.println("教师首次登录设置邮箱和密码");
				String id=request.getParameter("id");
				
				String newpwd=request.getParameter("newpwd");	
				String email=request.getParameter("email");
				int bls=db.executeUpdate("update teacher set tPwd='"+newpwd+"',email='"+email+"' where id="+id);
				if(bls>0){
					json.put("msg", "修改成功");
				}else{
					json.put("msg", "修改失败");
				}								
			}
			if("teatask".equals(tbname)){	//课程安排
				String teatask_id=request.getParameter("teatask_id");
								
				String title=request.getParameter("title");
				String remark=request.getParameter("remark");
				String deadline=request.getParameter("deadline");
				int bls=db.executeUpdate("update teatask set title='"+title+"' ,remark='"+remark+"',deadline='"+deadline+"' where id="+teatask_id);
				if(bls>0){
					json.put("msg", "修改成功");
				}else{
					json.put("msg", "修改失败");
				}				
			}
			if("Tscore".equals(tbname)){	//更新成绩
				String stutask_id=request.getParameter("stutask_id");								
				String score=request.getParameter("score");
				int bls=db.executeUpdate("update stutask set score='"+score+"' where id="+stutask_id);
				if(bls>0){
					json.put("msg", "修改成功");
				}else{
					json.put("msg", "修改失败");
				}				
			}
			
			/**
			 * 学生功能相关操作
			 */
			if("stuInfo".equals(tbname)) {	///学生修改个人资料
				String id=request.getParameter("id");
				String name=request.getParameter("name");
				String newpwd=request.getParameter("newpwd");
				String sphone=request.getParameter("sphone");
				String flag=request.getParameter("flag");
				if("pwd".equals(flag)) {
					int bls=db.executeUpdate("update students set sname='"+name+"',spassword='"+newpwd+"' where id="+id);
					if(bls>0){
						json.put("msg", "修改成功");
					}else{
						json.put("msg", "修改失败");
					}
				}else {
					int bls=db.executeUpdate("update students set sphone='"+sphone+"' where id="+id);
					if(bls>0){
						json.put("msg", "修改成功");
						json.put("sphone",sphone);
					}else{
						json.put("msg", "修改失败");
					}
				}
			}
			if("students2".equals(tbname)) {	//学生首次登录设置邮箱和密码
				String id=request.getParameter("id");
				
				String newpwd=request.getParameter("newpwd");	
				String email=request.getParameter("email");
				int bls=db.executeUpdate("update students set spassword='"+newpwd+"',email='"+email+"' where id="+id);
				if(bls>0){
					json.put("msg", "修改成功");
				}else{
					json.put("msg", "修改失败");
				}								
			}
			if("stutask".equals(tbname)){	//更新学生实验信息
				String stutask_id=request.getParameter("stutask_id");								
				String remark=request.getParameter("remark");
				int bls=db.executeUpdate("update stutask set stusy_remark='"+remark+"' where id="+stutask_id);
				if(bls>0){
					json.put("msg", "修改成功");
				}else{
					json.put("msg", "修改失败");
				}				
			}
			
	   }
		PrintWriter out=response.getWriter();
		out.print(json.toString());
		out.flush();
		out.close();
	}
			
}
