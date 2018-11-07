package servlet;

import java.io.IOException;
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
		
		//���ñ��뷽ʽ
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		//��ȡ���ݿ��������
		DbConn db=Dbhelper.getDb();
		//��ȡsession����
		HttpSession session=request.getSession();
		
			//��ȡ���˵�
			List<navList> navlist=GetList.getlist(navList.class, db.executeQuery("select * from fnav"));
			session.setAttribute("navlist", navlist);
			//System.out.print(navlist.get(0).getId());
			//��ȡ�����˵�
			List<Snav> snavlist=GetList.getlist(Snav.class, db.executeQuery("select * from snav order by fnav_id asc"));
			//System.out.print(snavlist.get(0).getFnav_id());				
			session.setAttribute("snavlist", snavlist);
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
			//System.out.print(a.getTitle());			
			//response.sendRedirect("/mivlab/indexShow.jsp");
			request.getRequestDispatcher("index.jsp").forward(request, response);
				
	}

}
