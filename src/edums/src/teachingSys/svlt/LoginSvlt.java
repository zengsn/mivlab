package teachingSys.svlt;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import teachingSys.been.Admin;
import teachingSys.been.Students;
import teachingSys.been.Teacher;
import teachingSys.utils.Dbhelper;

import com.wm.utils.DbConn;
import com.wm.utils.GetList;

import net.sf.json.JSONObject;
public class LoginSvlt extends HttpServlet {
	/**
	* Constructor of the object.
	*/
	public LoginSvlt() {
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
		//获取用户登录信息
		String uname=request.getParameter("uname");
		String upassword=request.getParameter("upassword");
		String utype=request.getParameter("utype");
		//创建json对象
		JSONObject json=new JSONObject();
		//创建数据库操作对象
		DbConn db=Dbhelper.getDb();
		//定义数据库操作语句
		String cksql="";
		//判断用户身份确定操作语句
		if("gly".equals(utype)){
			cksql="select id from admin where uname='"+uname+"' and upassword='"+upassword+"'";
		}
		if("stu".equals(utype)){
			cksql="select id from students where sno='"+uname+"' and spassword='"+upassword+"'";
		}
		if("tea".equals(utype)){
			cksql="select id from teacher where tno='"+uname+"' and tpassword='"+upassword+"'";
		}
		if("".equals(cksql)){
			json.put("msg", "系统错误");
		}else{
			//判断用户名和密码是否正确
			if(db.checkTrue(cksql)){
				json.put("msg", 1);
				//获取登录用户id
				Object id=db.getOnlyOne(cksql);
				//把用户登录信息写入到session对象
				session.setAttribute("userid", id);
				session.setAttribute("utype", utype);
				if("gly".equals(utype)){
					Admin ad=new Admin();
					List<Admin> alist=GetList.getlist(Admin.class, db.executeQuery("select * from admin where id="+id));
					if(alist.size()>0){
						ad=alist.get(0);
					}
					session.setAttribute("userinfo", ad);
				}
				if("stu".equals(utype)){
					Students ad=new Students();
					List<Students> alist=GetList.getlist(Students.class, db.executeQuery("select students.*,classno,classname from students,classinfo where classinfo_id=classinfo.id and students.id="+id));
					if(alist.size()>0){
						ad=alist.get(0);
					}
					session.setAttribute("userinfo", ad);
				}
				if("tea".equals(utype)){
					Teacher ad=new Teacher();
					List<Teacher> alist=GetList.getlist(Teacher.class, db.executeQuery("select * from teacher where id="+id));
					if(alist.size()>0){
						ad=alist.get(0);
					}
					session.setAttribute("userinfo", ad);
				}
			}else{
				json.put("msg", "账号或密码错误");
			}
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
