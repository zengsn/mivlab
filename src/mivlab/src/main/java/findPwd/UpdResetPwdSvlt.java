package findPwd;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wm.utils.DbConn;

import net.sf.json.JSONObject;
import utils.Dbhelper;

/**
 * Servlet implementation class UpdResetPwdSvlt
 */
@WebServlet("/UpdResetPwdSvlt")
public class UpdResetPwdSvlt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdResetPwdSvlt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		//获取session对象
		HttpSession session=request.getSession();
		//获取当前登录用户信息
		Object userid=session.getAttribute("userid");
		//创建json对象
		JSONObject json=new JSONObject();
		//创建数据库操作对象
		DbConn db=Dbhelper.getDb();
		//获取操作标识
		String tbname=request.getParameter("tbname");
		System.out.print("执行UpdResetPwdSvlt");
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
		PrintWriter out=response.getWriter();
		out.print(json.toString());
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
