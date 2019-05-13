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

import bean.Students;
import bean.Stutask;
import bean.TeaTask;
import bean.Teacher;
import bean.indexContent;
import bean.user;
import net.sf.json.JSONObject;
import utils.Dbhelper;

/**
 * Servlet implementation class LoginSvlt
 */
@WebServlet("/LoginSvlt")
public class LoginSvlt extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginSvlt() {
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
				//获取用户登录信息
				String uname=request.getParameter("username");
				String upassword=request.getParameter("password");
				String utype=request.getParameter("userType");
				//System.out.print("uname="+uname+";pwd="+upassword+";type="+utype);
				//创建json对象
				JSONObject json=new JSONObject();
				//创建数据库操作对象
				DbConn db=Dbhelper.getDb();
				//判断是否已有用户登录
				Object userid=session.getAttribute("userid");
				
				String str = String.valueOf(userid);
				if(userid!=null ){
					System.out.println("已登录");
					System.out.println("uname="+uname);
					System.out.println("str="+str);
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
					
					
					//admin用户
					if( str.equals(uname) && "admin".equals(utype)) {
						System.out.println("要登录账号与已登录账号相同");
						//如果登录账号与已登录账号相同，且口令正确，则跳转到对应的页面
						user ad=new user();
						List<user> alist=GetList.getlist(user.class, db.executeQuery("select * from admin where id="+userid));
						if(alist.size()>0){
							ad=alist.get(0);								
						}
						if(ad.getId()==Integer.parseInt(uname)  && upassword.equals(ad.getPassword())) {
							
							//把用户登录信息写入到session对象
							System.out.println("把用户登录信息写入到session对象=");
							session.setAttribute("userid", Integer.parseInt(uname));
							session.setAttribute("utype", utype);
							session.setAttribute("userinfo", ad);
							session.setAttribute("userNum", ad.getId());
							session.setAttribute("userTable", "admin");
							System.out.println("email="+ad.getEmail());
							String email=ad.getEmail();
							if("0".equals(email)) {
								System.out.println("msg=2");
								json.put("msg", 2);								
							}else {
								json.put("msg", 1);
							}
																					
						}
						else {
							json.put("msg", "账号或密码错误");
						}
					}else {
						   json.put("msg", "请退出已登录账号，再重新登录");
					}
					
					//学生用户
					if("stu".equals(utype) ) {
						
						String cksql="select id from students where sno='"+uname+"' and spassword='"+upassword+"'";
						//判断是否是正确的账号及口令
						if(db.checkTrue(cksql)){
							
							//获取登录用户id
							Object id=db.getOnlyOne(cksql);
							Students ad=new Students();
							List<Students> alist=GetList.getlist(Students.class, db.executeQuery("select students.*,classno,classname from students,classinfo where classinfo_id=classinfo.id and students.id="+id));
							if(alist.size()>0){
								ad=alist.get(0);
							}				
							//判断是否与已登录账号为同一账号
							if(userid.equals(ad.getId())) {
								System.out.println("要登录账号与已登录账号相同");
								
								//把用户登录信息写入到session对象
								System.out.println("把用户登录信息写入到session对象=");
								session.setAttribute("userid", ad.getId());
								session.setAttribute("utype", utype);
								session.setAttribute("userinfo", ad);
								session.setAttribute("userNum", uname);
								session.setAttribute("userTable", "students");
								
								String email=ad.getEmail();
								if("0".equals(email)) {
									System.out.println("msg=2");
									json.put("msg", 2);								
								}else {
									json.put("msg", 1);
								}
								//任务进度提醒
								SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
						        System.out.println(df.format(new Date()));// new Date()为获取当前系统时间

								String nowtime=df.format(new Date());
								
								List<TeaTask> TaskTip=GetList.getlist(TeaTask.class, db.executeQuery("select teatask.*,termname,classname,cname,tName from courseplan,teatask,classinfo,course,teacher,terms where classinfo.id=teatask.classinfo_id and teatask.terms_id=terms.id and teatask.teacher_id=teacher.id and  course.id=teatask.course_id and deadline > '"+nowtime+"' and classinfo.id in (select classinfo_id from students where id="+id+") group by id order by id desc"));
								System.out.println("截止日期提示="+TaskTip.size());
								
								session.setAttribute("TaskTipSize", TaskTip.size());
								session.setAttribute("TaskTipFlag", "1");
								System.out.println("学生用户登录，TaskTipFlag=1");
							}else {
								json.put("msg", "请退出已登录账号，再重新登录");
							}						    
						}
						else {
							json.put("msg", "账号或密码错误");
						}
				   }
					
					//教师用户
				   if("tea".equals(utype) ) {
						
						String cksql="select id from teacher where tNo='"+uname+"' and tPwd='"+upassword+"'";
						//判断是否是正确的账号及口令
						if(db.checkTrue(cksql)){
							//获取登录用户id
							Object id=db.getOnlyOne(cksql);
							Teacher ad=new Teacher();
							List<Teacher> alist=GetList.getlist(Teacher.class, db.executeQuery("select * from teacher where id="+id));
							if(alist.size()>0){
								ad=alist.get(0);
							}
							
							if(userid.equals(ad.getId())) {
								System.out.println("要登录账号与已登录账号相同");
								session.setAttribute("userinfo", ad);							
								json.put("msg", 1);
								//把用户登录信息写入到session对象
								System.out.println("把用户登录信息写入到session对象=");
								session.setAttribute("userid", ad.getId());
								session.setAttribute("utype", utype);
								session.setAttribute("userinfo", ad);
								session.setAttribute("userNum", uname);
								session.setAttribute("userTable", "teacher");
								System.out.println("email="+ad.getEmail());
								String email=ad.getEmail();
								if("0".equals(email)) {
									System.out.println("msg=2");
									json.put("msg", 2);								
								}else {
									json.put("msg", 1);
								}
							}else {
								json.put("msg", "请退出已登录账号，再重新登录");
							}
							
						}
						else {
							json.put("msg", "账号或密码错误");
						}
				   }
				}else {
					//定义数据库操作语句
					String cksql="";
					//判断用户身份确定操作语句
					if("admin".equals(utype)){
						cksql="select id from admin where id='"+uname+"' and password='"+upassword+"'";
					}
					if("stu".equals(utype)){
						cksql="select id from students where sno='"+uname+"' and spassword='"+upassword+"'";
					}
					if("tea".equals(utype)){
						cksql="select id from teacher where tNo='"+uname+"' and tPwd='"+upassword+"'";
					}				
					
					if("".equals(cksql)){
						json.put("msg", "系统错误");
					}else{
						
						//判断用户名和密码是否正确
						if(db.checkTrue(cksql)){
							
							//获取登录用户id
							Object id=db.getOnlyOne(cksql);
							System.out.print("id="+id);
							//把用户登录信息写入到session对象
							session.setAttribute("userid", id);
							session.setAttribute("utype", utype);
							
							if("admin".equals(utype)){
								user ad=new user();
								List<user> alist=GetList.getlist(user.class, db.executeQuery("select * from admin where id="+id));
								if(alist.size()>0){
									ad=alist.get(0);								
								}
									session.setAttribute("userNum", ad.getId());
									session.setAttribute("userinfo", ad);
									
									System.out.println("size="+alist.size());
									System.out.println("adName="+ad.getName());
									session.setAttribute("userTable", "admin");
									String email=ad.getEmail();
									if("0".equals(email)) {
										System.out.print("执行email="+email);
										json.put("msg", 2);
										
									}else {
										json.put("msg", 1);
									}
									
							}
							if("stu".equals(utype)){
								Students ad=new Students();
								List<Students> alist=GetList.getlist(Students.class, db.executeQuery("select students.*,classno,classname from students,classinfo where classinfo_id=classinfo.id and students.id="+id));
								if(alist.size()>0){
									ad=alist.get(0);
								}
								session.setAttribute("userid", ad.getId());
								session.setAttribute("utype", utype);
								session.setAttribute("userinfo", ad);
								session.setAttribute("userNum",uname );
								session.setAttribute("userTable", "students");
								System.out.println("email="+ad.getEmail());
								String email=ad.getEmail();
								if("0".equals(email)) {
									System.out.println("msg=2");
									json.put("msg", 2);								
								}else {
									json.put("msg", 1);
								}
								//任务进度提醒
								SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
						        System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
	
								String nowtime=df.format(new Date());
								
								List<TeaTask> TaskTip=GetList.getlist(TeaTask.class, db.executeQuery("select teatask.*,termname,classname,cname,tName from courseplan,teatask,classinfo,course,teacher,terms where classinfo.id=teatask.classinfo_id and teatask.terms_id=terms.id and teatask.teacher_id=teacher.id and  course.id=teatask.course_id and deadline > '"+nowtime+"' and classinfo.id in (select classinfo_id from students where id="+id+") group by id order by id desc"));
								System.out.println("截止日期提示="+TaskTip.size());
								
								session.setAttribute("TaskTipSize", TaskTip.size());
								
							}
							if("tea".equals(utype)){
								Teacher ad=new Teacher();
								List<Teacher> alist=GetList.getlist(Teacher.class, db.executeQuery("select * from teacher where id="+id));
								if(alist.size()>0){
									ad=alist.get(0);
								}
								session.setAttribute("userid", ad.getId());
								session.setAttribute("utype", utype);
								session.setAttribute("userinfo", ad);
								session.setAttribute("userNum",uname );
								session.setAttribute("userTable", "teacher");
								System.out.println("email="+ad.getEmail());
								String email=ad.getEmail();
								if("0".equals(email)) {
									System.out.println("msg=2");
									json.put("msg", 2);								
								}else {
									json.put("msg", 1);
								}
							}
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
					
					}else{
						json.put("msg", "账号或密码错误");
					}                                         
				}
	
			}
				PrintWriter out=response.getWriter();
				out.print(json.toString());
				out.flush();
				out.close();
	}
	

}
