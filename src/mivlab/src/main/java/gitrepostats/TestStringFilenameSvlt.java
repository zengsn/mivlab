package gitrepostats;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestStringFilenameSvlt
 */
@WebServlet("/TestStringFilenameSvlt")
public class TestStringFilenameSvlt extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//用于测试：提取filename中的学号
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestStringFilenameSvlt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	TestStringFilename.main();
		String old="C://Users/Aruan/Desktop/result.csv";
		String newpath="E://result.csv";
		 utils.CopyFileUtils.copyFile(old,newpath);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
