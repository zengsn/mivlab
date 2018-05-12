package teachingSys.svlt;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import teachingSys.been.Classinfo;
import teachingSys.utils.Dbhelper;
import net.sf.json.JSONObject;

import com.wm.utils.DbConn;
import com.wm.utils.GetList;

public class GetCSvlt extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GetCSvlt() {
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
		String id=request.getParameter("termsid");
		Object userid=session.getAttribute("userid");
		DbConn db=Dbhelper.getDb();
		String sql="select * from classinfo where id in(select classinfo_id from courseplan where teacher_id="+userid+" and terms_id="+id+")";
		System.out.println(sql);
		List<Classinfo> cllist=GetList.getlist(Classinfo.class, db.executeQuery(sql));
		PrintWriter out=response.getWriter();
		JSONObject json =new JSONObject();
		json.put("cllist", cllist);
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
