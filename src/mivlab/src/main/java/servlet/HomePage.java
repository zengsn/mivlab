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

import bean.Snav;
import bean.indexContent;
import bean.navList;
import utils.Dbhelper;

/**
 * Servlet implementation class HomePage
 */
@WebServlet("/HomePage")
public class HomePage extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomePage() {
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
		
		//设置编码方式
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		//获取数据库操作对象
		DbConn db=Dbhelper.getDb();
		//获取session对象
		HttpSession session=request.getSession();
		
		
		//获取主菜单
		List<navList> navlist=GetList.getlist(navList.class, db.executeQuery("select * from fnav"));
		session.setAttribute("navlist", navlist);
		//System.out.print(navlist.get(0).getId());
		//获取二级菜单
		List<Snav> snavlist=GetList.getlist(Snav.class, db.executeQuery("select * from snav order by fnav_id asc"));
		//System.out.print(snavlist.get(0).getFnav_id());				
		session.setAttribute("snavlist", snavlist);
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
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
				
	
	}
}
