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
		
		/*存储GitHub数据的路径测试-begin*/
		 File file = new File("./");
		 file.getCanonicalPath();
		 String path= file.getCanonicalPath();
		 path=path+"/src/json/";
	     System.out.print(path);
		 //gitrepostats.ReadCSV.main(1,"org","proj",1,1);
		// System.out.print("ok");
		 //System.out.println();
		 /*存储GitHub数据的路径测试-end */
		 
		 /*存储到当前项目目录的 路径测试-begin	*/		
		//String uploadPath = request.getServletContext().getRealPath("./") + File.separator + UPLOAD_DIRECTORY;
	     String uploadPath = request.getServletContext().getRealPath("./") + File.separator + UPLOAD_DIRECTORY;
		 System.out.print("uploadPath="+uploadPath+"****");
		 System.out.println();
		 
		//取得根目录路径  
		 String realPath=getServletContext().getRealPath("/");//项目绝对路径

		 
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
