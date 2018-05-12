package teachingSys.svlt;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import teachingSys.been.Students;
import teachingSys.been.Syinfo;
import teachingSys.utils.Dbhelper;

import com.wm.utils.DbConn;
import com.wm.utils.GetList;

public class GetsySvlt extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GetsySvlt() {
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

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		String classid=request.getParameter("classid");
		String cid=request.getParameter("cid");
		String termsid=request.getParameter("termsid");		
		Object userid=session.getAttribute("userid");
		DbConn db=Dbhelper.getDb();
		String sql="select id from courseplan where terms_id="+termsid+" and course_id="+cid+" and classinfo_id="+classid;
		System.out.println(sql);
		Object cpid=db.getOnlyOne(sql);
		List<Syinfo> clist=GetList.getlist(Syinfo.class, db.executeQuery("select * from syinfo where courseplan_id="+cpid));
		PrintWriter out=response.getWriter();
		JSONObject json =new JSONObject();
		json.put("clist", clist);
		out.print(json.toString());
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
