package servlet;

import java.io.File;
import java.io.IOException;
import java.net.URL;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Testfilepath
 */
@WebServlet("/Testfilepath")
public class Testfilepath extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private static final String UPLOAD_DIRECTORY = "upload";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Testfilepath() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		/*�洢GitHub���ݵ�·������-begin*/
		 File file = new File("./");
		 file.getCanonicalPath();
		 String path= file.getCanonicalPath();
		 path=path+"/src/json/";
	     System.out.print(path);
		 //gitrepostats.ReadCSV.main(1,"org","proj",1,1);
		// System.out.print("ok");
		 //System.out.println();
		 /*�洢GitHub���ݵ�·������-end */
		 
		 /*�洢����ǰ��ĿĿ¼�� ·������-begin	*/		
		//String uploadPath = request.getServletContext().getRealPath("./") + File.separator + UPLOAD_DIRECTORY;
	     String uploadPath = request.getServletContext().getRealPath("./") + File.separator + UPLOAD_DIRECTORY;
		 System.out.print("uploadPath="+uploadPath+"****");
		 System.out.println();
		 
		//ȡ�ø�Ŀ¼·��  
		 String realPath=getServletContext().getRealPath("/");//��Ŀ����·��

		 
		 System.out.print("realPath="+realPath+"****");
		 System.out.println();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
